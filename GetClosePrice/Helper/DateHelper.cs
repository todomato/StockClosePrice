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

        public static IEnumerable<DateTime> EachDay(DateTime from, DateTime thru)
        {
            for (var day = from.Date; day.Date <= thru.Date; day = day.AddDays(1))
                yield return day;
        }

        public static IEnumerable<DateTime> EachMonth(DateTime from, DateTime thru)
        {
            for (var month = from.Date; month.Date <= thru.Date || month.Month == thru.Month; month = month.AddMonths(1))
                yield return month;
        }

        //public static IEnumerable<DateTime> EachDayTo(this DateTime dateFrom, DateTime dateTo)
        //{
        //    return EachDay(dateFrom, dateTo);
        //}

        //public static IEnumerable<DateTime> EachMonthTo(this DateTime dateFrom, DateTime dateTo)
        //{
        //    return EachMonth(dateFrom, dateTo);
        //}
    }
}
