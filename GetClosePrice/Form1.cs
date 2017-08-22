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
using AutoMapper;
using GetClosePrice.Models;

namespace GetClosePrice
{
    public partial class Form1 : Form
    {
        string _tsePricePath = "http://www.twse.com.tw/exchangeReport/MI_INDEX?response=json&date={0}&type=ALLBUT0999&_=1502250724849";
        string _otcPricePath = "http://www.tpex.org.tw/web/stock/aftertrading/daily_close_quotes/stk_quote_result.php?l=zh-tw&d={0}&_=1432687154819";
        string _tscBuySellPath = "http://www.tse.com.tw/fund/T86?response=json&date={0}&selectType=ALLBUT0999&_=1503041070775";
        string _otcBuySellPath = "http://www.tpex.org.tw/web/stock/3insti/daily_trade/3itrade_hedge_result.php?l=zh-tw&se=EW&t=D&d={0}&_=1503039637105";
        public readonly WebService webService;
        public readonly DbService dbService;

        public Form1()
        {
            InitializeComponent();
            webService = new WebService();
            dbService = new DbService();

        }

        /// <summary>
        /// price下載
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_download_Click(object sender, EventArgs e)
        {
            // 設定日期
            var date = dt_price.Value.Date;
            var list = GetStockPrice(date);
            if (list == null)
            {
                MessageBox.Show("此日期無資料");
                return;
            }

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


        private void btn_autoUpdate_Click(object sender, EventArgs e)
        {
            // 判斷更新時間區間
            dt_begin.Value = dbService.GetLastUpdateTime().AddDays(1);

            // 下午四點後才更新今日
            dt_end.Value = (DateTime.Now.Hour >= 16) ? DateTime.Now : DateTime.Now.AddDays(-1);
            
            btn_3big_Click(null, null);
            btn_update_price_Click(null, null);
        }

        /// <summary>
        /// 更新三大法人
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_3big_Click(object sender, EventArgs e)
        {
            // 設定日期
            var begin = dt_begin.Value.Date;
            var end = dt_end.Value.Date;

            var count = 0;
            foreach (var day in DateHelper.EachDay(begin, end))
            {
                this.Message("導出法人數據: " + day.ToString("yyyy/MM/dd") + "...");
                var temp = Get3BigBuySell(day);
                if (temp == null) continue;

                this.Message("更新資料庫:" + day.ToString("yyyy/MM/dd") + "...");
                var models = Mapping3Big(day, temp);
                count += dbService.Insert3BigBuySell(models);
            }

            //進度走完關閉進度條
            this.Message("執行完畢!");
            MessageBox.Show(string.Format("更新成功 : 共 {0} 筆", count));
        }

        /// <summary>
        /// 資料庫更新price
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_update_price_Click(object sender, EventArgs e)
        {
            // 設定日期
            var begin = dt_begin.Value.Date;
            var end = dt_end.Value.Date;

            var count = 0;
            foreach (var day in DateHelper.EachDay(begin, end))
            {
                this.Message("導出數據: " + day.ToString("yyyy/MM/dd") + "...");
                var temp = GetStockPrice(day);
                if (temp == null) continue;

                this.Message("更新資料庫:" + day.ToString("yyyy/MM/dd") + "...");
                var models = MappingPrice(day, temp);
                count += dbService.InsertPrice(models);
            }

            //進度走完關閉進度條
            this.Message("執行完畢!");
            MessageBox.Show(string.Format("更新成功 : 共 {0} 筆", count));
        }

        #region 私人方法
        /// <summary>
        /// 取得上市櫃 Price
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        private List<ViewModel> GetStockPrice(DateTime date)
        {
            var list = new List<ViewModel>();

            try
            {
                // 市p  
                var url = string.Format(_tsePricePath, date.ToString("yyyyMMdd"));
                list.AddRange(webService.GetSiiInfo(url));

                // 櫃p
                var url2 = string.Format(_otcPricePath, DateHelper.ParseToTaiwanDate(date));
                list.AddRange(webService.GetOtcInfo(url2));
                return list;
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// 取得上市櫃 三大
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        private List<ThreeBigViewModel> Get3BigBuySell(DateTime date)
        {
            var list = new List<ThreeBigViewModel>();

            try
            {
                // 上市三大data
                var url = string.Format(_tscBuySellPath, date.ToString("yyyyMMdd"));
                list.AddRange(webService.GetSii3BigInfo(url));

                // 上櫃三大data
                var url2 = string.Format(_otcBuySellPath, DateHelper.ParseToTaiwanDate(date));
                list.AddRange(webService.GetOtc3BigInfo(url2));
                return list;
            }
            catch (Exception)
            {
                return null;
            }
        }

        private void Message(string text)
        {
            lbl_progress.Text = text;
            Application.DoEvents();
        }

        private static List<Price> MappingPrice(DateTime day, List<ViewModel> temp)
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<ViewModel, Price>()
                .ForMember(c => c.Date, opt => opt.MapFrom(src => day))
                .ForMember(c => c.OpenPrice, opt => opt.MapFrom(src => src.Open))
                .ForMember(c => c.ClosePrice, opt => opt.MapFrom(src => src.Close))
                );
            var mapper = config.CreateMapper();
            var models = mapper.Map<List<Price>>(temp);
            return models;
        }

        private static List<ThreeBigBuySell> Mapping3Big(DateTime day, List<ThreeBigViewModel> temp)
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<ThreeBigViewModel, ThreeBigBuySell>()
                .ForMember(c => c.Date, opt => opt.MapFrom(src => day))
                );
            var mapper = config.CreateMapper();
            var models = mapper.Map<List<ThreeBigBuySell>>(temp);
            return models;
        }
        #endregion

     
    }
}
