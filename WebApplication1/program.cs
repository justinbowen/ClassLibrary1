using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Net;

namespace WebApplication1
{
    public class program
    {
        public static void Main()
        {
            try
            {
                using (StreamReader sr = new StreamReader("c:\\txt\\CF_Abbie.txt"))
                {
                    String line = sr.ReadToEnd();
                    Console.WriteLine(line);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("The file could not be read:");
                Console.WriteLine(e.Message);
            }
        }


    }
}