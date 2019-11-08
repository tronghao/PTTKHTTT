using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLyNK_HK
{
    public partial class FormNhapQuanHuyen : Form
    {
        public FormNhapQuanHuyen()
        {
            InitializeComponent();
            layDuLieu();
        }

        private SqlConnection connect = new SqlConnection(ConnectionString.connectionString);
        private SqlDataAdapter adapter;
        private DataTable bangDuLieu = new DataTable();
        private SqlCommandBuilder capNhat;
        private int idNew;
        private int viTri = -1;
        public void ketNoiCSDL()
        {
            connect.Open();
        }
        
        public void NgatKetNoiCSDL()
        {
            connect.Close();
        }

        public void capNhatIdNew()
        {
            idNew = dgvDuLieu.RowCount + 1;
            txbMaQH.Text = idNew.ToString();
            txbTenQH.Text = "";
        }
        public void layDuLieu()
        {
            ketNoiCSDL();

            String query = "select * from QUANHUYEN";
            adapter = new SqlDataAdapter(query, connect);
            adapter.Fill(bangDuLieu);
            dgvDuLieu.DataSource = bangDuLieu;
            capNhatIdNew();
            NgatKetNoiCSDL();
        }


        private void btnLamRong_Click(object sender, EventArgs e)
        {
            txbMaQH.Text = idNew.ToString();
            txbTenQH.Text = "";
        }

        public void capNhatDuLieu()
        {
            capNhat = new SqlCommandBuilder(adapter);
            adapter.Update(bangDuLieu);
            bangDuLieu.Clear();
            layDuLieu();
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            if(txbMaQH.Text != idNew.ToString())
            {
                MessageBox.Show("Thêm Thất Bại! Bạn Cần Ấn Nhập Mới");
            }
            else
            {
                if (txbTenQH.Text != "")
                {
                    DataRow dongmoi = bangDuLieu.NewRow();
                    dongmoi["MAQUANHUYEN"] = txbMaQH.Text;
                    dongmoi["TENQUANHUYEN"] = txbTenQH.Text;
                    bangDuLieu.Rows.Add(dongmoi);

                    capNhatDuLieu();
                    viTri = -1;
                    MessageBox.Show("Thêm Thành Công!");
                }
                else
                {
                    MessageBox.Show("Thêm Thất Bại! Cần Nhập Tên");
                }
            }
            
            
        }

        private void dgvDuLieu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            viTri = e.RowIndex;
            if(viTri >=0)
            {
                txbMaQH.Text = bangDuLieu.Rows[viTri][0].ToString();
                txbTenQH.Text = bangDuLieu.Rows[viTri][1].ToString();
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if(viTri > -1)
            {
                bangDuLieu.Rows[viTri][0] = txbMaQH.Text;
                bangDuLieu.Rows[viTri][1] = txbTenQH.Text;
                capNhatDuLieu();
                MessageBox.Show("Sửa Thành Công!");
            }
            else
            {
                MessageBox.Show("Thêm Thất Bại!");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (viTri > -1)
            {
                bangDuLieu.Rows[viTri].Delete();
                capNhatDuLieu();
                MessageBox.Show("Xóa Thành Công!");
            }
            else
            {
                MessageBox.Show("Xóa Thất Bại!");
            }

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
