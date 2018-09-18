using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace L_makePBO
{
    /**
    * Class to store macros
    * 
    */
    class MacroStorage : Dictionary<string, A3Macro>
    {

        public void CheckInternalMacros()
        {
            foreach (KeyValuePair<string, A3Macro> entry in this)
            {
                CheckMacro(entry.Value);
            }
        }
        private void CheckMacro(A3Macro a3Macro)
        {
            string code = a3Macro.getCode();
            foreach (KeyValuePair<string, A3Macro> entry in this)
            {
                if (Regex.IsMatch(code, @"\b" + Regex.Escape(entry.Key)))
                {
                    code = entry.Value.Replace(code);
                    a3Macro.setCode(code);
                }

            }
        }
    }
}
