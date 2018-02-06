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
using HtmlAgilityPack;

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

        //TODO update index price
        string _tseIIndexPricePath = "http://www.tse.com.tw/exchangeReport/FMTQIK?response=json&date=20170801&_=1504775726324";
        string _otcIndexPricePath = "http://www.tpex.org.tw/web/stock/aftertrading/daily_trading_index/st41_result.php?l=zh-tw&d=106/08/01&_=1504775959759";


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

            this.Message("執行完畢!", string.Format("更新三大法人每日買賣成功 : 共 {0} 筆 \n", count));
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
            this.Message("執行完畢!", string.Format("更新法人持股成功 : 共 {0} 筆 \n", count));
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

            this.Message("執行完畢!", string.Format("更新股價成功 : 共 {0} 筆 \n", count));
            if (sender != null)
            {
                MessageBox.Show(_alertMessage);
            }
        }


        /// <summary>
        /// TODO 資料庫大盤指數更新
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_update_total_price_Click(object sender, EventArgs e)
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

            this.Message("執行完畢!", string.Format("更新股價成功 : 共 {0} 筆 \n", count));
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

        /// <summary>
        /// 更新大盤資訊
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button3_Click(object sender, EventArgs e)
        {
            string tse_url = string.Format("http://www.tse.com.tw/exchangeReport/FMTQIK?response=json&date={0}&_=1505888895086", DateTime.Now.ToString("yyyyMMdd"));
            string otc_url = string.Format("http://www.tpex.org.tw/web/stock/aftertrading/daily_trading_index/st41_result.php?l=zh-tw&d={0}&_=1505890120738",
                DateHelper.ParseToTaiwanDate(DateTime.Now));
            string threebig_url = string.Format("http://www.tse.com.tw/fund/BFI82U?response=json&dayDate={0}&type=day&_=1517908423710",
               DateTime.Now.ToString("yyyyMMdd"));
            var tse_margn_rul = string.Format(
                   "http://www.twse.com.tw/exchangeReport/MI_MARGN?response=json&date={0}&selectType=MS&_=1506325392613"
                       ,DateTime.Now.ToString("yyyyMMdd"));
            var otc_margn_rul = string.Format(
                 "http://www.twse.com.tw/exchangeReport/MI_MARGN?response=json&date=20170922&selectType=MS&_=1506325392613"
                     , DateHelper.ParseToTaiwanDate(DateTime.Now));


               string get_url = "https://script.google.com/macros/s/AKfycbzyyE7kUyBjW9HBxjdp4bIhsZbJaGCctY9LY0H30WiUoliuIZAy/exec?"; //打到excel google
            
            using (var wc = new WebClient())
            {
                //TSE 成交資訊
                wc.Encoding = Encoding.UTF8;
                var json = wc.DownloadString(tse_url);
                if (json.Contains("很抱歉")) return;
                var ssi = JsonConvert.DeserializeObject<TseModel>(json);
                var date = ssi.data[ssi.data.Count() - 1][0];
                var amount = ssi.data[ssi.data.Count() - 1][2];
                var index = ssi.data[ssi.data.Count() - 1][4];

                //OTC 成交資訊
                wc.Encoding = Encoding.UTF8;
                var json2 = wc.DownloadString(otc_url);
                if (json2.Contains("很抱歉")) return;
                var otc = JsonConvert.DeserializeObject<otcModel>(json2);
                var amount2 = otc.aaData[otc.aaData.Count() - 1][2];
                var index2 = otc.aaData[otc.aaData.Count() - 1][4];

                //三大法人買賣超
                wc.Encoding = Encoding.UTF8;
                var json4 = wc.DownloadString(threebig_url);
                if (json4.Contains("很抱歉")) return;
                var threebig = JsonConvert.DeserializeObject<threeBigModel>(json4);
                var threebig1 = Math.Round(long.Parse(threebig.data[threebig.data.Count() - 6][3].Replace(",", "")) / 100000000.00, 2);    //自營
                var threebig2 = Math.Round(long.Parse(threebig.data[threebig.data.Count() - 5][3].Replace(",", "")) / 100000000.00, 2);    //自營避險
                var threebig3 = Math.Round(long.Parse(threebig.data[threebig.data.Count() - 4][3].Replace(",", "")) / 100000000.00, 2);    //投信
                var threebig4 = Math.Round(long.Parse(threebig.data[threebig.data.Count() - 3][3].Replace(",", "")) / 100000000.00, 2);    //外資

                //外匯
                var xpath = @"//*[@id=""printhere""]/div[3]/table/tbody/tr";
                var xpath2 = @"//*[@id=""printhere""]/div[3]/table/tbody/tr[{0}]/td[2]";
                var doc = new HtmlAgilityPack.HtmlDocument();
                wc.Encoding = Encoding.UTF8;
                string page = wc.DownloadString("http://www.taifex.com.tw/chinese/3/3_5.asp");
                doc.LoadHtml(page);
                HtmlNodeCollection nodes = doc.DocumentNode.SelectNodes(xpath);
                var count = nodes.Count;
                var ntd = doc.DocumentNode.SelectNodes(string.Format(xpath2, count))[0].InnerText.Trim();
               
                //台指大小台留倉
                var xpathFuture = @"//*[@id=""printhere""]/div[4]/table/tbody/tr[2]/td/table/tbody/tr[6]/td[12]";
                var xpathFuture2 = @"//*[@id=""printhere""]/div[4]/table/tbody/tr[2]/td/table/tbody/tr[15]/td[12]";
                doc = new HtmlAgilityPack.HtmlDocument();
                wc.Encoding = Encoding.UTF8;
                string pageFuture = wc.DownloadString("http://www.taifex.com.tw/chinese/3/7_12_3.asp");
                doc.LoadHtml(pageFuture);
                var future = doc.DocumentNode.SelectNodes(xpathFuture)[0].InnerText.Trim();
                var future2 = doc.DocumentNode.SelectNodes(xpathFuture2)[0].InnerText.Trim();

                //前五大留倉
                var xpathFuture3 = @"//*[@id=""printhere""]/div[3]/table/tr[2]/td/table/tr[6]/td[2]/div";
                var xpathFuture4 = @"//*[@id=""printhere""]/div[3]/table/tr[2]/td/table/tr[6]/td[6]/div";
                doc = new HtmlAgilityPack.HtmlDocument();
                wc.Encoding = Encoding.UTF8;
                string pageFuture3 = wc.DownloadString("http://www.taifex.com.tw/chinese/3/7_8.asp");
                doc.LoadHtml(pageFuture3);
                var future3 = doc.DocumentNode.SelectNodes(xpathFuture3)[0].InnerText.Trim();
                var future4 = doc.DocumentNode.SelectNodes(xpathFuture4)[0].InnerText.Trim();
                var r1 = future3.Substring(future3.IndexOf('(')+1, future3.IndexOf(')') - future3.IndexOf('(') -1);  //前五特定法人買
                var r2 = future4.Substring(future4.IndexOf('(')+1, future4.IndexOf(')') - future4.IndexOf('(') -1);  //前五特定法人賣
                var r3 = float.Parse(r1) - float.Parse(r2);

                //融資券變化 
                wc.Encoding = Encoding.UTF8;
                var json3 = wc.DownloadString(tse_margn_rul);
                if (json3.Contains("很抱歉")) return;
                var ssi_margn = JsonConvert.DeserializeObject<ssiMargn>(json3);
                var sii_buy = 0.0;
                 var sii_sell = 0.0;
                if (ssi_margn.creditList.Count() != 0)
                {
                    sii_buy = (float.Parse(ssi_margn.creditList[2][5]) - float.Parse(ssi_margn.creditList[2][4])) / 100000;
                    sii_sell = float.Parse(ssi_margn.creditList[1][5]) - float.Parse(ssi_margn.creditList[1][4]);
                }

                ////OTC融資券變化
                ////http://www.tpex.org.tw/web/stock/margin_trading/margin_balance/margin_bal_result.php?l=zh-tw&d=106/09/21&_=1506325335449

                //wc.Encoding = Encoding.UTF8;
                //var json4 = wc.DownloadString(otc_margn_rul);
                //if (json4.Contains("很抱歉")) return;
                //var otc_margn = JsonConvert.DeserializeObject<otcModel>(json4);
                //var otc_buy = float.Parse(otc_margn.aaData[2][5]) - float.Parse(otc_margn.aaData[2][4]);
                //var otc_sell = float.Parse(otc_margn.aaData[1][5]) - float.Parse(otc_margn.aaData[1][4]);

                get_url = string.Format("https://script.google.com/macros/s/AKfycbzyyE7kUyBjW9HBxjdp4bIhsZbJaGCctY9LY0H30WiUoliuIZAy/exec?date={0}&tseindex={1}&tsevol={2}&otcindex={3}&otcvol={4}&ntd={5}&fiveleave={6}&f1={7}&f2={8}&tsemargn={9}&tsemargn2={10}&threebig1={11}&threebig2={12}&threebig3={13}&threebig4={14}",
                    date, index, amount, index2, amount2, ntd, r3, future, future2, sii_buy, sii_sell
                    , threebig1, threebig2, threebig3, threebig4);

            }

            using (var wc = new WebClient())
            {
                // 更新google excel 表格
                var result = wc.DownloadString(get_url);
            }

            Message("更新完成");
        }

        /// <summary>
        /// 每日三大法人買賣統計
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_daily_3big_Click(object sender, EventArgs e)
        {

        }
    }
}
