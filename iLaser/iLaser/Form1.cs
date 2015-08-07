using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text.RegularExpressions;
using System.Runtime.InteropServices;

namespace iLaser {
    public partial class Form1 : Form {
        [DllImport("user32.dll")]
        static extern bool SetCursorPos(int X, int Y);
        [DllImport("user32.dll")]
        static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, int dwExtraInfo);

        public Form1() {
            InitializeComponent();
            System.Net.IPAddress[] addressList = Dns.GetHostEntry(Dns.GetHostName()).AddressList; 
            if (addressList.Length>1) textBox8.Text= addressList[1].ToString();
        }

        private void button1_Click(object sender, EventArgs e) {
            Form2 form2 = new Form2();
            if (!checkBox1.Checked) form2.Show();
            Point p = form2.Location;
            Point pp = form2.Location;
            TcpListener server = null;
            textBox5.Text = this.Location.X.ToString();
            textBox6.Text = this.Location.Y.ToString();
            try {
                Int32 port = Int32.Parse(textBox4.Text);
                IPAddress localAddr = IPAddress.Parse(textBox8.Text);
                server = new TcpListener(localAddr, port);
                server.Start();
                Byte[] bytes = new Byte[256];
                String data = null;
                while (true) {
                    Application.DoEvents();
                    TcpClient client = server.AcceptTcpClient();
                    data = null;
                    NetworkStream stream = client.GetStream();
                    int i;
                    while ((i = stream.Read(bytes, 0, bytes.Length)) != 0) {
                        data = System.Text.Encoding.ASCII.GetString(bytes, 0, i);
                        string regex = "(\\d*), (\\d*)\\D(.*)";
                        Match con_m = Regex.Match(data, regex);
                        textBox1.Text = con_m.Groups[1].Value;
                        textBox2.Text = con_m.Groups[2].Value;
                        textBox3.Text = con_m.Groups[3].Value;
                        if (textBox3.Text == "S") {
                            p = new Point(Int32.Parse(textBox1.Text), Int32.Parse(textBox2.Text));
                            pp = form2.Location;
                        }
                        else if (textBox3.Text == "M") {
                            form2.Location = new Point(pp.X + (Int32.Parse(textBox1.Text) - p.X) * Int32.Parse(textBox7.Text), pp.Y + (Int32.Parse(textBox2.Text) - p.Y) * Int32.Parse(textBox7.Text));
                            if (checkBox1.Checked) SetCursorPos(pp.X + (Int32.Parse(textBox1.Text) - p.X) * Int32.Parse(textBox7.Text), pp.Y + (Int32.Parse(textBox2.Text) - p.Y) * Int32.Parse(textBox7.Text));
                        }
                        if (data == "LEFT") {
                            mouse_event((int)(0x2), 0, 0, 0, 0);
                            mouse_event((int)(0x4), 0, 0, 0, 0);
                        }
                        else if (data == "RIGHT") {
                            mouse_event((int)(0x08), 0, 0, 0, 0);
                            mouse_event((int)(0x10), 0, 0, 0, 0);
                        }
                        Application.DoEvents();
                    }
                    client.Close();
                    Application.DoEvents();
                }
            }
            catch { }
        }
    }
}
