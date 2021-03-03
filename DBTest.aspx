<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DBTest.aspx.cs" Inherits="URPSSPSuccessTracker.DBTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button runat="server" ID="btnTest" OnClick="btnTest_Click" Text="Test DB Connection" />
            <asp:Label runat="server" ID="lblTest" Text="null"></asp:Label>
        </div>
        <div>
            <asp:Button runat="server" ID="btnTest2" OnClick="btnTest2_Click" Text="Test Load Instruction" />
            <asp:Label runat="server" ID="lblTest2" Text="null"></asp:Label>
        </div>
    </form>
</body>
</html>
