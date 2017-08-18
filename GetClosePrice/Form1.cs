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
using GetClosePrice.Service;

namespace GetClosePrice
{
    public partial class Form1 : Form
    {
        string _tsePricePath = "http://www.twse.com.tw/exchangeReport/MI_INDEX?response=json&date={0}&type=ALLBUT0999&_=1502250724849";
        string _otcPricePath = "http://www.tpex.org.tw/web/stock/aftertrading/daily_close_quotes/stk_quote_result.php?l=zh-tw&d={0}&_=1432687154819";

        public WebService webService { get; set; }

        public Form1()
        {
            InitializeComponent();
            webService = new WebService();
            txt_date.Text = DateTime.Now.ToString("yyyy/MM/dd");
        }

        /// <summary>
        /// price下載
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_download_Click(object sender, EventArgs e)
        {
            // 設定日期
            var date = DateTime.Parse(txt_date.Text);

            var list = new List<ViewModel>();

            // 市p  
            var url = string.Format(_tsePricePath, date.ToString("yyyyMMdd"));
            list.AddRange(webService.GetSiiInfo(url));

            // 櫃p
            var url2 = string.Format(_otcPricePath, DateHelper.ParseToTaiwanDate(date));
            list.AddRange(webService.GetOtcInfo(url2));

            // 匯出Excel
            SaveFileDialog save = new SaveFileDialog();
            save.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            save.FileName = string.Format("收盤價_{0}", date.ToString("yyyyMMdd"));
            save.Filter = "*.xlsx|*.xlsx";
            if (save.ShowDialog() != DialogResult.OK) return;
            FileInfo newFile = new FileInfo(save.FileName);
            ExcelHelper.ExportToExcel(list, newFile);
            MessageBox.Show("下載成功");
        }


        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}
