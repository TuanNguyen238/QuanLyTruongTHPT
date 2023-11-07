using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS.Admin
{
    internal class BLXemNoiQuy
    {
<<<<<<< HEAD
        string maNQL = "";
        DBMain db = null;
        public BLXemNoiQuy(string maNQL, DBMain db)
        {
            this.maNQL = maNQL;
=======
        DBMain db = null;
        public BLXemNoiQuy(DBMain db)
        {
>>>>>>> 233702d88936b669d8075c61ef05eac83fff3fc2
            this.db = db;
        }

        public DataSet XemNoiQuy()
        {
            return db.ExecuteQueryDataSet("SELECT * FROM XemNoiQuy", CommandType.Text);
        }
    }
}
