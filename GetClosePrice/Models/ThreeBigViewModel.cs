using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetClosePrice
{
    public class ThreeBigViewModel
    {
        public ThreeBigViewModel(string[] item, string type)
        {
            if (type == "sii")
            {
                this.Code = int.Parse(item[0]) ;
                this.Name = item[1];
                this.Type = "sii";
                this.A_Buy = IsNumeric(item[2]) ? (int)float.Parse(item[2]) : 0;
                this.A_Sell = IsNumeric(item[3]) ? (int)float.Parse(item[3]) : 0;
                this.A_Total = IsNumeric(item[4]) ? (int)float.Parse(item[4]) : 0;
                this.B_Buy = IsNumeric(item[5]) ? (int)float.Parse(item[5]) : 0;
                this.B_Sell = IsNumeric(item[6]) ? (int)float.Parse(item[6]) : 0;
                this.B_Total = IsNumeric(item[7]) ? (int)float.Parse(item[7]) : 0;
                this.CD_Total = IsNumeric(item[8]) ? (int)float.Parse(item[8]) : 0;
                this.C_Buy = IsNumeric(item[9]) ? (int)float.Parse(item[9]) : 0;
                this.C_Sell = IsNumeric(item[10]) ? (int)float.Parse(item[10]) : 0;
                this.C_Total = IsNumeric(item[11]) ? (int)float.Parse(item[11]) : 0;
                this.D_Buy = IsNumeric(item[12]) ? (int)float.Parse(item[12]) : 0;
                this.D_Sell = IsNumeric(item[13]) ? (int)float.Parse(item[13]) : 0;
                this.D_Total = IsNumeric(item[14]) ? (int)float.Parse(item[14]) : 0;
                this.Daily_Total = IsNumeric(item[15]) ? (int)float.Parse(item[15]) : 0;
            }
            else
            {
                this.Code = int.Parse(item[0]);
                this.Name = item[1].Trim();
                this.Type = "otc";
                this.A_Buy = IsNumeric(item[2]) ? (int)float.Parse(item[2]) : 0;
                this.A_Sell = IsNumeric(item[3]) ? (int)float.Parse(item[3]) : 0;
                this.A_Total = IsNumeric(item[4]) ? (int)float.Parse(item[4]) : 0;
                this.B_Buy = IsNumeric(item[5]) ? (int)float.Parse(item[5]) : 0;
                this.B_Sell = IsNumeric(item[6]) ? (int)float.Parse(item[6]) : 0;
                this.B_Total = IsNumeric(item[7]) ? (int)float.Parse(item[7]) : 0;
                this.CD_Total = IsNumeric(item[8]) ? (int)float.Parse(item[8]) : 0;
                this.C_Buy = IsNumeric(item[9]) ? (int)float.Parse(item[9]) : 0;
                this.C_Sell = IsNumeric(item[10]) ? (int)float.Parse(item[10]) : 0;
                this.C_Total = IsNumeric(item[11]) ? (int)float.Parse(item[11]) : 0;
                this.D_Buy = IsNumeric(item[12]) ? (int)float.Parse(item[12]) : 0;
                this.D_Sell = IsNumeric(item[13]) ? (int)float.Parse(item[13]) : 0;
                this.D_Total = IsNumeric(item[14]) ? (int)float.Parse(item[14]) : 0;
                this.Daily_Total = IsNumeric(item[15]) ? (int)float.Parse(item[15]) : 0;
            }
        }
        public int Code { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public int A_Buy { get; set; }
        public int A_Sell { get; set; }
        public int A_Total { get; set; }
        public int B_Buy { get; set; }
        public int B_Sell { get; set; }
        public int B_Total { get; set; }
        public int C_Buy { get; set; }
        public int C_Sell { get; set; }
        public int C_Total { get; set; }
        public int D_Buy { get; set; }
        public int D_Sell { get; set; }
        public int D_Total { get; set; }
        public int CD_Total { get; set; }
        public int Daily_Total { get; set; }

        private static bool IsNumeric(string s)
        {
            float output;
            return float.TryParse(s, out output);
        }

        //"證券代號",
        //"證券名稱",
        //"外資</br>買進股數",
        //"外資</br>賣出股數",
        //"外資</br>買賣超股數",
        //"投信</br>買進股數",
        //"投信</br>賣出股數",
        //"投信</br>買賣超股數",
        //"自營商</br>買賣超股數",
        //"自營商</br>買進股數(自行買賣)",
        //"自營商</br>賣出股數(自行買賣)",
        //"自營商</br>買賣超股數(自行買賣)",
        //"自營商</br>買進股數(避險)",
        //"自營商</br>賣出股數(避險)",
        //"自營商</br>買賣超股數(避險)",
        //"三大法人</br>買賣超股數"
    }
}
