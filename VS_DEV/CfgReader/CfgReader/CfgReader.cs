#define WIN64
using RGiesecke.DllExport;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;

namespace CfgReader
{
    public class DllEntry // This can be named anything you like
    {
        private static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

#if WIN64
        [DllExport("RVExtensionVersion", CallingConvention = CallingConvention.Winapi)]
#else
        [DllExport("_RVExtensionVersion@8", CallingConvention = CallingConvention.Winapi)]
#endif
        public static void RvExtensionVersion(StringBuilder output, int outputSize)
        {
            output.Append("1.1");
        }

#if WIN64
        [DllExport("RVExtension", CallingConvention = CallingConvention.Winapi)]
#else
        [DllExport("_RVExtension@12", CallingConvention = CallingConvention.Winapi)]
#endif
        public static void RVExtension(StringBuilder output, int outputSize, [MarshalAs(UnmanagedType.LPStr)] string path)
        {
            outputSize--; // Ensure that we don't exceed the maximum output size - it's a bit paranoid but you should keep it there
            string fileData;
            try
            {
                fileData = readFile(path);
            } catch (IOException e)
            {
                fileData = e.Message;
            }
            output.Append(fileData);
        }

#if WIN64
        [DllExport("RVExtensionArgs", CallingConvention = CallingConvention.Winapi)]
#else
        [DllExport("_RVExtensionArgs@20", CallingConvention = CallingConvention.Winapi)]
#endif
        public static int RvExtensionArgs(StringBuilder output, int outputSize,
            [MarshalAs(UnmanagedType.LPStr)] string path,
            [MarshalAs(UnmanagedType.LPArray, ArraySubType = UnmanagedType.LPStr, SizeParamIndex = 4)] string[] args, int argCount)
        {
            outputSize--; // Ensure that we don't exceed the maximum output size - it's a bit paranoid but you should keep it there
            string fileData;
            int code = 100;
            try
            {
                fileData = readFile(path);
                List<String> tmp = new List<string>();
                foreach (string keyVal in args)
                {
                    string pt = String.Format(@"({0}\s*\s?=\s*\s?)(.*)(\;\n?)",keyVal.Replace("\"",""));
                    Match match = Regex.Match(fileData, pt);
                    if (match.Length == 0)
                    {
                        tmp.Add("\"\"");
                        continue;
                    }
                    tmp.Add(match.Groups[2].Value);
                }
                fileData = "[" + String.Join(",", tmp.ToArray()) + "]";
            }
            catch (IOException e)
            {
                fileData = e.Message;
                code = 101;
            }
            output.Append(fileData);
            return code;
        }

        private static string readFile(string path)
        {
            StreamReader CfgReader = new StreamReader(path);
            string input = CfgReader.ReadToEnd();
            CfgReader.Close();

            var blockComments = @"/\*(.*?)\*/";
            var lineComments = @"//(.*?)\r?\n";

            return Regex.Replace(input,
                blockComments + "|" + lineComments,
                me => {
                    if (me.Value.StartsWith("/*") || me.Value.StartsWith("//"))
                        return me.Value.StartsWith("//") ? "\n" : "";
                    // Keep the literal strings
                    return me.Value;
                },
                RegexOptions.Singleline);
        }
    }
}