<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Abuse.index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="UTF-8" /><title>bitFossil</title><meta name="description" content="bitFossil is a searchable index of data archived onto blockchains using Apertus." />
</head>
     <style>

     img {
	max-width: 200px;
	max-height: 200px;
	}

a {
   color:#A0A0A0;
}

html,
body {
	margin:0;
	padding:0;
	height:100%;
	font-family:Arial, Helvetica, sans-serif;
	background:black;
	color:#A0A0A0;
    text-align: center;
}
.main {
	overflow: hidden; /* this will clear the float from .item */
	max-width:95%;
}

.main .item {
	margin: 10px;
        max-width: 1000px;

       
}

.searchBox {
	margin: 5px;
    max-width: 700px;
    width: 80%;
}


.main .item .content {
	
    background: Black;
	color:#fff;
    text-align:left;
}

.main .item .content table { 
	max-width: 1000px; 
	}

 </style>
<body> 
    <center>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>
        <br />
       <a href="/index.aspx"><img src="bitfossil.png" Width="150px" border="0"></a>
        <br />
        <div>
        <asp:TextBox ID="searchEntry" runat="server" class="searchBox" MaxLength="500" Font-Size="Medium"></asp:TextBox>
        <asp:DropDownList ID="lstSearchCount" runat="server" Font-Size="Medium">
                <asp:ListItem Selected="True">50</asp:ListItem>
                <asp:ListItem>100</asp:ListItem>
                <asp:ListItem>150</asp:ListItem>
                <asp:ListItem>200</asp:ListItem>
                <asp:ListItem>250</asp:ListItem>
                <asp:ListItem>500</asp:ListItem>
                <asp:ListItem>1000</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="searchButton" runat="server" OnClick="Button1_Click" Text="Search" Font-Size="Medium" />
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="1000"></asp:UpdateProgress>
             <asp:UpdatePanel ID="searchResultsPanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                <div class="main" id="results" clientidmode="Static" runat="server"></div>
                <br />
                <div id="footer">[ <a href="abuse.aspx">report abuse</a> | <a href="recent.aspx">recent</a> | <a href="catalog.htm">index</a> ] &nbsp;&nbsp; &copy; <a href=http://hugpuddle.org>hugpuddle</a></div>
                </ContentTemplate>
                 <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="searchButton" EventName="Click" />
                 </Triggers>
             </asp:UpdatePanel>
    </div>
    </form>
 </center>   
</body>
</html>
