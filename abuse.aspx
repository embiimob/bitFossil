<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="abuse.aspx.cs" Inherits="Abuse.Utility" %>
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

 
<div id="header"><center><a href="/index.aspx"><img width="150" border="0" src="bitfossil.png"></a></center></div>
		<div id="content">
                <form id="s" runat="server">
                <center>
                <div><p><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="25px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="488px">
                <asp:ListItem Value="SELECT">Why are you here?</asp:ListItem>                
                <asp:ListItem Value="GRAPHIC">Inappropriate content (Nudity, violence, etc.)</asp:ListItem>
                <asp:ListItem Value="ABUSE">Abuse/Harassment (Someone is attacking me)</asp:ListItem>
                <asp:ListItem Value="PRIVACY">Privacy (Someone is using my image)</asp:ListItem>
                <asp:ListItem Value="TRADEMARK">Trademark infringement (Someone is using my trademark)</asp:ListItem>
                <asp:ListItem Value="COPYRIGHT">Copyright infringement (Someone copied my creation)</asp:ListItem>
                <asp:ListItem Value="HACKER">Security Concerns (Phishing, malware, etc)</asp:ListItem>
                <asp:ListItem Value="ILLEGAL">Any content forbidden by law or statute.</asp:ListItem>
                </asp:DropDownList></p></div>
            <div><p><asp:TextBox ID="TransID" runat="server" Font-Size="Small" Width="480px" MaxLength="64" Rows="1">ENTER TRANSACTION ID HERE</asp:TextBox></p></div>
            <div><p><recaptcha:RecaptchaControl ID="recaptcha" runat="server"  PublicKey="6LeYr_sSAAAAAFgSvNR8Aej_wJbzW7XzFJwVq6Ld"  PrivateKey="6LeYr_sSAAAAAJZgcQgInf96xqp4IN2U0RtgMhIG" Theme="blackglass" Visible="False" /></p></div>
            <div><p><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SOLVE THE CAPTCHA TO SUBMIT" Visible="False" Width="286px" /></p></div>
            <div><p><asp:Label ID="lblStatus" runat="server"></asp:Label></p></div>
             </center>
            </form>
 </div>
<div id="footer">[ <a href="abuse.aspx">report abuse</a> | <a href="catalog.htm">index</a> ] &nbsp;&nbsp; &copy; <a href=http://hugpuddle.org>hugpuddle</a></div>

        
 
    </div>
</body>
</html>
