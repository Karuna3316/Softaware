using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["menuT"] = null;
            Session["objUser"] = null;
        }
    }
    [WebMethod]
    public static Redirecturl BindAccessTimeValue(string username, string password)
    {
        Redirecturl urlO = new Redirecturl();
        bool isExists = LoginDAL.chkUser(username, password);
        if (isExists)
        {
            urlO.url = "Dashboard.aspx";
        }

        return urlO;
    }

    [WebMethod]
    public static int SendRequest(ForgotPassword SupportObj)
    {

        return ForgetpwdDAL.SendRequestForgotPwd(SupportObj);
    }
}