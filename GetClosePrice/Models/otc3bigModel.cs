using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetClosePrice.Models
{
    public class otc3BigModel
    {
        public string reportTitle { get; set; }
        public string reportDate { get; set; }
        public int iTotalRecords { get; set; }
        public string[][] aaData { get; set; }
    }

}
