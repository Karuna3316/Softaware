using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.IO;

public partial class IndustryType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    public static int SaveorUpdateIndustryType(IndustryTypesList objIndustryType)
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];

            return IndustryTypeDAL.SaveorUpdateIndustryType(objIndustryType);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in IndustryType_SaveorUpdateIndustryType(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static IndustryTypesList BindIndustryType(int MasterID)
    {
        try
        {

            User oU = (User)HttpContext.Current.Session["objUser"];

            return IndustryTypeDAL.GetIndustryTypeforEdit(MasterID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in IndustryType_GetIndustryTypeforEdit(): " + ex.Message);
            throw (ex);
        }
    }



}

  




  