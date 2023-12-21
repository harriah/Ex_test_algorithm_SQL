using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolBar;

namespace Baii8FE2
{
    public partial class LoginForm : Form
    {

        public LoginForm()
        {
            InitializeComponent();
        }
        private void InitializeLoginForm()
        {
            // Khóa nút đăng nhập khi chưa nhập user/pass
            btnDangNhap.Enabled = false;
        }
            private void btnDangNhap_Click(object sender, EventArgs e)
            {
                if ((txtDangNhap.Text == "") || (txtMatkhau.Text == ""))
                {
                    MessageBox.Show("Vui lòng nhập thông tin", "Thông báo");
                }
                else
                {
                    if ((txtDangNhap.Text == "thanh") && (txtMatkhau.Text == "123"))
                    {
                        MessageBox.Show("Xin chào Thanh", "Thông báo");
                    }
                    else
                    {
                        MessageBox.Show("Đăng nhập không thành công", "Thông báo");
                    }
                }
            }

        private void button1_Click(object sender, EventArgs e)
        {
            if (txtMatkhau.PasswordChar == '*')
            {
                button1.BringToFront();
                txtMatkhau.PasswordChar = '\0';
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (txtMatkhau.PasswordChar == '\0')
            {
                button2.BringToFront();
                txtMatkhau.PasswordChar = '*';
            }
        }

        private void LoginForm_Load(object sender, EventArgs e)
        {

        }
    }
    }

