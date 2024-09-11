using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Designation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static int saveDesignation(DesignationObj objDesignation)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return DesignationDAL.saveDesignation(objDesignation);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Designation_saveDesignation(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static DesignationObj BindDesignation(int DesignationID)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return DesignationDAL.GetDesignationDate(DesignationID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Designation_GetDesignationDate(): " + ex.Message);
            throw (ex);
        }
    }
}