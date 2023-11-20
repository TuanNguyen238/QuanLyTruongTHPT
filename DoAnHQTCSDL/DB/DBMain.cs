using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;

namespace DoAnHQTCSDL.DB
{
    public class DBMain
    {
        string ConnStr = null;
        SqlConnection conn = null;
        SqlCommand comm = null;
        SqlDataAdapter da = null;
        public DBMain()
        {
            ConnStr = @"Data Source=.\SQLEXPRESS;Initial Catalog=QuanLyTruongTrungHocPT;Integrated Security=True";
            conn = new SqlConnection(ConnStr);
            comm = conn.CreateCommand();
        }

        public void KetNoiDB(int loaiNguoiDung, string tenDN, string matKhau)
        {
            ConnStr = @"Data Source=.\SQLEXPRESS;Initial Catalog=QuanLyTruongTrungHocPT;User ID=" + tenDN + ";Password=" + matKhau;
            conn = new SqlConnection(ConnStr);
            comm = conn.CreateCommand();
        }

        public DataSet ExecuteQueryDataSet(string strSQL, CommandType ct)
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
            conn.Open();
            comm.CommandText = strSQL;
            comm.CommandType = ct;
            da = new SqlDataAdapter(comm);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public bool MyExecuteNonQuery(string strSQL, CommandType ct, ref string error)
        {
            bool f = false;
            if (conn.State == ConnectionState.Open)
                conn.Close();
            conn.Open();
            comm.CommandText = strSQL;
            comm.CommandType = ct;
            try
            {
                comm.ExecuteNonQuery();
                f = true;
            }
            catch (SqlException ex)
            {
                error = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            return f;
        }
        public int ExecuteQueryInt(string strSQL, CommandType ct)
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
            conn.Open();
            comm.CommandText = strSQL;
            comm.CommandType = ct;

            object result = comm.ExecuteScalar();

            int intValue;
            if (result != null && int.TryParse(result.ToString(), out intValue))
            {
                return intValue;
            }

            return -1;
        }

        public string ExecuteQueryString(string strSQL, CommandType ct)
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
            conn.Open();
            comm.CommandText = strSQL;
            comm.CommandType = ct;

            object result = comm.ExecuteScalar();

            string stringValue = result?.ToString();

            return stringValue ?? "Giá trị không tồn tại";
        }
    }
}
