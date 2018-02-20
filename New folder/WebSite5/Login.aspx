<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            width: 100%;
        }
        .style9
        {
            width: 218px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style8">
        <tr>
            <td class="style9">
                Nombre:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" TabIndex="1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Clave:</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" MaxLength="10" TextMode="Password" 
                    TabIndex="2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style9">
                <asp:Label ID="Label1" runat="server" Text="Ingreso incorrecto" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Log in" onclick="Button2_Click" 
                    TabIndex="3" />
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" PostBackUrl="~/Registro.aspx" 
                    Text="Registro" TabIndex="4" onclick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

