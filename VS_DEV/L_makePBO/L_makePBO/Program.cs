using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using System.Collections;

namespace L_makePBO
{
    class Program
    {
        static void Main(string[] args)
        {
            //Check the arguments
            checkArgs(args);

            string missionPath = args[0];
            string decryptPath = args[1];
            string makePboPath = args[2];

            write("Obfuscator Vorgang wird gestartet.", "green");
            write("Mit Enter bestätigen.", "", true);

            MacroHandler macroHandler = new MacroHandler();
            Obfuscator obfu = new Obfuscator(missionPath,macroHandler);
            
            foreach (string file in Directory.GetFiles(missionPath, "*", SearchOption.AllDirectories))
            {
                obfu.obfuFile(file);
            }

            write("Obfuscator Vorgang abgeschlossen", "green");
            write("Mit Enter bestätigen.", "", true);
            Console.Clear();
            write("Crypt Vorgang wird gestartet.", "green");
            write("Mit Enter bestätigen.", "", true);

            Crypt crypt = new Crypt(decryptPath);
            StreamReader cfgReader = new StreamReader(missionPath+"\\cfgs\\cfg_Functions.hpp");
            StreamWriter cfgWriter = new StreamWriter(obfu.obfuPath+"\\cfgs\\cfg_crypt.hpp");
            cfgWriter.WriteLine("class LucianCryptSys {");
            string line;
            string tag = "";
            string fileP = "";
            string crntClass = "";
            while ((line = cfgReader.ReadLine()) != null)
            {
                bool containsClass = Regex.Match(line.ToLower(), "(\\s)?class").Success;
                bool containsTag = Regex.Match(line.ToLower(), "tag\\s?=\\s?\\\"").Success;
                bool containsPath = Regex.Match(line.ToLower(), "file\\s?=\\s?\\\"").Success;
                bool containsEnd = Regex.Match(line.ToLower(), ".*};-*").Success;

                if (tag != "" && fileP != "" && containsClass)
                {
                    var regex = new Regex("\\s.*class\\s?|\\s?{};\\s?", RegexOptions.Multiline);
                    crntClass = regex.Replace(line, "");
                    if (crntClass.ToLower().Contains("preinit"))
                    {
                        continue;
                    }
                    try
                    {

                        write(obfu.obfuPath + "\\" + fileP + "\\fn_" + crntClass + ".sqf" + " wird versucht umzuwandeln");
                        cfgWriter.WriteLine("\tclass " + crntClass + " {");
                        cfgWriter.WriteLine("\t\ttag = \"" + tag + "\";\n\t\tcrypted = \"" + fileP + "\\" + crypt.crpytSqf(obfu.obfuPath + "\\" + fileP + "\\fn_" + crntClass + ".sqf") + "\";");
                        cfgWriter.WriteLine("\t};");
                        write(obfu.obfuPath + "\\" + fileP + "\\fn_" + crntClass + ".sqf" + " wurde umgewandelt");
                        continue;
                    }
                    catch (Exception e)
                    {
                        write(e.Message, "red");
                        write("Mit einer beliebiger Taste beenden.","white",true);
                        return;
                    }
                }

                if (containsTag)
                {
                    var regex = new Regex(".*tag\\s?=\\s\"|\\\";\\s?", RegexOptions.Multiline);
                    tag = regex.Replace(line, "");
                    continue;
                }

                if (containsPath)
                {
                    var regex = new Regex(".*file\\s?=\\s\"|\\\";\\s?", RegexOptions.Multiline);
                    fileP = regex.Replace(line, "");
                    continue;
                }

                if (containsEnd)
                {
                    if (fileP != "")
                    {
                        fileP = "";
                        continue;
                    }
                    tag = "";
                }
            }
            cfgWriter.WriteLine("};");
            cfgWriter.Close();
            cfgReader.Close();
            StreamWriter fncWriter = new StreamWriter(obfu.obfuPath + "\\cfgs\\cfg_Functions.hpp");
            fncWriter.WriteLine("#include \"cfg_crypt.hpp\"");
            fncWriter.WriteLine("class CfgFunctions {\n\tclass Life_Client_Core {\n\t\ttag = \"life\";\n\t\tclass Functions {\n\t\t\tfile = \"core\\functions\";\n\t\t\tclass deCrypt {preInit = 1;};\n\t\t};\n\t};\n};");
            fncWriter.Close();
            write("Crypt Vorgang abgeschlossen", "green");
            write("Mit Enter bestätigen.", "", true);
        }

        public static void write(string msg = "", string color = "", bool wait = false)
        {
            switch (color)
            {
                case "red":
                    Console.ForegroundColor = ConsoleColor.Red;
                    break;

                case "blue":
                    Console.ForegroundColor = ConsoleColor.Blue;
                    break;

                case "green":
                    Console.ForegroundColor = ConsoleColor.Green;
                    break;

                default:
                    Console.ForegroundColor = ConsoleColor.White;
                    break;
            }

            Console.WriteLine(msg);
            if (wait)
            {
                Console.ReadLine();
            }
        }

        public static void exit(string msg = "")
        {
            write("Ein Problem ist aufgetreten, " + typeof(Program).Namespace + " wird beendet.", "red");
            if (msg != "")
            {
                write(msg);
            }
            write("Mit Enter schließen", "", true);
            Environment.Exit(0);
        }

        static void checkArgs(string[] args)
        {
            if (args.Length != 3)
            {
                exit("3 Parameter erwartet, " + args.Length + " erhalten");
            }

            if (!Directory.Exists(args[0]))
            {
                exit("Der angegebene Missionspfad existiert nicht");
            }

            if (!File.Exists(args[1]))
            {
                exit("Die fn_deCryptFiles.sqf konnte nicht gefunden werden");
            }

            if (!File.Exists(args[2]))
            {
                exit("Die makePbo.exe konnte nicht gefunden werden");
            }
        }
    }

    class Obfuscator
    {
        public string missionPath;
        public string missionName;
        public string obfuPath;
        public string obfuName;
        private MacroHandler macroHandler;
        public Obfuscator(string arg, MacroHandler macroHandler)
        {
            this.macroHandler = macroHandler;
            missionPath = arg;
            missionName = Path.GetFileName(arg);
            obfuPath = Directory.GetParent(missionPath).FullName + "\\" + missionName + "_Obfu";
            obfuName = missionName + "_Obfu";
            if (Directory.Exists(obfuPath))
            {
                Directory.Delete(obfuPath, true);
            }
            Directory.CreateDirectory(obfuPath);
        }

        public bool obfuFile(string file)
        {
            string fName = Path.GetFileNameWithoutExtension(file);
            string fExt = Path.GetExtension(file);
            string fPath = Path.GetDirectoryName(file);

            string oPath = fPath.Replace(missionName, obfuName);
            string oFile = oPath + "\\" + fName + fExt;

            Program.write(fName + fExt + " wird verarbeitet");

            if (!Directory.Exists(oPath))
            {
                Directory.CreateDirectory(oPath);
            }
            if (File.Exists(oFile))
            {
                File.Delete(oFile);
            }

            switch (fExt.ToLower())
            {
                case ".sqf":
                    SQF(file, oFile);
                    Program.write(fName + fExt + " wurde sqfObfu");
                    break;
                default:
                    Copy(file, oFile);
                    Program.write(fName + fExt + " wurde kopiert");
                    break;
            }

            return true;
        }

        private void SQF(string file, string oFile)
        {
            var blockComments = @"/\*(.*?)\*/";
            var lineComments = @"//(.*?)\r?\n";
            var strings = @"""((\\[^\n]|[^""\n])*)""";
            var verbatimStrings = @"@(""[^""]*"")+";
            StreamWriter writer = new StreamWriter(oFile);

            string input = macroHandler.InsertMacros(file);
            //schnittstelle für MACRO!

            string edited = Regex.Replace(input,
                blockComments + "|" + lineComments + "|" + strings + "|" + verbatimStrings,
                me => {
                    if (me.Value.StartsWith("/*") || me.Value.StartsWith("//"))
                        return me.Value.StartsWith("//") ? "" : "";
                    // Keep the literal strings
                    return me.Value;
                },
                RegexOptions.Singleline).Replace(Environment.NewLine, "");
            writer.Write(edited);
            writer.Close();
        }

        private void Copy(string file, string oFile)
        {
            File.Copy(file, oFile);
        }
    }

    class Crypt
    {
        private Random random = new Random();
        public string cryptKey;
        private List<int> lcryptKey;
        public Crypt(string decryptPath) {
            cryptKey = RandomString(64);
            lcryptKey = toArray(cryptKey);
            Program.write("CryptKey: "+cryptKey);
            string bakPath = Path.GetDirectoryName(decryptPath) + "\\" + Path.GetFileNameWithoutExtension(decryptPath) + ".bak";
            if (File.Exists(bakPath))
            {
                File.Delete(bakPath);
            }
            File.Copy(decryptPath,bakPath);

            var regex = new Regex("private _key = .*;", RegexOptions.Multiline);
            string result = regex.Replace(File.ReadAllText(decryptPath), "private _key = \"" + cryptKey + "\";");
            File.WriteAllText(decryptPath, result);
        }

        private List<int> toArray(string input)
        {
            return input.Select(c => (int)c).ToList();
        }

        private string toString(List<int> input)
        {
            IEnumerable<char> ret = input.Select(c => (char)c);
            return String.Concat(ret);
        }

        public string crpytSqf(string path)
        {
            if (!File.Exists(path))
                throw new Exception("Die Datei im Pfad "+path+" existiert nicht. Bitte überprüfe ob die Datei existiert und ob sie richtig in der CfgFunctions definiert ist.");
            string source = File.ReadAllText(path);
            string folder = Path.GetDirectoryName(path);
            string cName = RandomString(32) + ".de100";
            string cPath = folder + "\\" + cName;
            File.Delete(path);

            while (File.Exists(cPath))
            {
                cName = RandomString(32) + ".de100";
                cPath = folder + "\\" + cName;
            }
            File.WriteAllText(cPath, lCrypt(source));
            return cName;
        }

        private string lCrypt(string input)
        {
            List<int> iArray = toArray(input);
            int kCount = lcryptKey.Count()-1;
            int iCount = iArray.Count();
            for (int i = 0; i < iCount; i++)
            {
                iArray[i] = iArray[i] + (i % (lcryptKey[i % kCount])) + lcryptKey[kCount - (i % kCount)];
            }
            return toString(iArray);
        }

        private string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}
