using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RoleMasterList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static lstRoleMasterObj getRoleMasterList()
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];
            return RoleMasterDAL.GetRoleMasterList();
        }
        catch (Exception ex)
        {

            Utilities.LogErrorToFile("Error in RoleMasterList_GetRoleMasterList(): " + ex.Message);
            throw (ex);
        }
    }



    [WebMethod]
    public static int DeleteRoleMaster(int lReqId) 
    {
        try
        {

            int affectedRows = 0;
            User oU = (User)HttpContext.Current.Session["objUser"];
            affectedRows = RoleMasterDAL.DeleteRoleMaster(lReqId);
            return affectedRows;
        }
        catch (Exception ex)
        {

            Utilities.LogErrorToFile("Error in RoleMasterList_DeleteRoleMaster(): " + ex.Message);
            throw (ex);
        }
    }
}