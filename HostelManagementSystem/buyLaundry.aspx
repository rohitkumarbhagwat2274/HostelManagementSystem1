<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buyLaundry.aspx.cs" Inherits="YourNamespace.buyLaundry" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Buy Laundry</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="form-group">
            <div class="container">
            <h1>Buy New Coupon</h1>

            <div class="form-group">
                <label class="col-xs-11">Buyer User Name:</label>
                <div class="col-xs-11">
                    <asp:TextBox ID="username" runat="server" CssClass="form-control" 
                        Text='<%# Session["username"] %>' ReadOnly="True"></asp:TextBox>
                </div>
            </div>
            </div>

            <div class="form-group">
                <h3><label class="col-xs-11">Coupon Details:</label></h3>
                <div class="col-xs-11">
                    <asp:GridView ID="couponnumber" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="couponid" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="couponNumber" HeaderText="couponNumber" 
                                SortExpression="couponNumber" />
                            <asp:BoundField DataField="mfg" HeaderText="mfg" SortExpression="mfg" />
                            <asp:BoundField DataField="exp" HeaderText="exp" SortExpression="exp" />
                            <asp:BoundField DataField="rs" HeaderText="rs" SortExpression="rs" />
                            <asp:BoundField DataField="status" HeaderText="status" 
                                SortExpression="status" />
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
                        SelectCommand="SELECT * FROM [couponTable]"></asp:SqlDataSource>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-11">Coupon Number:</label>
                <div class="col-xs-11">
                    <asp:DropDownList ID="ddlCouponNumber" runat="server" OnSelectedIndexChanged="ddlCouponNumber_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-11">Price:</label>
                <div class="col-xs-11">
                    <asp:Label ID="priceLabel" runat="server"></asp:Label>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-11">Buy Date :</label>
                <div class="col-xs-11">
                    <asp:TextBox ID="TextBox1" type="date" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-11">
                <h3>
                   <asp:Label ID="status" runat="server" Text="Un Active" Visible="False"></asp:Label>
                    </h3>
                    <asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" CssClass="btn-success" 
                        OnClick="btnBuyNow_Click" />
                    
                  
                    <br />
                    <h1>My Active Coupon</h1><asp:GridView ID="GridView1" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="monthlycouponid" 
                        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="couponNumber" HeaderText="couponNumber" 
                            SortExpression="couponNumber" />
                        <asp:BoundField DataField="coupondate" HeaderText="coupondate" 
                            SortExpression="coupondate" />
                        <asp:BoundField DataField="status" HeaderText="status" 
                            SortExpression="status" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:rohitdbConnectionString %>" 
                        SelectCommand="SELECT * FROM [studentMonthlycouponTable]">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        </div>
    </form>
</body>
</html>