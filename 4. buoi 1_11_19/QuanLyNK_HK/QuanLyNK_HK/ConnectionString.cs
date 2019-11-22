using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace QuanLyNK_HK
{
    class ConnectionString
    {
        public static String connectionString = @"Data Source=.;Initial Catalog=NHANKHAU;Integrated Security=True";
        private static SqlConnection connect = new SqlConnection(ConnectionString.connectionString);
        private static SqlDataAdapter adapter;
        private static SqlCommandBuilder capNhat;

        public static void ketNoiCSDL()
        {
            connect.Open();
        }

        public static void NgatKetNoiCSDL()
        {
            connect.Close();
        }

        public static void query(String sql, DataTable bangDuLieu)
        {
            adapter = new SqlDataAdapter(sql, connect);
            adapter.Fill(bangDuLieu);
        }
        public static void capNhatDuLieu(DataTable bangDuLieu, String tenBang)
        {
            String sql = "select * from " + tenBang;
            adapter = new SqlDataAdapter(sql, connect);
            capNhat = new SqlCommandBuilder(adapter);
            adapter.Update(bangDuLieu);
            bangDuLieu.Clear();
        }
    }
}
