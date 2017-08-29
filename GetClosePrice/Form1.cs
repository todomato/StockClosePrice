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

        string _tseForeignOwnPath = "http://www.tse.com.tw/fund/MI_QFIIS?response=json&date={0}&selectType=ALLBUT0999&_=1503452481532";
        string _otcForeignOwnPath = "http://mops.twse.com.tw/server-java/t13sa150_otc";
        string _alertMessage = "";
        public readonly WebService webService;
        public readonly DbService dbService;

        public Form1()
        {
            InitializeComponent();
            webService = new WebService();
            dbService = new DbService();
            dt_begin.Value = (DateTime.Now.Hour >= 16) ? DateTime.Now : DateTime.Now.AddDays(-1);
            dt_end.Value = (DateTime.Now.Hour >= 16) ? DateTime.Now : DateTime.Now.AddDays(-1);
        }

        /// <summary>
        /// 一鍵更新(股價、買賣超、持股)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_autoUpdate_Click(object sender, EventArgs e)
        {
            _alertMessage = "";
            // 判斷更新時間區間 (以外資持股table為主,因為更新時間最晚)
            dt_begin.Value = dbService.GetLastUpdateTime().AddDays(1);

            // 下午四點後才更新今日
            dt_end.Value = (DateTime.Now.Hour >= 16) ? DateTime.Now : DateTime.Now.AddDays(-1);

            btn_3big_Click(null, null);
            btn_update_price_Click(null, null);
            btn_insert_foreignown_Click(null, null);
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

        /// <summary>
        /// 更新三大法人
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_3big_Click(object sender, EventArgs e)
        {
            if (sender != null) _alertMessage = "";

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

            this.Message("執行完畢!", string.Format("更新三大法人每日買賣成功 : 共 {0} 筆", count));
            if (sender != null)
            {
                MessageBox.Show(_alertMessage);
            }
        }

      

        /// <summary>
        /// 更新法人持股
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_insert_foreignown_Click(object sender, EventArgs e)
        {
            if (sender != null) _alertMessage = "";

            // 設定日期
            var begin = dt_begin.Value.Date;
            var end = dt_end.Value.Date;

            var count = 0;
            foreach (var day in DateHelper.EachDay(begin, end))
            {
                this.Message("導出法人持股數據: " + day.ToString("yyyy/MM/dd") + "...");
                var temp = GetForeignOwn(day);
                if (temp == null) continue;

                this.Message("更新資料庫:" + day.ToString("yyyy/MM/dd") + "...");
                var models = MappingForeignOwn(day, temp);
                count += dbService.InsertForeignOwn(models);
            }

            //進度走完關閉進度條
            this.Message("執行完畢!", string.Format("更新法人持股成功 : 共 {0} 筆", count));
            MessageBox.Show(_alertMessage);
        }


        /// <summary>
        /// 資料庫更新price
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_update_price_Click(object sender, EventArgs e)
        {
            if (sender != null) _alertMessage = "";

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

            this.Message("執行完畢!", string.Format("更新股價成功 : 共 {0} 筆", count));
            if (sender != null)
            {
                MessageBox.Show(_alertMessage);
            }
        }

        #region 私人方法
        /// <summary>
        /// 取得上市櫃 Price
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        private List<PriceViewModel> GetStockPrice(DateTime date)
        {
            var list = new List<PriceViewModel>();

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


        /// <summary>
        /// 取得法人持股
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        private List<ForeignOwnViewModel> GetForeignOwn(DateTime date)
        {
            var list = new List<ForeignOwnViewModel>();

            try
            {
                // 上市三大data
                var url = string.Format(_tseForeignOwnPath, date.ToString("yyyyMMdd"));
                list.AddRange(webService.GetSiiForeignOwnInfo(url));

                // 上櫃三大data
                var url2 = _otcForeignOwnPath;
                list.AddRange(webService.GetOtcForeignOwnInfo(url2, date));
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

        private void Message(string text, string alertMessage)
        {
            Message(text);
            _alertMessage += alertMessage;
        }

        private static List<Price> MappingPrice(DateTime day, List<PriceViewModel> temp)
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<PriceViewModel, Price>()
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

        private static List<ForeignOwn> MappingForeignOwn(DateTime day, List<ForeignOwnViewModel> temp)
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<ForeignOwnViewModel, ForeignOwn>()
               .ForMember(c => c.Date, opt => opt.MapFrom(src => day))
               );
            var mapper = config.CreateMapper();
            var models = mapper.Map<List<ForeignOwn>>(temp);
            return models;
        }
        #endregion

        private void btn_today_Click(object sender, EventArgs e)
        {
            dt_begin.Value = DateTime.Now;
            dt_end.Value = DateTime.Now;
        }
    }
}
