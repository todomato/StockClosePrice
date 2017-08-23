using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetClosePrice.Helper
{
    public class ExcelHelper
    {
        public static void ExportToExcel(IEnumerable<PriceViewModel> list, FileInfo targetFile)
        {
            using (var excelFile = new ExcelPackage(targetFile))
            {
                var worksheet = excelFile.Workbook.Worksheets.Add("Sheet1");
                worksheet.Cells["A1"].LoadFromCollection(Collection: list, PrintHeaders: true);
                excelFile.Save();
            }
        }
    }
}
