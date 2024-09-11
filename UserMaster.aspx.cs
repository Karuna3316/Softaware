using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static UserMasters getUserMaster(int userId)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return UserMasterDAL.GetUserMasterforEdit(userId);
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in UserMaster_GetUserMasterforEdit(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static int saveuserMaster(UserMasters objuser)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return UserMasterDAL.SaveUserMaster(objuser);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in UserMaster_SaveUserMaster(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static DesignationLists[] designation()
    {
        return UserMasterDAL.BindDesignation();
    }

    [WebMethod]
    public static RoleList[] Roles()
    {
        return UserMasterDAL.BindRole();
    }
   
}