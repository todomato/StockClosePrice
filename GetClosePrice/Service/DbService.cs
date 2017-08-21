using GetClosePrice.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GetClosePrice.Service
{
    public class DbService
    {
        internal int InsertPrice(List<Price> models)
        {
            var count = 0;
            using (var db = new StockEntities())
            {
                // 有相同日期不上傳
                if (models.Count > 0 && models[0] != null && !db.Price.AsEnumerable().Any(c => c.Date == models[0].Date))
                {
                    db.Price.AddRange(models);
                    count = db.SaveChanges();
                }
            }
            return count;
        }
    }
}
