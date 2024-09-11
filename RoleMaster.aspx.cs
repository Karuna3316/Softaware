using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RoleMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static int SaveorUpdateRoleMaster(RoleMastersList objRoleMaster)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return RoleMasterDAL.SaveorUpdateRoleMaster(objRoleMaster);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in RoleMaster_SaveorUpdateRoleMaster(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static RoleMastersList BindRoleMaster(int roleId)
    {
        try
        {

            User oU = (User)HttpContext.Current.Session["objUser"];

            return RoleMasterDAL.GetRoleMasterforEdit(roleId);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in RoleMaster_GetRoleMasterforEdit(): " + ex.Message);
            throw (ex);

        }
    }
}
