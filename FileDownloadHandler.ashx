<%@ WebHandler Language="C#" Class="FileDownloadHandler" %>

using System;
using System.Web;
using System.IO;

public class FileDownloadHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string username = "", filename ="";
        if (context.Request["username"] != null)
            username = context.Request["username"];
        if (context.Request["fname"] != null)
            filename = HttpUtility.HtmlDecode(context.Request["fname"]);
        string fname = System.Configuration.ConfigurationManager.AppSettings["FileFolder"] + "\\" + username + "\\" + filename;
        FileInfo fiObj = new FileInfo(fname);
        if (fiObj.Exists)
        {
            HttpContext.Current.Response.ContentType = "application/octet-stream";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
            HttpContext.Current.Response.TransmitFile(fname);
            HttpContext.Current.Response.End();
        }
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}