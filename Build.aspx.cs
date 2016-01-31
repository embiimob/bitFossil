using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Abuse
{
    public partial class Build : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["TransID"] != null) TransID.Text = Request.QueryString["TransID"];


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid) //Will be true if captcha text is correct otherwise it will be false
            {
                Match match = Regex.Match(TransID.Text, @"([a-fA-F0-9]{64})");
                if (match.Success)
                {
                    System.IO.StreamWriter file = new System.IO.StreamWriter(Server.MapPath("~/batch.txt"));
                    file.WriteLine(match.Value + "@" + lstBlockChains.Text);
                    file.Close();
                    TransID.Visible = false;
                    recaptcha.Visible = false;
                    Button1.Visible = false;
                    lstBlockChains.Visible = false;
                    lblStatus.Text = "<h1>Thanks, We are working on your request.</h1> Please search the index for your transaction in about 5 minutes.";
                }
                else
                {
                    lblStatus.Text = "<h1>Sorry, You did not enter a valid Transaction ID.</h1> Please Try again.";
                }
            }
            else
            {
                lblStatus.Text = "sorry that wasn't correct. try again.";
            }
        }

      
    }
}