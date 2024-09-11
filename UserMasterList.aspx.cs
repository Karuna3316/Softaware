using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserMasterList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static Userobj getUsermaster()
    {
        try
        {
            Userobj objLstLR = UserMasterDAL.GetUserMaster();
            return objLstLR;
        }
        catch (Exception ex)
        {
            Utilities.LogErrorToFile("Error in UserMasterList_getUsermaster(): " + ex.Message);
            throw(ex);
        }
    }

    [WebMethod]
    public static int Deleteusermaster(UserMasters lReqId)
    {
        try
        {
            return UserMasterDAL.DeleteuserMaster(lReqId);
        }
        catch (Exception ex)
        {

            Utilities.LogErrorToFile("Error in UserMasterList_DeleteuserMaster(): " + ex.Message);
            throw (ex);
        }
    }
}