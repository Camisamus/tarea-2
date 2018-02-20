<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Contenido.aspx.cs" Inherits="Contenido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Vendedor:
        </p>
    <p>
        Id:
        <asp:Label ID="Label1" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nombre: <asp:Label ID="Label2" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fecha de contrato: <asp:Label ID="Label3" runat="server"></asp:Label>
    </p>
    <p>
        Ventas:</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="departamento" HeaderText="departamento" 
                    SortExpression="departamento" />
                <asp:BoundField DataField="# de Ventas" HeaderText="# de Ventas" 
                    SortExpression="# de Ventas" />
                <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dendedorConnectionString %>" 
            SelectCommand="SELECT Depto.nombredepto AS departamento, Ventas.cant_ventas AS [# de Ventas], Ventas.monto_ventas AS monto FROM Ventas INNER JOIN Depto ON Ventas.iddepto = Depto.iddepto WHERE (Ventas.idvendedor = @idvendedor)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="idvendedor" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server"  
            PostBackUrl="~/Login.aspx" Text="Volver" />
    </p>
</asp:Content>

