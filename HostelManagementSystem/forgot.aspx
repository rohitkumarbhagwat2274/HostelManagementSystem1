<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot.aspx.cs" Inherits="HostelManagementSystem.forgot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background-color: #008080;
        }

        .container {
            width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #008080;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group .error-message {
            color: red;
        }

        .btn-container {
            text-align: center;
        }

        .btn-container button {
            padding: 10px 20px;
            background-color: #008080;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-container button:hover {
            background-color: #006666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
            <h1>Forgot Password</h1>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            </p>
            <div class="form-group">
                <label for="list">Choose your Identity</label>
                <asp:DropDownList ID="list" runat="server">
                    <asp:ListItem>Employee</asp:ListItem>
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>User</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtuser">User Name</label>
                <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtuser" ErrorMessage="User name can't be empty" CssClass="error-message"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="txtpwd">Password</label>
                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd" ErrorMessage="Password can't be empty" CssClass="error-message"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="conform">Confirm Password</label>
                <asp:TextBox ID="conform" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="conform" ErrorMessage="Confirm Password can't be empty" CssClass="error-message"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtpwd" ControlToValidate="conform" ErrorMessage="Passwords do not match" CssClass="error-message"></asp:CompareValidator>
            </div>

    
                    <asp:Button ID="save" runat="server" onclick="save_Click" Text="Save" />
              
               
                    <asp:Button ID="back" runat="server"  onclick="back_Click" Text="Back" ValidationGroup="False"  />
               
    
  
    </form>
</body>
</html>
