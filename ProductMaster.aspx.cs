using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Products[] BindMake()
    {
        try
        {
            return ProductMasterDAL.GetMake();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProductMaster_Products(): " + ex.Message);
            throw (ex);
        }
    }
    [WebMethod]
    public static Suppliers[] BindSupplier()
    {
        try
        {
            return ProductMasterDAL.GetSupplier();
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProductMaster_ Suppliers(): " + ex.Message);
            throw (ex);
        }
    }
    [WebMethod]
    public static int SaveOrUpdateProducts(ProductMasters ProdObj)
    {
        try
        {
            return ProductMasterDAL.SaveOrUpdateProductMaster(ProdObj);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProductMaster_SaveOrUpdateProducts(): " + ex.Message);
            throw (ex);
        }
    }
    [WebMethod]
    public static ProductMasters BindProductMasterForEdit(int ProductsID)
    {
        try
        {
            return ProductMasterDAL.GetProductMasterForEdit(ProductsID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProductMaster_BindProductMasterForEdit(): " + ex.Message);
            throw (ex);
        }
    }
    [WebMethod]
    public static lstProductMastersHistory GetProductMasterHistory(int ProductsID)
    {
        try
        {
            return ProductMasterDAL.GetProductMasterHistory(ProductsID);
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in ProductMaster_GetProductMasterHistory(): " + ex.Message);
            throw (ex);
        }
    }
}