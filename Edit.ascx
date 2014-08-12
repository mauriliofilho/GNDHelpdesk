<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="GND.Modules.GNDHelpdesk.Edit" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

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
            </section>
        </div>
    </fieldset>

    <footer>
        <asp:LinkButton ID="btnSubmit" runat="server"
            OnClick="btnSubmit_Click" resourcekey="btnSubmit" CssClass="button" />
        <asp:LinkButton ID="btnCancel" runat="server"
            OnClick="btnCancel_Click" resourcekey="btnCancel" CssClass="button button-secondary" />
    </footer>
</div>




