using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetClosePrice
{
    public class ViewModel
    {
        public ViewModel(string[] item, string type)
        {
            if (type == "sii")
            {
                this.Code = int.Parse(item[0]) ;
                this.Name = item[1];
                this.Volumn = (int)float.Parse(item[2]);
                this.Count = (int)float.Parse(item[3]);
                this.Amount = (int)float.Parse(item[4]);
                this.Open = IsNumeric(item[5]) ? double.Parse(item[5]) : 0;
                this.High = IsNumeric(item[6]) ? double.Parse(item[6]) : 0;
                this.Low = IsNumeric(item[7]) ? double.Parse(item[7]) : 0;
                this.Close = IsNumeric(item[8]) ? double.Parse(item[8]) : 0;
            }
            else
            {
                this.Code = int.Parse(item[0]);
                this.Name = item[1];
                this.Count = (int)float.Parse(item[10]);
                this.Amount = (int)float.Parse(item[9]);
                this.Volumn = (int)float.Parse(item[8]);
                this.Open = IsNumeric(item[4]) ? double.Parse(item[4]) : 0;
                this.High = IsNumeric(item[5]) ? double.Parse(item[5]) : 0;
                this.Low = IsNumeric(item[6]) ? double.Parse(item[6]) : 0;
                this.Close = IsNumeric(item[2]) ? double.Parse(item[2]) : 0;
            }
        }
        public int Code { get; set; }
        public string Name { get; set; }
        public double Close { get; set; }
        public double Open { get; set; }
        public double High { get; set; }
        public double Low { get; set; }
        public int Volumn { get; set; }
        public int Count { get; set; }
        public int Amount { get; set; }

        private static bool IsNumeric(string s)
        {
            double output;
            return double.TryParse(s, out output);
        }
    }
}
