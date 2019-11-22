using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace QuanLyNK_HK
{
    public partial class FormNhapQuanHuyen : Form
    {
        public FormNhapQuanHuyen()
        {
            InitializeComponent();
            layDuLieu();
        }

        private DataTable bangDuLieu = new DataTable();
        private int idNew;
        private int viTri = -1;
        

        public void capNhatIdNew()
        {
            idNew = dgvDuLieu.RowCount + 1;
            txbMaQH.Text = idNew.ToString();
            txbTenQH.Text = "";
        }
        public void layDuLieu()
        {
            ConnectionString.ketNoiCSDL();

            String query = "select * from QUANHUYEN";
            ConnectionString.query(query, bangDuLieu);
            
            dgvDuLieu.DataSource = bangDuLieu;
            capNhatIdNew();

            ConnectionString.NgatKetNoiCSDL();
        }


        private void btnLamRong_Click(object sender, EventArgs e)
        {
            txbMaQH.Text = idNew.ToString();
            txbTenQH.Text = "";
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

                    ConnectionString.capNhatDuLieu(bangDuLieu, "QUANHUYEN");
                    layDuLieu();

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
                ConnectionString.capNhatDuLieu(bangDuLieu, "QUANHUYEN");
                layDuLieu();
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
                ConnectionString.capNhatDuLieu(bangDuLieu, "QUANHUYEN");
                layDuLieu();
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
