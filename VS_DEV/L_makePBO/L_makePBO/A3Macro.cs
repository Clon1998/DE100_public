using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace L_makePBO
{
    class A3Macro
    {
        private string macro;
        private string code;
        private string argStr;
        private int argCnt = 0;
        private ArrayList args = new ArrayList();
        private ArrayList regArray = new ArrayList();

        private readonly string argPattern = "([A-z0-9]+),?";

        public A3Macro(string macro,string argStr, string code)
        {
            this.macro = macro;
            this.argStr = argStr;

            MatchCollection matches = Regex.Matches(argStr, @argPattern);
            this.argCnt = matches.Count;
            int i = 1;
            foreach(Match m in matches)
            {
                string argName = m.Groups[1].ToString();
                this.args.Add(argName);
                this.regArray.Add("(.*)");
                code = Regex.Replace(code, Regex.Escape(argName), "$"+i);
                i++;
            }

            this.code = code.Replace("\r","");
        }
        /*
         * Replaces the Makro with the code
         */
        public string Replace(string input)
        {
            if (argCnt == 0)
                return Regex.Replace(input, Regex.Escape(macro), code);


            string pattern = Regex.Escape(macro + "(")+String.Join(",",this.regArray.ToArray())+ Regex.Escape(")");


            return Regex.Replace(input, pattern, this.code);
        }
        public string getCode()
        {
            return this.code;
        }
        public void setCode(string code)
        {
            this.code = code;
        }
    }
}
