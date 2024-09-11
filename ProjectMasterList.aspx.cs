using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectMasterList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static ProMobj getProjectmaster()
    {
        try
        {
            return ProjectMasterDAL.GetProjectMaster();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProjectMasterList_GetProjectMaster(): " + ex.Message);
            throw(ex);
        }
    }


    [WebMethod]
    public static int DeleteprojectMaster(int lReqId)
    {
        try
        {
            int affectedRows = 0;
            User oU = (User)HttpContext.Current.Session["objUser"];
            affectedRows = ProjectMasterDAL.deleteProjectMaster(lReqId);
            return affectedRows;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProjectMasterList_deleteProjectMaster(): " + ex.Message);
            throw (ex);
        }

    }

}