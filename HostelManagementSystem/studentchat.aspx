﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentchat.aspx.cs" Inherits="HostelManagementSystem.studentchat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 759px;
            margin-bottom: 4px;
        }
        .style2
        {
            height: 493px;
        }
        .style4
        {
            height: 86px;
        }
        .style5
        {
            height: 83px;
        }
    </style>
</head>

<form id="form1" runat="server">
<table class="style1">
    <tr>
        <td align="center" class="style5" colspan="2">
          <h1><asp:Label ID="Label1" runat="server" ClientIDMode="Static" Text="GROUP CHAT"></asp:Label></h1>
        </td>
    </tr>
    <tr>
        <td bgcolor="#CCCCCC" colspan="2" class="style4">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Logged in as :"></asp:Label>
            <asp:Label ID="txtuser" runat="server" Font-Bold="True" Text=" user"></asp:Label>
            <asp:Label ID="said" runat="server" Text="said" Visible="False"></asp:Label>
            <asp:Label ID="display" runat="server" Text="display" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style2" bgcolor="White" colspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                CellPadding="4" DataSourceID="SqlDataSource1" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="user_name" HeaderText="user_name" 
                        SortExpression="user_name" />
                    <asp:BoundField DataField="said" HeaderText="said" SortExpression="said" />
                    <asp:BoundField DataField="send_message" HeaderText="send_message" 
                        SortExpression="send_message" />
                    <asp:BoundField DataField="group_name" HeaderText="group_name" 
                        SortExpression="group_name" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:rohitdbConnectionString %>" 
                SelectCommand="SELECT * FROM [message]">
            </asp:SqlDataSource>
            </td>
    </tr>
    <tr>
        <td align="left" bgcolor="#CCCCCC">
            <asp:Button ID="button1" runat="server" Height="50px" Text="Back" CausesValidation ="false" 
                Width="115px" BackColor="Red" BorderStyle="Double" Font-Bold="True" 
                onclick="button1_Click" />
        </td>
        <td align="right" bgcolor="#CCCCCC">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="RequiredFieldValidator" ForeColor="#CC3300" 
                ControlToValidate="txtmessage">Please type the message</asp:RequiredFieldValidator>
            <asp:TextBox ID="txtmessage" runat="server" Height="54px" Width="612px" 
                BorderStyle="Solid" ForeColor="#CCFFCC"></asp:TextBox>
            <asp:Button ID="btnok" runat="server" Height="50px" Text="Send" 
                Width="115px" BackColor="Lime" BorderStyle="Double" Font-Bold="True" 
                onclick="btnok_Click1" />
        </td>
    </tr>
</table>
</form>
</html>
