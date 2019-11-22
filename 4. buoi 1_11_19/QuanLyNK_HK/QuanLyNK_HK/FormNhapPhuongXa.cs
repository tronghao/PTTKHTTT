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
    public partial class FormNhapPhuongXa : Form
    {

        private DataTable bangPhuongXa = new DataTable();
        private DataTable bangQuanHuyen = new DataTable();
        private int idNew;
        private int viTri = -1;
        public FormNhapPhuongXa()
        {
            InitializeComponent();
            khoiTao();
        }

        public void khoiTao()
        {
            layDuLieuChoDGV();
            doDuLieuChoComBoBox();
        }

        public void layDuLieuChoDGV()
        {
            bangPhuongXa.Clear();
            ConnectionString.ketNoiCSDL();
                String sql = "select * from PHUONGXA";
                ConnectionString.query(sql, bangPhuongXa);
                dgvDuLieu.DataSource = bangPhuongXa;
                capNhatIdNew();
            ConnectionString.NgatKetNoiCSDL();
        }

        public void doDuLieuChoComBoBox()
        {
            bangQuanHuyen.Clear();
            ConnectionString.ketNoiCSDL();
                String sql = "select * from QUANHUYEN";
                ConnectionString.query(sql, bangQuanHuyen);
                cmbTenQH.DataSource = bangQuanHuyen;
                cmbTenQH.DisplayMember = "TENQUANHUYEN";
                cmbTenQH.ValueMember = "MAQUANHUYEN";
            ConnectionString.NgatKetNoiCSDL();
        }

        public void capNhatIdNew()
        {
            idNew = dgvDuLieu.RowCount + 1;
            txbMaPX.Text = idNew.ToString();
            txbTenPX.Text = "";
        }
        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnLamRong_Click(object sender, EventArgs e)
        {
            // giữ giá trị của maPX mới
            txbTenPX.Text = "";
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (txbMaPX.Text != idNew.ToString())
            {
                MessageBox.Show("Thêm Thất Bại! Bạn Cần Ấn Nhập Mới");
            }
            else
            {
                if (txbTenPX.Text != "")
                {
                    DataRow dongmoi = bangPhuongXa.NewRow();
                    dongmoi["MAPHUONGXA"] = txbMaPX.Text;
                    dongmoi["TENPHUONGXA"] = txbTenPX.Text;
                    dongmoi["MAQUANHUYEN"] = cmbTenQH.SelectedValue;
                    bangPhuongXa.Rows.Add(dongmoi);

                    ConnectionString.capNhatDuLieu(bangPhuongXa, "PHUONGXA");
                    layDuLieuChoDGV();
                    doDuLieuChoComBoBox();

                    viTri = -1;
                    MessageBox.Show("Thêm Thành Công!");
                }
                else
                {
                    MessageBox.Show("Thêm Thất Bại! Cần Nhập Tên");
                }
            }
            
        }
    }
}
