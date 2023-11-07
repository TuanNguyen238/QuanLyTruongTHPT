using DoAnHQTCSDL.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnHQTCSDL.BS
{
    internal class BLAdmin: BLNguoiDung
    {
        public BLAdmin(string username, DBMain db) : base(username, db) { }
    }
}
