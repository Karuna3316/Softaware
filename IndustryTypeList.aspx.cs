using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IndustryTypeList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static lstIndustryTypeObj GetIndustryTypeList()
    {
        try
        {
            User oU = (User)HttpContext.Current.Session["objUser"];
            return IndustryTypeDAL.getIndustryTypeList();
        }
        catch (Exception ex)
        {

            Utilities.LogErrorToFile("Error in IndustryTypeList_GetIndustryTypeList(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static int DeleteIndustryType(int lReqId)
    {
        try
        {

            int affectedRows = 0;
            User oU = (User)HttpContext.Current.Session["objUser"];
            affectedRows = IndustryTypeDAL.DeleteIndustryType(lReqId);
            return affectedRows;
        }
        catch (Exception ex)
        {

            Utilities.LogErrorToFile("Error in IndustryTypeList_DeleteIndustryType(): " + ex.Message);
            throw (ex);
        }
    }
}