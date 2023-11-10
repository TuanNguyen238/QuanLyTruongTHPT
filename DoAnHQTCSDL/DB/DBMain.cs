using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

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
            ConnStr = @"Data Source=NGOCHANNE\SQLEXPRESS;Initial Catalog=QuanLyTruongTrungHocPT;Integrated Security=True";
            conn = new SqlConnection(ConnStr);
            comm = conn.CreateCommand();
        }

        public void KetNoiDB(int loaiNguoiDung)
        {
            if (loaiNguoiDung == 2)
            {
                ConnStr = @"Data Source=NGOCHANNE\SQLEXPRESS;Initial Catalog=QuanLyTruongTrungHocPT;Integrated Security=True";
                conn = new SqlConnection(ConnStr);
                comm = conn.CreateCommand();
            }
            else if (loaiNguoiDung == 3)
            {
                ConnStr = @"Data Source=NGOCHANNE\SQLEXPRESS;Initial Catalog=QuanLyTruongTrungHocPT;Integrated Security=True";
                conn = new SqlConnection(ConnStr);
                comm = conn.CreateCommand();
            }
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
