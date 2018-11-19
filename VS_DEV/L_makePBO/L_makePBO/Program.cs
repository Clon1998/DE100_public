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

            Obfuscator obfuscator = new Obfuscator(missionPath);

            obfuscator.Obfuscate(Directory.GetFiles(missionPath, "*", SearchOption.AllDirectories));

            write("Obfuscator Vorgang abgeschlossen", "green");
            write("Mit Enter bestätigen.", "", true);
            Console.Clear();
            write("Crypt Vorgang wird gestartet.", "green");
            write("Mit Enter bestätigen.", "", true);

            Crypt crypt = new Crypt(decryptPath);
            StreamReader cfgReader = new StreamReader(missionPath+"\\cfgs\\cfg_Functions.hpp");
            StreamWriter cfgWriter = new StreamWriter(obfuscator.obfuPath+"\\cfgs\\cfg_crypt.hpp");
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

                        write(obfuscator.obfuPath + "\\" + fileP + "\\fn_" + crntClass + ".sqf" + " wird versucht umzuwandeln");
                        cfgWriter.WriteLine("\tclass " + crntClass + " {");
                        cfgWriter.WriteLine("\t\ttag = \"" + tag + "\";\n\t\tcrypted = \"" + fileP + "\\" + crypt.crpytSqf(obfuscator.obfuPath + "\\" + fileP + "\\fn_" + crntClass + ".sqf") + "\";");
                        cfgWriter.WriteLine("\t};");
                        write(obfuscator.obfuPath + "\\" + fileP + "\\fn_" + crntClass + ".sqf" + " wurde umgewandelt");
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
            StreamWriter fncWriter = new StreamWriter(obfuscator.obfuPath + "\\cfgs\\cfg_Functions.hpp");
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
            if (args.Length < 3)
            {   
                exit("3 Parameter erwartet, " + args.Length + " erhalten. Erhaltene Parameter:"+String.Join(",",args));
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
}
