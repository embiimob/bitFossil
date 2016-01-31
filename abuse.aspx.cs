using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Abuse
{
    public partial class Utility : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["TransID"] != null) TransID.Text = Request.QueryString["TransID"];
            if (Request.QueryString["Type"] != null) DropDownList1.SelectedValue = Request.QueryString["Type"];
            if (DropDownList1.SelectedValue != "SELECT")
            {
                Button1.Visible = true;
                recaptcha.Visible = true;
                TransID.Visible = true;
            }
            else
            {
                Button1.Visible = false;
                recaptcha.Visible = false;
                TransID.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid) //Will be true if captcha text is correct otherwise it will be false
            {
                System.IO.StreamWriter file = new System.IO.StreamWriter(Server.MapPath("~/" + DropDownList1.SelectedValue + ".RPT"));
                file.WriteLine(TransID.Text);
                file.Close();
                TransID.Visible = false;
                recaptcha.Visible = false;
                Button1.Visible = false;
                DropDownList1.Visible = false;

                lblStatus.Text = "your request has been submitted for review";
            }
            else
            {
                lblStatus.Text = "sorry that wasn't correct. try again.";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != "SELECT")
            {
                Button1.Enabled = true;
                recaptcha.Visible = true;
            }
        }
    }
}