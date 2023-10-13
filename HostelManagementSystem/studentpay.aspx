<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentpay.aspx.cs" Inherits="HostelManagementSystem.studentpay" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student Payment</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Student Payment</h2>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Student Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtsname" class="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtemail" class="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Payment Date (dd-mm-yy):"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtpdate" class="form-control" type="date" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Amount:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtrs" class="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Transaction ID:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txttransid" class="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnadd" class="btn btn-primary" runat="server" Text="Add" OnClick="btnadd_Click1" />
                        <asp:Button ID="btnback" class="btn btn-primary" runat="server" Text="Back" OnClick="btnback_Click1" />
                        <asp:Button ID="btndis" class="btn btn-primary" runat="server" Text="Display" OnClick="btndis_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
