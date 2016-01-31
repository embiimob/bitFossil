<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recent.aspx.cs" Inherits="Abuse.recent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"> 
<meta http-equiv="refresh" content="300">
<meta charset="UTF-8" /><title>bitFossil - Recent</title><meta name="description" content="bitFossil is a searchable index of data archived onto blockchains using Apertus." />

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
    <div>
      <br />
       <a href="/index.aspx"><img src="bitfossil.png" Width="150px" border="0"></a>
        <br />
        <div>
                <div class="main" id="results"><%Response.Write(DisplayResults());%></div>
                <br />
                <div id="footer">[ <a href="abuse.aspx">report abuse</a> | <a href="catalog.htm">index</a> ] &nbsp;&nbsp; &copy; <a href=http://hugpuddle.org>hugpuddle</a></div>
                
    </div>
    </div>
    </form>
        </center>
</body>
</html>
