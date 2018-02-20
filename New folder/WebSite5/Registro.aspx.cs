using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Registro : System.Web.UI.Page
{
    public SqlConnection sqlConnection;
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlstring = "Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\h\\Documents\\dendedor.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
        sqlConnection = new SqlConnection(sqlstring);
        Application["sqlConnection"] = sqlConnection;
        if (sqlConnection.State == ConnectionState.Open)
        {
            sqlConnection.Close();
        }
        sqlConnection.Open();
        if (sqlConnection.State != ConnectionState.Open)
        {
            Response.Write("<script>alert('database connection failed')</script>");
        }
        ListBox1.SelectedIndex = 0;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && TextBox1.Text != "" && TextBox1.Text != "" &&
            TextBox1.Text != "" && TextBox1.Text != "" && TextBox1.Text != "" &&
            TextBox1.Text != "")
        {
            if (Convert.ToInt32(TextBox2.Text)<=31 && Convert.ToInt32(TextBox2.Text)>=1 &&
                Convert.ToInt32(TextBox3.Text)<=12 && Convert.ToInt32(TextBox3.Text)>=1 &&
                Convert.ToInt32(TextBox4.Text)<=10000 && Convert.ToInt32(TextBox4.Text)>=2010
                && Convert.ToInt32(TextBox7.Text) >= 100 && Convert.ToInt32(TextBox7.Text) <= 10000000)
            {
                int dia=Convert.ToInt32(TextBox2.Text);
                int mes=Convert.ToInt32(TextBox3.Text);
                int ano=Convert.ToInt32(TextBox4.Text);
                int monto = Convert.ToInt32(TextBox7.Text);
                string clave=TextBox5.Text;
                string clave2=TextBox6.Text;
                string nombre=TextBox1.Text;
                string depto= ListBox1.SelectedValue;
                if (clave == clave2) 
                {
                    
                    string cmdStringcon = "SELECT login FROM  Vendedor ";
                    cmdStringcon += "WHERE login = @vend";

                    SqlCommand sqlCommandcon = new SqlCommand();
                    SqlDataReader sqlReadercon;

                    sqlCommandcon.Connection = sqlConnection;
                    sqlCommandcon.CommandType = CommandType.Text;
                    sqlCommandcon.CommandText = cmdStringcon;
                    sqlCommandcon.Parameters.Add("@vend", SqlDbType.Char, 8).Value = nombre;
                    sqlReadercon = sqlCommandcon.ExecuteReader();
                    String m = "n";

                    while (sqlReadercon.Read())
                    {
                        m += sqlReadercon["login"];
                    }
                    sqlReadercon.Close();
                    if (m == "n")
                    {
                        // a partir de aqui sabemos que todos los valores estan bien puestos
                        Response.Write("<script>alert('todos los valores funcionan')</script>");

                        string sCon = "Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\h\\Documents\\dendedor.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
                        string sel;

                        sel = "INSERT INTO Vendedor (login, clave, fecha_contrato)"
                        + "VALUES (@login,@clave,@fecha)";

                        string fechasql = dia + "/" + mes + "/" + ano;
                        string z = fechasql;
                        string ass = "";
                        using (SqlConnection con = new SqlConnection(sCon))
                        {
                            SqlCommand cmd = new SqlCommand(sel, con);
                            cmd.Parameters.AddWithValue("@login", nombre);
                            cmd.Parameters.AddWithValue("@clave", clave);
                            cmd.Parameters.AddWithValue("@fecha", z);

                            con.Open();
                            int t = cmd.ExecuteNonQuery();
                            con.Close();
                            // esto ingreso el usuario
                            string cmdStringcon1 = "SELECT        idvendedor FROM            Vendedor ";
                            cmdStringcon1 += "WHERE        (login =@nombre)";

                            SqlCommand sqlCommandcon1 = new SqlCommand();
                            SqlDataReader sqlReadercon1;
                            // sqlConnection.Open();
                            sqlCommandcon1.Connection = sqlConnection;
                            sqlCommandcon1.CommandType = CommandType.Text;
                            sqlCommandcon1.CommandText = cmdStringcon1;
                            sqlCommandcon1.Parameters.Add("@nombre", SqlDbType.Char, 8).Value = nombre;
                            sqlReadercon1 = sqlCommandcon1.ExecuteReader();
                            while (sqlReadercon1.Read())
                            {
                                ass += sqlReadercon1["idvendedor"];
                            }
                            sqlReadercon1.Close();
                            sqlConnection.Close();
                            //esto asigno g como el idendedor
                        }
                            string sel1;
                            sel1 = "INSERT INTO Ventas (idvendedor, iddepto, cant_ventas, monto_ventas)"
                            + " VALUES (@a,@b,@c,@d)";
                            using (SqlConnection con = new SqlConnection(sCon))
                        {
                            SqlCommand cmd1 = new SqlCommand(sel1, con);
                          

                            cmd1.Parameters.AddWithValue("@a", ass);
                            cmd1.Parameters.AddWithValue("@b", depto);
                            cmd1.Parameters.AddWithValue("@c", 1);
                            cmd1.Parameters.AddWithValue("@d", monto);

                            con.Open();
                            int k = cmd1.ExecuteNonQuery();
                            con.Close();


                            // asta aqui sabemos que todos los valores estan bien puestos
                        }
                    }
                    else { Response.Write("<script>alert('usuario ya registrado')</script>"); TextBox1.Text = ""; }
                }else {Response.Write("<script>alert('algo esta mal')</script>"); }
            }else {Response.Write("<script>alert('algo esta mal')</script>"); }
        }else {Response.Write("<script>alert('algo esta mal')</script>"); }
    }
}