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
                this.Volumn = float.Parse(item[2]);
                this.Open = IsNumeric(item[5]) ? float.Parse(item[5]) : 0;
                this.High = IsNumeric(item[6]) ? float.Parse(item[6]) : 0;
                this.Low = IsNumeric(item[7]) ? float.Parse(item[7]) : 0;
                this.Close = IsNumeric(item[8]) ? float.Parse(item[8]) : 0;
            }
            else
            {
                this.Code = int.Parse(item[0]);
                this.Name = item[1];
                this.Volumn = float.Parse(item[8]);
                this.Open = IsNumeric(item[4]) ? float.Parse(item[4]) : 0;
                this.High = IsNumeric(item[5]) ? float.Parse(item[5]) : 0;
                this.Low = IsNumeric(item[6]) ? float.Parse(item[6]) : 0;
                this.Close = IsNumeric(item[2]) ? float.Parse(item[2]) : 0;
            }
        }
        public int Code { get; set; }
        public string Name { get; set; }
        public float Close { get; set; }
        public float Open { get; set; }
        public float High { get; set; }
        public float Low { get; set; }
        public float Volumn { get; set; }

        private static bool IsNumeric(string s)
        {
            float output;
            return float.TryParse(s, out output);
        }
    }
}
