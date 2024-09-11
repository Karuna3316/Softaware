using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MakeList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static lstMakeObj getMakeList()
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];
            return MakeDAL.getMakeList();
        }
        catch (Exception ex)
        {

            Utilities.LogErrorToFile("Error in MakeList_GetMakeList(): " + ex.Message);
            throw(ex);
        }
    }


    [WebMethod]
    public static int DeleteMake(int lReqId)
    {
        try
        {

            int affectedRows = 0;
            User oU = (User)HttpContext.Current.Session["objUser"];
            affectedRows = MakeDAL.DeleteMake(lReqId);
            return affectedRows;
        }
        catch (Exception ex)
        {

            Utilities.LogErrorToFile("Error in MakeList_DeleteMake(): " + ex.Message);
            throw (ex);
        }
    }
}