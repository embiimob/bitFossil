<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Build.aspx.cs" Inherits="Abuse.Build" %>
 <%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<!DOCTYPE html>
<style>

a {
   color:#A0A0A0;
}

html,
body {
	margin:0;
	padding:0;
	height:100%;
	font-family:Arial, Helvetica, sans-serif;
	font-size:small;
	background:black;
	color:#A0A0A0;
}
#wrapper {
	min-height:100%;
	position:relative;
}
#header {
	padding:10px;
     margin: 0 auto;
     width: 50%;
}
#content {
	padding-top:10px;
	padding-bottom:30px;   /* Height of the footer element */
   	margin: 0 auto;
    width: 50%;
}
#footer {
	
	height:30px;
	position:absolute;
	bottom:0;  
	right:20px;
}

</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Abuse</title>
    <meta name=viewport content="width=device-width, initial-scale=1">
    <!--<base href="http://bitfossil.com" />-->
</head>

<body>
<div class="wrapper">

 
<div id="header"><center><a href="/index.aspx"><img width="150" border="0" src="/bitfossil.png"></a></center></div>
		<div id="content">
                <form id="s" runat="server">
                <center>
            <div><p><asp:Label ID="lblStatus" runat="server"><h1>Sorry we couldn't find the transaction you're looking for.</h1>Please select a blockchain and enter a Transaction ID and we will attempt to rebuild it.</asp:Label></p></div>
            <div><p>
                <asp:DropDownList ID="lstBlockChains" runat="server" Height="24px">
                    <asp:ListItem Value="ANC">Anoncoin</asp:ListItem>
                    <asp:ListItem Selected="True" Value="BTC">Bitcoin</asp:ListItem>
                    <asp:ListItem Value="BTC-T">Bitcoin Test</asp:ListItem>
                    <asp:ListItem Value="DTC">Datacoin</asp:ListItem>
                    <asp:ListItem Value="DOGE">Dogecoin</asp:ListItem>
                    <asp:ListItem Value="LTC">Litecoin</asp:ListItem>
                    <asp:ListItem Value="MZC">Mazacoin</asp:ListItem>
                    <asp:ListItem Value="POT">Potcoin</asp:ListItem>
                    <asp:ListItem Value="FLO">Florincoin</asp:ListItem>
                </asp:DropDownList>
&nbsp;<asp:TextBox ID="TransID" runat="server" Font-Size="Small" Width="382px" MaxLength="64" Rows="1" Height="18px">ENTER TRANSACTION ID HERE</asp:TextBox></p></div>
            <div><p><recaptcha:RecaptchaControl ID="recaptcha" runat="server"  PublicKey="6LeYr_sSAAAAAFgSvNR8Aej_wJbzW7XzFJwVq6Ld"  PrivateKey="6LeYr_sSAAAAAJZgcQgInf96xqp4IN2U0RtgMhIG" Theme="blackglass" Visible="True" /></p></div>
            <div><p><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SOLVE THE CAPTCHA TO SUBMIT" Visible="True" Width="286px" /></p></div>
            </center>
            </form>
 </div>
<div id="footer">[ <a href="/abuse.aspx">report abuse</a> | <a href="/catalog.htm">index</a> ] &nbsp;&nbsp; &copy; <a href=http://hugpuddle.org>hugpuddle</a></div>

        
 
    </div>
</body>
</html>
