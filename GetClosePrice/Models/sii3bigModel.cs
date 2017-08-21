using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetClosePrice.Models
{
    public class sii3BigModel
    {
        public string stat { get; set; }
        public string date { get; set; }
        public string title { get; set; }
        public string[] fields { get; set; }
        public string[][] data { get; set; }
        public string selectType { get; set; }
        public string[] notes { get; set; }
    }

}
