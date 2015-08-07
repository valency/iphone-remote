using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using System.Runtime.InteropServices;

namespace iLaser {
    public partial class Form2 : Form {
        [DllImport("gdi32")]
        public static extern IntPtr CreatePolygonRgn(Point[] lpPoint, int nCount, int nPolyFillMode);
        [DllImport("user32")]
        public static extern IntPtr SetWindowRgn(IntPtr hWnd, IntPtr hRgn, bool bRedraw);   

        public Form2() {
            InitializeComponent();
            this.TransparencyKey = this.BackColor;
        }

        private void Form2_Load(object sender, System.EventArgs e) {

        }
    }
}
