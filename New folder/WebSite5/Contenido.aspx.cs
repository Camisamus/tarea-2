using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Contenido : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string vendedor = (string)(Session["k"]);
        string vendedorid = (string)(Session["p"]);
        string vendedorfecha = (string)(Session["d"]);
        Label2.Text = vendedor;
        Label1.Text = vendedorid;
        Label3.Text = vendedorfecha;
        Session.Clear();
    }
}