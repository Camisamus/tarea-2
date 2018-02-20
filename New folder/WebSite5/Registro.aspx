<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            width: 100%;
        }
        .style9
        {
        }
        .style10
        {
            width: 191px;
        }
        .style11
        {
            width: 174px;
            height: 26px;
        }
        .style12
        {
            width: 191px;
            height: 26px;
        }
        .style13
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style8">
        <tr>
            <td class="style9">
                Nombre</td>
            <td class="style10">
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" Width="181px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Llenar nombre"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Fecha de contrato</td>
            <td class="style10">
                <asp:TextBox ID="TextBox2" runat="server" MaxLength="2" Width="41px"></asp:TextBox>
                <asp:TextBox ID="TextBox3" runat="server" MaxLength="2" Width="41px"></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server" MaxLength="4" Width="83px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="Dia requerido"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="Mes requerido"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="Especificar año"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Clave</td>
            <td class="style10">
                <asp:TextBox ID="TextBox5" runat="server" MaxLength="10" 
                     TextMode="Password" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox5" ErrorMessage="Ingrese clave"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style11">
                Repetir clave</td>
            <td class="style12">
                <asp:TextBox ID="TextBox6" runat="server" MaxLength="10" TextMode="Password" 
                    Width="181px"></asp:TextBox>
            </td>
            <td class="style13">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextBox6" ErrorMessage="Repita Clave"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox5" ControlToValidate="TextBox6" 
                    ErrorMessage="Claves diferentes"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style9" colspan="3">
                <br />
                Todos los nuevos vendedores deben registrarce con una venta. ingresar datos de 
                la misma a continuacion.<br />
            </td>
        </tr>
        <tr>
            <td class="style9">
                Departamento</td>
            <td class="style10">
                <asp:ListBox ID="ListBox1" runat="server" Width="188px" 
                    DataSourceID="SqlDataSource1" DataTextField="nombredepto" 
                    DataValueField="iddepto"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dendedorConnectionString %>" 
                    SelectCommand="SELECT [iddepto], [nombredepto] FROM [Depto]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                Monto</td>
            <td class="style10">
                <asp:TextBox ID="TextBox7" runat="server" MaxLength="7" Width="179px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TextBox7" ErrorMessage="Monto de primera venta requerido"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                <asp:Button ID="Button1" runat="server" Text="Aceptar" 
                    onclick="Button1_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

