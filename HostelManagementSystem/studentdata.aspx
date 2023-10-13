<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentdata.aspx.cs" Inherits="HostelManagementSystem.studentdata" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="regno" HeaderText="Registation Number" 
                    SortExpression="regno" />
                <asp:BoundField DataField="sname" HeaderText="Student Name" 
                    SortExpression="sname" />
                <asp:BoundField DataField="gov_id_name" HeaderText="Government ID Name" 
                    SortExpression="gov_id_name" />
                <asp:BoundField DataField="gov_id" HeaderText="Government ID Number" 
                    SortExpression="gov_id" />
                <asp:BoundField DataField="doj" HeaderText="Date of join" 
                    SortExpression="doj" />
                <asp:BoundField DataField="house" HeaderText="House" SortExpression="house" />
                <asp:BoundField DataField="po" HeaderText="Post Office" SortExpression="po" />
                <asp:BoundField DataField="ps" HeaderText="Police Station" 
                    SortExpression="ps" />
                <asp:BoundField DataField="dist" HeaderText="District" SortExpression="dist" />
                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                <asp:BoundField DataField="pincord" HeaderText="Pincord" 
                    SortExpression="pincord" />
                <asp:BoundField DataField="phno" HeaderText="Phone Number" 
                    SortExpression="phno" />
                <asp:BoundField DataField="email" HeaderText="Email Id" 
                    SortExpression="email" />
                <asp:BoundField DataField="food_like" HeaderText="Liked Food" 
                    SortExpression="food_like" />
                <asp:BoundField DataField="pass" HeaderText="Password" SortExpression="pass" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:rohitdbConnectionString %>" 

            DeleteCommand="DELETE FROM [student1] WHERE [regno] = @regno" 
            InsertCommand="INSERT INTO [student1] ([regno], [sname], [gov_id_name], [gov_id], [doj], [house], [po], [ps], [dist], [city], [pincord], [phno], [email], [food_like], [pass]) VALUES (@regno, @sname, @gov_id_name, @gov_id, @doj, @house, @po, @ps, @dist,@city,@pincord,@phno,@email,@food_like,@pass)" 
            SelectCommand="SELECT * FROM [student1]"
            UpdateCommand="UPDATE [student1] SET [regno] = @regno, [sname] = @sname, [gov_id_name] = @gov_id_name, [gov_id] = @gov_id, [doj] = @doj, [house] = @house, [po] = @po, [ps] = @ps, [dist] = @dist, [city] = @city, [pincord] = @pincord, [phno] = @phno, [email] = @email, [food_like] = @food_like, [pass] = @pass WHERE [regno] = @regno">
           
            <DeleteParameters>
                <asp:Parameter Name="regno" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="regno" Type="String" />
                <asp:Parameter Name="sname" Type="String" />
                <asp:Parameter Name="gov_id_name" Type="String" />
                <asp:Parameter Name="gov_id" Type="String" />
                <asp:Parameter Name="doj" Type="string" />
                <asp:Parameter Name="house" Type="string" />
                <asp:Parameter Name="po" Type="string" />
                <asp:Parameter Name="ps" Type="String" />
                <asp:Parameter Name="dist" Type="String" />
                <asp:Parameter Name="city" Type="string" />
                <asp:Parameter Name="pincord" Type="int32" />
                <asp:Parameter Name="phno" Type="int64" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="food_like" Type="String" />
                <asp:parameter Name="pass" type ="string" />
            </InsertParameters>
            <UpdateParameters>
               <asp:Parameter Name="regno" Type="String" />
                <asp:Parameter Name="sname" Type="String" />
                <asp:Parameter Name="gov_id_name" Type="String" />
                <asp:Parameter Name="gov_id" Type="String" />
                <asp:Parameter Name="doj" Type="string" />
                <asp:Parameter Name="house" Type="string" />
                <asp:Parameter Name="po" Type="string" />
                <asp:Parameter Name="ps" Type="String" />
                <asp:Parameter Name="dist" Type="String" />
                <asp:Parameter Name="city" Type="string" />
                <asp:Parameter Name="pincord" Type="int32" />
                <asp:Parameter Name="phno" Type="int64" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="food_like" Type="String" />
                <asp:parameter Name="pass" type ="string" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Back" />
    
        <br />
    
    </div>
    </form>
</body>
</html>
