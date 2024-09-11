using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static int saveprojectMaster(ProjectMasters objpro)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return ProjectMasterDAL.SaveProjectMaster(objpro);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProjectMaster_SaveProjectMaster: " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static ProjectMasters getProjectMaster(int ProjectID)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return ProjectMasterDAL.GetprojectMasterforEdit(ProjectID);
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProjectMaster_GetprojectMasterforEdit: " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static StatusList[] status()
    {
        return ProjectMasterDAL.Bindstatus();
    }

    [WebMethod]
    public static ProjectMasters BindPid()
    {
        ProjectMasters objAT = new ProjectMasters();
        Hashtable objHT = new Hashtable();

        DataTable dtObj = ProjectMasterDAL.GetResultAsTable("BindProjectID", objHT);
        if (dtObj != null && dtObj.Rows.Count > 0)
        {

            if (dtObj.Rows[0]["Project"] != null && dtObj.Rows[0]["Project"].ToString() != "")
                objAT.Project = dtObj.Rows[0]["Project"].ToString();
        }
        return objAT;

    }

}