using GetClosePrice.Helper;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GetClosePrice
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            txt_date.Text = DateTime.Now.ToString("yyyy/MM/dd");
        }

        private void btn_download_Click(object sender, EventArgs e)
        {
            // 設定日期
            var date = DateTime.Parse(txt_date.Text);

            var list = new List<ViewModel>();

            // 市p  
            var url = string.Format(
                "http://www.twse.com.tw/exchangeReport/MI_INDEX?response=json&date={0}&type=ALLBUT0999&_=1502250724849",
                date.ToString("yyyyMMdd"));
            list.AddRange(GetSiiInfo(url));

            // 櫃p
            // http://www.tpex.org.tw/web/stock/aftertrading/daily_close_quotes/stk_quote_result.php?l=zh-tw&_=1432687291166
            var url2 = string.Format(
                "http://www.tpex.org.tw/web/stock/aftertrading/daily_close_quotes/stk_quote_result.php?l=zh-tw&d={0}&_=1432687154819"
                , DateHelper.ParseToTaiwanDate(date));
            list.AddRange(GetOtcInfo(url2));

            // 匯出Excel
            SaveFileDialog save = new SaveFileDialog();
            save.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            save.FileName = string.Format("收盤價_{0}", date.ToString("yyyyMMdd"));
            save.Filter = "*.xlsx|*.xlsx";
            if (save.ShowDialog() != DialogResult.OK) return;
            FileInfo newFile = new FileInfo(save.FileName);
            ExportToExcel(list, newFile);
            MessageBox.Show("下載成功");
        }

        public void ExportToExcel(IEnumerable<ViewModel> employees, FileInfo targetFile)
        {
            using (var excelFile = new ExcelPackage(targetFile))
            {
                var worksheet = excelFile.Workbook.Worksheets.Add("Sheet1");
                worksheet.Cells["A1"].LoadFromCollection(Collection: employees, PrintHeaders: true);
                excelFile.Save();
            }
        }

        private List<ViewModel> GetOtcInfo(string url2)
        {
            var list = new List<ViewModel>();

            using (WebClient wc = new WebClient())
            {
                wc.Encoding = Encoding.UTF8;
                var json = wc.DownloadString(url2);
                // var jsonData = JObject.Parse(json);
                var otc = JsonConvert.DeserializeObject<otcModel>(json);

                foreach (var item in otc.aaData)
                {
                    if (item[0].Length != 4) continue;
                    var temp = new ViewModel(item, "otc");
                    list.Add(temp);
                }
            }
            return list;
        }

        private List<ViewModel> GetSiiInfo(string url)
        {
            var list = new List<ViewModel>();
            using (WebClient wc = new WebClient())
            {
                wc.Encoding = Encoding.UTF8;
                var json = wc.DownloadString(url);
                // var jsonData = JObject.Parse(json);
                var ssi = JsonConvert.DeserializeObject<siiModel>(json);

                foreach (var item in ssi.data5)
                {
                    if (item[0].Length != 4) continue;
                    var temp = new ViewModel(item, "sii");
                    list.Add(temp);
                }
            }
            return list;
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}
