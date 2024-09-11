using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web.Services;
using System.IO;

public partial class Location : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static int SaveorUpdateLocation(locationlist objLocation)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return LocationDAL.SaveorUpdateLocation(objLocation);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Location_SaveorUpdateLocation(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static locationlist Bindlocation(int MasterID)
    {
        try
        {

            User oU = (User)HttpContext.Current.Session["objUser"];

            return LocationDAL.GetLocationforEdit(MasterID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Location_GetLocationforEdit(): " + ex.Message);
            throw (ex);

        }
    }
}