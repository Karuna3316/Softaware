using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Outwards : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static Customerdropdown[] BindCustomerName()
    {
        try
        {
            return OutwardDAL.GetCustomerNameDrp();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Outwards_CustomerName(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static Outwarddropdown[] BindOutwardType()
    {
        try
        {
            return OutwardDAL.GetOutwardTypeDrp();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Outwards_OutwardType(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static Productdropdown[] BindProduct(int OutwardId)
    {
        try
        {
            return OutwardDAL.GetProductDrp(OutwardId);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Outwards_ProductName(): " + ex.Message);
            throw (ex);

        }
    }

    [WebMethod]
    public static Outward getQty(int OutwardId, string ProductsId)
    {
        try
        {
            return OutwardDAL.getQtyprice(OutwardId, ProductsId);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Outwards_getQtyprice():" + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static int SaveOrUpdateOutward(Outward OutObj)
    {
        try
        {

            return OutwardDAL.SaveOrUpdateOutward(OutObj);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Outwards_SaveOrUpdateOutward(): " + ex.Message);
            throw (ex);
        }

    }


    [WebMethod]
    public static Outward GetOutwardforEdit(int OutwardId)
    {
        try
        {

            return OutwardDAL.GetOutwardforEdit(OutwardId);
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Outwards_GetOutwardforEdit(): " + ex.Message);
            throw (ex);
        }
    }
    [WebMethod]
    public static Outward BindDCNo()
    {
        Outward objAT = new Outward();
        Hashtable objHT = new Hashtable();

        DataTable dtObj = OutwardDAL.GetResultAsTable("BindDCyear", objHT);
        if (dtObj != null && dtObj.Rows.Count > 0)
        {

            if (dtObj.Rows[0]["DCNo"] != null && dtObj.Rows[0]["DCNo"].ToString() != "")
                objAT.DCNo = dtObj.Rows[0]["DCNo"].ToString();
        }
        return objAT;

    }
}