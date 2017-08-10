using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetClosePrice
{
    public class ViewModel
    {
        private string[] item;

        public ViewModel(string[] item, string type)
        {
            if (type == "sii")
            {
                this.Code = item[0];
                this.Name = item[1];
                this.Volumn = item[2];
                this.Open = item[5];
                this.High = item[6];
                this.Low = item[7];
                this.Close = item[8];
            }
            else
            {
                this.Code = item[0];
                this.Name = item[1];
                this.Volumn = item[8];
                this.Open = item[4];
                this.High = item[5];
                this.Low = item[6];
                this.Close = item[2];
            }
        }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Close { get; set; }
        public string Open { get; set; }
        public string High { get; set; }
        public string Low { get; set; }
        public string Volumn { get; set; }

    }
}
