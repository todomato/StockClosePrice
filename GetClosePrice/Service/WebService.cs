﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using Newtonsoft.Json;
using GetClosePrice.Models;
using System.Collections.Specialized;
using HtmlAgilityPack;

namespace GetClosePrice.Service
{
    public class WebService
    {

        /// <summary>
        /// 取得OTC價位用
        /// </summary>
        /// <param name="url2"></param>
        /// <returns></returns>
        public List<PriceViewModel> GetOtcInfo(string url2)
        {
            var list = new List<PriceViewModel>();

            using (WebClient wc = new WebClient())
            {
                wc.Encoding = Encoding.UTF8;
                var json = wc.DownloadString(url2);
                if (json.Contains("很抱歉")) return null;

                var otc = JsonConvert.DeserializeObject<otcModel>(json);

                foreach (var item in otc.aaData)
                {
                    if (item[0].Length != 4) continue;
                    var temp = new PriceViewModel(item, "otc");
                    list.Add(temp);
                }
            }
            return list;
        }

        /// <summary>
        /// 取得sii價位用
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public List<PriceViewModel> GetSiiInfo(string url)
        {
            var list = new List<PriceViewModel>();
            using (WebClient wc = new WebClient())
            {
                wc.Encoding = Encoding.UTF8;
                var json = wc.DownloadString(url);
                if (json.Contains("很抱歉")) return null;

                var ssi = JsonConvert.DeserializeObject<siiModel>(json);

                foreach (var item in ssi.data5)
                {
                    if (item[0].Length != 4) continue;
                    var temp = new PriceViewModel(item, "sii");
                    list.Add(temp);
                }
            }
            return list;
        }

        /// <summary>
        /// 取得sii 三大
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public List<ThreeBigViewModel> GetSii3BigInfo(string url)
        {
            var list = new List<ThreeBigViewModel>();
            using (WebClient wc = new WebClient())
            {
                wc.Encoding = Encoding.UTF8;
                var json = wc.DownloadString(url);
                if (json.Contains("很抱歉")) return null;
                var ssi = JsonConvert.DeserializeObject<sii3BigModel>(json);

                foreach (var item in ssi.data)
                {
                    if (item[0].Length != 4) continue;
                    var temp = new ThreeBigViewModel(item, "sii");
                    list.Add(temp);
                }
            }
            return list;
        }

        /// <summary>
        /// 取得OTC 三大
        /// </summary>
        /// <param name="url2"></param>
        /// <returns></returns>
        public List<ThreeBigViewModel> GetOtc3BigInfo(string url2)
        {
            var list = new List<ThreeBigViewModel>();

            using (WebClient wc = new WebClient())
            {
                wc.Encoding = Encoding.UTF8;
                var json = wc.DownloadString(url2);
                if (json.Contains("很抱歉")) return null;
                var otc = JsonConvert.DeserializeObject<otc3BigModel>(json);

                foreach (var item in otc.aaData)
                {
                    if (item[0].Trim().Length != 4) continue;
                    var temp = new ThreeBigViewModel(item, "otc");
                    list.Add(temp);
                }
            }
            return list;
        }

        /// <summary>
        /// 取得sii 法人持股
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public List<ForeignOwnViewModel> GetSiiForeignOwnInfo(string url)
        {
            var list = new List<ForeignOwnViewModel>();
            using (WebClient wc = new WebClient())
            {
                wc.Encoding = Encoding.UTF8;
                var json = wc.DownloadString(url);
                if (json.Contains("很抱歉")) return null;
                var ssi = JsonConvert.DeserializeObject<sii3BigModel>(json);

                foreach (var item in ssi.data)
                {
                    if (item[0].Length != 4) continue;
                    var temp = new ForeignOwnViewModel(item, "sii");
                    list.Add(temp);
                }
            }
            return list;
        }

        /// <summary>
        /// 取得otc 法人持股
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public List<ForeignOwnViewModel> GetOtcForeignOwnInfo(string url, DateTime date)
        {
            //params : years, months, days, step
            var list = new List<ForeignOwnViewModel>();
            var doc = new HtmlAgilityPack.HtmlDocument();

            //下載html
            using (var myWebClient = new WebClient())
            {

                byte[] response =
                    myWebClient.UploadValues(url, new NameValueCollection()
                    {
                        { "years", date.Year.ToString() },
                        { "months", date.Month.ToString("00") },
                        { "days", date.Day.ToString("00") },
                        { "step", "2" }
                    });

                string page = System.Text.Encoding.GetEncoding("Big5").GetString(response);
                doc.LoadHtml(page);
            }

            //解析html
            string xpathTemplate = "/html/body/center/table[1]/tr[{0}]/td";
            try
            {
                for (int i = 3; i < 900; i++)
                {
                    HtmlNodeCollection nodes = doc.DocumentNode.SelectNodes(string.Format(xpathTemplate, i));
                    if (nodes != null)
                    {
                        var temp = new ForeignOwnViewModel()
                        {
                            Code = int.Parse(nodes[0].InnerText.Trim()),            //Code
                            A_Own = (long)float.Parse(nodes[4].InnerText.Trim()),   //持股數
                            A_OwnP = double.Parse(nodes[6].InnerText.Trim().Replace("&nbsp;",""))        //持股比
                        };
                        list.Add(temp);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return list;
        }
      
    }
}
