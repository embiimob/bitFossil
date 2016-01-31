using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Text;

namespace Abuse
{

    public partial class index : System.Web.UI.Page
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {

        }

         protected void Button1_Click(object sender, EventArgs e)
        {
            //unable to add command parameters doing best to prevent injection hacks.
            string strInput = RemoveSpecialCharacters(searchEntry.Text);

            if (strInput.Length > 0)
            {
                string scope = Server.MapPath("~");

                Regex regex = new Regex(@"([a-fA-F0-9]{64})");
                string connectionString = "Provider=Search.CollatorDSO;Extended Properties=\"Application=Windows\"";
                HashSet<string> imgExtensions = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
                {
                    ".jpg", ".jpeg", ".jpe", ".gif", ".png", ".tiff", ".tif", ".svg", ".svgz", ".xbm", ".bmp", ".ico"
                };

                OleDbConnection connection = new OleDbConnection(connectionString);

                string strSearchCount = lstSearchCount.Text;
                string query = @"SELECT TOP " + strSearchCount + " System.ItemFolderPathDisplay FROM SystemIndex WHERE scope ='file:" + scope + "' and FREETEXT('" + strInput + "') ORDER BY System.DateModified DESC";
                OleDbCommand command = new OleDbCommand(query, connection);
                connection.Open();
                HashSet<string> result = new HashSet<string>();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string searchString = reader.GetString(0);
                    Match match = regex.Match(searchString);
                    if (match.Success)
                    {
                        result.Add(match.Value);
                    }
                }
                connection.Close();
                if (result.Count > 0)
                {
                    string searchHTML = "";
                    var uniqueResults = result.Distinct();
                    foreach (string s in uniqueResults)
                    {
                        var signature = "";
                        var img = "";
                        //var file = "";
                        var msg = "";
                        var date = "";
                        var blockchain = "";
                        var profiles = "";
                        var doc = new HtmlAgilityPack.HtmlDocument();
                        try
                        {
                            doc.Load(scope + s + "\\index.htm");
                        }
                        catch { break; }


                        try
                        {
                            img = doc.GetElementbyId("img0").InnerText;
                            searchHTML = searchHTML + "<div class=\"item\"><div class=\"content\"><table><tr><th rowspan=\"6\"><a href=\"" + s + "/index.htm\"><img src=\"" + s + "/" + img + "\" /></a></th><th></th></tr>";
                        }
                        catch { searchHTML = searchHTML + "<div class=\"item\"><div class=\"content\"><table><tr><th rowspan=\"6\"></th><th></th></tr>"; }
                        try { signature = doc.GetElementbyId("signature").InnerText; }
                        catch { }
                        try { blockchain = doc.GetElementbyId("blockchain").InnerText; }
                        catch { }
                        searchHTML = searchHTML + "<tr><td>" + blockchain + " - " + signature + "</td></tr>";
                        try { date = doc.GetElementbyId("block-date").InnerText; }
                        catch { }
                        try { msg = doc.GetElementbyId("msg1").InnerText; }
                        catch { }
                        try { profiles = doc.GetElementbyId("profiles").InnerHtml; }
                        catch { }
                        searchHTML = searchHTML + "<tr><td><a href=\"" + s + "/index.htm\">" + msg.PadRight(50).Substring(0, 49) + "</a></td></tr>";

                        if (msg.Length > 500)
                        { searchHTML = searchHTML + "<tr><td>" + date + " : " + msg.Substring(0, 499) + "...</td></tr>"; }
                        else { searchHTML = searchHTML + "<tr><td>" + date + " : " + msg + "</td></tr>"; }
                        if (profiles.Length > 0)
                        {
                            searchHTML = searchHTML + "<tr><td>"+ profiles +"</td></tr>";
                        }
                            searchHTML = searchHTML + "<tr><td><a href=\"" + s + "/index.htm\"><font size=\"1\">" + s + "</font></a></td></tr></table></div></div>";

                    }
                    results.InnerHtml = searchHTML;

                }
                else
                { results.InnerHtml = "<div class=\"item\"><div class=\"content\">No results found</div></div>"; }
            }
        }
         public static string RemoveSpecialCharacters(string str)
         {
             StringBuilder sb = new StringBuilder();
             foreach (char c in str)
             {
                 if ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == '.' || c == '_' || c == '!' || c == '?' || c == ' ' || c == '#')
                 {
                     sb.Append(c);
                 }
             }
             return sb.ToString();
         }
    
    }
}
