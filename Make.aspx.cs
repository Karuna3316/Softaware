using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.IO;

public partial class Make : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static int SaveorUpdateMake(MakesList ObjMake)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return MakeDAL.SaveorUpdateMake(ObjMake);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Make_SaveorUpdateMake(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static MakesList BindMake(int MasterID)
    {
        try
        {

            User oU = (User)HttpContext.Current.Session["objUser"];

            return MakeDAL.GetMakeforEdit(MasterID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Make_GetMakeforEdit(): " + ex.Message);
            throw (ex);
        }
    }
}