﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using Newtonsoft.Json;

namespace GetClosePrice.Service
{
    public class WebService
    {
        /// <summary>
        /// 取得OTC價位用
        /// </summary>
        /// <param name="url2"></param>
        /// <returns></returns>
        public List<ViewModel> GetOtcInfo(string url2)
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

        /// <summary>
        /// 取得sii價位用
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public List<ViewModel> GetSiiInfo(string url)
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
    }
}
