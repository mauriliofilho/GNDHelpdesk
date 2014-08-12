<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Comments.ascx.cs" Inherits="GND.Modules.GNDHelpdesk.Controls.Comments" %>

<asp:Panel ID="pnlCreateComment">
    <section>
        <label class="label"></label>
        <label class="textarea">
            <i class="icon-append fa fa-comment"></i>
            <textarea rows="3" name="review" id="review" placeholder="Text of the review"></textarea>
        </label>
    </section>
</asp:Panel>
