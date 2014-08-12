/*
' Copyright (c) 2014  GND Software Ltd
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using System;
using DotNetNuke.Entities.Users;
using GND.Modules.GNDHelpdesk.Components;
using DotNetNuke.Services.Exceptions;

namespace GND.Modules.GNDHelpdesk
{
    /// -----------------------------------------------------------------------------
    /// <summary>   
    /// The Edit class is used to manage content
    /// 
    /// Typically your edit control would be used to create new content, or edit existing content within your module.
    /// The ControlKey for this control is "Edit", and is defined in the manifest (.dnn) file.
    /// 
    /// Because the control inherits from GNDHelpdeskModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class Edit : GNDHelpdeskModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Implement your edit logic for your module
                if (!Page.IsPostBack)
                {
                    //get a list of users to assign the user to the Object
                    ddlAssignedUser.DataSource = UserController.GetUsers(PortalId);
                    ddlAssignedUser.DataTextField = "DisplayName";
                    ddlAssignedUser.DataValueField = "UserId";
                    ddlAssignedUser.DataBind();
                    

                    //check if we have an ID passed in via a querystring parameter, if so, load that item to edit.
                    //ItemId is defined in the ItemModuleBase.cs file
                    if (ItemId > 0)
                    {
                        var tc = new TicketController();

                        var t = tc.GetTicket(ItemId, ModuleId);
                        if (t != null)
                        {
                            txtDescription.Text = t.TicketName;
                            txtDetails.Text = t.TicketDescription;
                            txtDueDate.Text = t.DateDueOn.ToShortDateString();
                            ddlPriority.Items.FindByValue(t.Priority).Selected = true;

                            ddlAssignedUser.Items.FindByValue(t.AssignedUserId.ToString()).Selected = true;
                        }
                    }
                    else
                    {
                        ddlAssignedUser.Items.Add("Assigned Contact");
                        ddlAssignedUser.Items.FindByText("Assigned Contact").Selected = true;
                    }
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var t = new Ticket();
            var tc = new TicketController();

            if (ItemId > 0)
            {
                t = tc.GetTicket(ItemId, ModuleId);
                t.TicketName = txtDescription.Text.Trim();
                t.TicketDescription = txtDetails.Text.Trim();
                t.Priority = "Normal";
                t.Status = "New";
                t.DateDueOn = Convert.ToDateTime(txtDueDate.Text);
                t.LastModifiedByUserId = UserId;
                t.LastModifiedOnDate = DateTime.Now;
                t.AssignedUserId = Convert.ToInt32(ddlAssignedUser.SelectedValue);
            }
            else
            {
                t = new Ticket()
                {
                    AssignedUserId = Convert.ToInt32(ddlAssignedUser.SelectedValue),
                    CreatedByUserId = UserId,
                    CreatedOnDate = DateTime.Now,
                    TicketName = txtDescription.Text.Trim(),
                    TicketDescription = txtDetails.Text.Trim(),
                    DateDueOn = Convert.ToDateTime(txtDueDate.Text),
                    Status = "New",
                    Priority = ddlPriority.SelectedValue,
                  
                };
            }

            t.LastModifiedOnDate = DateTime.Now;
            t.LastModifiedByUserId = UserId;
            t.ModuleId = ModuleId;

            if (t.TicketId > 0)
            {
                tc.UpdateTicket(t);
            }
            else
            {
                tc.CreateTicket(t);
            }
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }
    }
}