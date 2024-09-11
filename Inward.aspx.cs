using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inwards : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static supplierdropdown[] getSupplier()
    {
        try
        {
            return InwardDAL.GetSupplierDropdown();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Inwards_GetSupplierDropdown(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static POnumber[] getPONumber(int SupplierId)
    {
        try
        {
            return InwardDAL.GetPoNumberDropdown(SupplierId);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Inwards_GetPoNumberDropdown(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static Product[] GetProduct(int SupplierId, int IsPONO,string SPoNumber)
    {
        try
        {
            return InwardDAL.GetproductDropdown(SupplierId, IsPONO, SPoNumber);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Inwards_GetproductDropdown(): " + ex.Message);
            throw (ex);
        }
    }


    [WebMethod]
    public static Inward getQty(int InwardId,int ProductsID)
    {
        try
        {
            return InwardDAL.GetQtyprice(InwardId, ProductsID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Inwards_GetQtyprice(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static int SaveOrUpdateinward(Inward inObj)
    {
        try
        {

            return InwardDAL.saveOrUpdateInward(inObj);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Inwards_SaveOrUpdateinward(): " + ex.Message);
            throw (ex);
        }

    }

    [WebMethod]
    public static Inward BindeditInward(int InwardId)
    {
        try
        {

            return InwardDAL.GetInwardEdit(InwardId);
        }

        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Inwards_GetInwardEdit(): " + ex.Message);
            throw (ex);
        }
    }

    [WebMethod]
    public static Inward Getlastprice(int ProductsId, int IsPONO)
    {
        try
        {
            return InwardDAL.Getlastprice(ProductsId, IsPONO);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in Inwards_Getlastprice(): " + ex.Message);
            throw (ex);
        }
    }

}