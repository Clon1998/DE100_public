using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace L_makePBO
{
    /**
     * Class Handles the Arma 3 Makro replacements
     * 
     * 
     */
    class MacroHandler
    {
        public MacroStorage storedMacros = new MacroStorage();

        
        /**
         *  Scan for Makros
         */
        private void Scan(string file, string input)
        {
            string[] parrentIncludes = FindIncludes(file, input);


            for (int i = 0; i < parrentIncludes.Length; i++)
            {
                StreamReader reader = new StreamReader(file);
                string inputTmp = reader.ReadToEnd();
                inputTmp += "\n";
                reader.Close();
                Scan(parrentIncludes[i], inputTmp);
            }

            FindMacros(input);
        }

        private string[] FindIncludes(string file, string input)
        {
            string fDir = Path.GetDirectoryName(file);
            /**
             * ToDo: read the file Data^^
             */

            string patternIncludes = @"(#include)\s+\""(.*?\\?([A-z0-9]+.hpp))\""";
            string patternFolderDepth = @"..\\";

            string includeFilePath;

            MatchCollection matches = Regex.Matches(input, patternIncludes, RegexOptions.Multiline);
            List<string> includes = new List<string>();
            foreach (Match m in matches)
            {
                string includeRaw = m.Groups[2].ToString();
                string includeFileName = m.Groups[3].ToString();

                int rootAmnt = Regex.Matches(includeRaw, patternFolderDepth, RegexOptions.Multiline).Count;
                includeFilePath = fDir;

                for (int i = 0; i < rootAmnt; i++)
                {
                    includeFilePath = Directory.GetParent(includeFilePath).ToString();
                }
                includes.Add(includeFilePath + "\\" + includeFileName);
            }
            return includes.ToArray();
        }

        private void FindMacros(string input)
        {
            string pattern = @"#define\s+([A-z0-9]+)\(?([A-z0-9,]+)?\)?\s+(.*)\r?";
            MatchCollection matches = Regex.Matches(input, pattern, RegexOptions.Multiline);
            foreach (Match m in matches)
            {
                string macro = m.Groups[1].ToString();
                string args = m.Groups[2].ToString();
                string code = m.Groups[3].ToString();
                if (storedMacros.ContainsKey(macro))
                    continue;
                A3Macro a3Macro = new A3Macro(macro, args, code);
                storedMacros.Add(macro, a3Macro);
            }
            storedMacros.CheckInternalMacros();
        }

        public string InsertMacros(string file)
        {
            StreamReader reader = new StreamReader(file);
            string input = reader.ReadToEnd();
            input += "\n";
            reader.Close();

            Scan(file, input);

            foreach (KeyValuePair<string, A3Macro> entry in storedMacros)
            {
                if (Regex.IsMatch(input,@"\b"+Regex.Escape(entry.Key)))
                {
                    input = entry.Value.Replace(input);
                }
            }
            input = Regex.Replace(input, @"#.*", "");
            return input;
        }
    }
}
