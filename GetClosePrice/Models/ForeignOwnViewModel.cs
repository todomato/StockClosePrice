using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetClosePrice
{
    public class ForeignOwnViewModel
    {
        public ForeignOwnViewModel(string[] item, string type)
        {
            if (type == "sii")
            {
                this.Code = int.Parse(item[0]) ;
                this.A_Own = IsNumeric(item[5]) ? (long)float.Parse(item[5]) : 0;
                this.A_OwnP = IsNumeric(item[7]) ? double.Parse(item[7]) : 0;
            }
        }

        public ForeignOwnViewModel()
        {
        }

        public DateTime Date { get; set; }
        public int Code { get; set; }
        public long A_Own { get; set; }
        public double A_OwnP { get; set; }
     

        private static bool IsNumeric(string s)
        {
            float output;
            return float.TryParse(s, out output);
        }
    }
}
