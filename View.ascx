<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="GND.Modules.GNDHelpdesk.View" %>

<asp:Panel runat="server" ID="pnlAddTicket">
    <div id="sky-form" class="sky-form">

    <fieldset>
        <div class="row">
            <section class="col col-6">
                <label class="input">
                    <i class="icon-prepend fa fa-user"></i>
                    <asp:TextBox ID="txtFName" runat="server" placeholder="First Name" />
                </label>
            </section>
            <section class="col col-6">
                <label class="input">
                    <i class="icon-prepend fa fa-user"></i>
                    <asp:TextBox ID="txtLName" runat="server" placeholder="Last Name" />
                </label>
            </section>
        </div>
        <div class="row">
            <section class="col col-6">
                <label class="input">
                    <i class="icon-prepend fa fa-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="E-mail" />
                </label>
            </section>
            <section class="col col-6">
                <label class="input">
                    <i class="icon-prepend fa fa-phone"></i>
                    <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone" />
                </label>
            </section>
        </div>
        <div class="row">
            <section class="col col-6">
                <label for="txtDescription" class="input">
                    <asp:TextBox ID="txtDescription" runat="server" Placeholder="Description" />
                </label>
            </section>
            <section class="col col-6">
                <label class="select">
                    <%--<dnn:label ID="lblAssignedUser" runat="server" CssClass="label" />--%>
                    <asp:DropDownList ID="ddlAssignedUser" runat="server">
                       
                    </asp:DropDownList>
                    <i></i>
                </label>


            </section>
        </div>
        <div class="row">
            <section class="col col-6">
                <label class="textarea">
                    <asp:TextBox ID="txtDetails" runat="server" TextMode="MultiLine" Rows="3" Columns="20" Placeholder="Details" />
                </label>
            </section>
            <section class="col col-3">
                <label class="select">
                    <asp:DropDownList runat="server" ID="ddlPriority">
                        <asp:ListItem Enabled="True" Selected="False">Priority</asp:ListItem>
                        <asp:ListItem>Normal</asp:ListItem>
                        <asp:ListItem>High</asp:ListItem>
                        <asp:ListItem>Low</asp:ListItem>
                    </asp:DropDownList>
                    <i></i>
                </label>
            </section>
            <section class="col col-3">
                <label class="input">
                    <asp:HyperLink ID="lnkDueDate" runat="server"><i class="icon-append fa fa-calendar"></i></asp:HyperLink>
                    <asp:TextBox ID="txtDueDate" runat="server" Placeholder="Due Date" CssClass="hasDatepicker" />
                </label>
            </section>
        </div>
        <div class="row">
            <section class="col col-6">
                <label class="label">Add Attachment</label>
                <label for="file" class="input input-file">
                    
                        <input type="file" id="file" onchange="this.parentNode.nextSibling.value = this.value">
                    
                </label>
            &nbsp;&nbsp;</section>
        </div>
    </fieldset>

    <footer>
        <asp:LinkButton ID="btnSubmit" runat="server"
            resourcekey="btnSubmit" CssClass="button" OnClick="btnSubmit_Click" />
        <asp:LinkButton ID="btnCancel" runat="server"
            resourcekey="btnCancel" CssClass="button button-secondary" OnClick="btnCancel_Click" />
    </footer>
</div>
</asp:Panel>

<asp:Repeater ID="rptItemList" runat="server" OnItemDataBound="rptItemListOnItemDataBound" OnItemCommand="rptItemListOnItemCommand">
    <HeaderTemplate>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Description</th>
                    <th>Created By</th>
                    <th>Assigned</th>
                    <th>Due Date</th>
                    <th>Status</th>
                    <th>Priority</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>

    <ItemTemplate>
        <tr>
            <td>
                <asp:Label ID="lblTicketId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"TicketId").ToString() %>' /></td>
            <td>
                <asp:Label ID="lblTicketName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"TicketName").ToString() %>' /></td>
            <td><asp:Label ID="lblCreatedBy" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"CreatedByUserId").ToString() %>' /></td></td>
            <td><asp:Label ID="lblAssigned" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"AssignedUserId").ToString() %>' /></td></td>
            <td><asp:Label ID="lblDueOnDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"DateDueOn").ToString() %>' /></td></td>
            <td><asp:Label ID="lblStatus" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Status").ToString() %>' /></td></td>
            <td><asp:Label ID="lblPriority" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Priority").ToString() %>' /></td></td>
            <td>
                <asp:Panel ID="pnlAdmin" runat="server" Visible="false">
                    <asp:HyperLink ID="lnkEdit" runat="server" ResourceKey="EditItem.Text" Visible="false" Enabled="false" CssClass="btn btn-xs btn-success" />
                    <asp:LinkButton ID="lnkDelete" runat="server" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" CommandName="Delete" CssClass="btn btn-xs btn-warning" />
                </asp:Panel>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </tbody>
     </table>
    </FooterTemplate>
</asp:Repeater>
