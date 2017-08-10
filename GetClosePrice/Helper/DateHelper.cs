using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetClosePrice.Helper
{
    public class DateHelper
    {
        /// <summary>
        /// 解析成民國時間 ex.106.01.31
        /// </summary>
        /// <param name="datetime">西元時間</param>
        /// <returns></returns>
        public static string ParseToTaiwanDate(DateTime datetime)
        {
            System.Globalization.TaiwanCalendar tc = new System.Globalization.TaiwanCalendar();

            return string.Format("{0}/{1}/{2}",
                tc.GetYear(datetime),
                datetime.Month.ToString("00"),
                datetime.Day.ToString("00"));
        }

        public static string ParseToTaiwanYearMonth(DateTime datetime)
        {
            System.Globalization.TaiwanCalendar tc = new System.Globalization.TaiwanCalendar();

            return string.Format("{0}/{1}",
                tc.GetYear(datetime),
                datetime.Month.ToString("00"));
        }
    }
}
