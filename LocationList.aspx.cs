using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LocationList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static lstLocationObj getLocationList()
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];
            return LocationDAL.getLocationList();
        }
        catch (Exception ex)
        {

            Utilities.LogErrorToFile("Error in LocationList_getLocationList(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static int DeleteLocation(int lReqId)
    {
        try
        {

            int affectedRows = 0;
            User oU = (User)HttpContext.Current.Session["objUser"];
            affectedRows = LocationDAL.DeleteLocation(lReqId);
            return affectedRows;
        }
        catch (Exception ex)
        {

            Utilities.LogErrorToFile("Error in LocationList_DeleteLocation(): " + ex.Message);
            throw (ex);
        }
    }
}