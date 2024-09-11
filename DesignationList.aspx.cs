﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesignationList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static lstDesignationObj getDesignation()
    {
        try
        {
            lstDesignationObj objLstLR = DesignationDAL.GetDesignation();
            return objLstLR;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in DesignationList_GetDesignation(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static int DeleteDesignation(int lReqId)
    {
        try
        {
            int affectedRows = 0;
            User oU = (User)HttpContext.Current.Session["objUser"];
            affectedRows = DesignationDAL.DeleteDesignation(lReqId);
            return affectedRows;
        }
        catch (Exception ex)
        {

            Utilities.LogErrorToFile("Error in DesignationList_DeleteDesignation(): " + ex.Message);
            throw (ex);
        }
    }
}