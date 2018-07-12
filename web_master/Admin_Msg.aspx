﻿<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_Msg, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<%@ Register TagPrefix="LS" TagName="Inc" Src="Inc.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>留言管理</title>
    <LS:Inc ID="Inc1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" id="cpcontainer">
    <asp:Panel ID="AddUp" runat="server" Visible="false">

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
   <tr class="partition">
     <td height="28" colspan="2" class="titl"><asp:Literal ID="Txt_Title" runat="server"></asp:Literal></td>
   </tr>
   <tr>
     <td width="10%" height="33" align="right">name：</td>
     <td width="90%"><asp:Literal ID="Uname" runat="server"></asp:Literal></td>
    </tr>
    <tr>
      <td align="right">Email：</td>
      <td><asp:Literal ID="Email" runat="server"></asp:Literal></td>
    </tr>
    <tr>
      <td align="right">position：</td>
      <td><asp:Literal ID="position" runat="server"></asp:Literal></td>
    </tr>
     <tr>
      <td align="right">work：</td>
      <td><asp:Literal ID="work" runat="server"></asp:Literal></td>
    </tr>
     <tr>
      <td align="right">Protfolio：</td>
      <td><asp:Literal ID="Protfolio" runat="server"></asp:Literal></td>
    </tr>
   <tr>
     <td align="right">MsgTime：</td>
     <td><asp:Literal ID="AddDate" runat="server"></asp:Literal></td>
   </tr>
   <tr>
     <td>&nbsp;</td>
      <td><input type="button" name="button" id="button" value=" 返 回 " class="btn" onClick="history.go(-1)"></td>
    </tr>
</table>
    </asp:Panel>
    
    <asp:Panel ID="Main" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
<tr class="title">
    <td>
      <asp:TextBox ID="KeyWords" runat="server" Width="250" style="margin:auto;" CssClass="txt"></asp:TextBox>
      <asp:DropDownList ID="Search_Option" runat="server" CssClass="txt" Height="22"></asp:DropDownList>
      <asp:Button ID="Button2" runat="server"  OnClick="OnClick_Search" Text=" 搜 索 " CssClass="btn"/>
	</td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
    <tr class="partition">
      <td width="4%" align="center">ID</td>
      <td width="15%" align="center">position</td>
      <td width="15%" align="center">name</td>
      <td width="15%" align="center">email</td>
      <td width="19%" align="center">datetime</td>
      <td width="12%" align="center">handle</td>
    </tr>
  
   <asp:Repeater ID="Repeater1" runat="server">
   <ItemTemplate>
    <tr class="hover">
      <td align="center"><input name="id" class="checkbox" type="checkbox" value="<%#Eval("id")%>"></td>
      <td align="center" ><%#Eval("position")%></td>
      <td align="center"><%#Eval("Uname")%></td>
      <td align="center"><%#Eval("Email")%></td>
      <td align="center"><%#Eval("addtime")%></td>
      <td align="center">
      <a href="?Action=ViewMsgFunc&id=<%#Eval("ID")%>">查看留言</a>
      <a href="?Action=DelMsg&MenuID=<%=Request.QueryString["MenuID"]%>&ID=<%#Eval("ID")%>&BackURL=<%#LS.Common.Function.GetEncodeURL()%>" onClick="return(confirm('确定删除吗？'))"><img src="images/icon_drop.gif" alt="删除" width="16" height="16" border="0" align="absmiddle"></a></td>
     
      </td>
    </tr>
    </ItemTemplate>
<FooterTemplate>
    <tr class="hover" id="Tr1" runat="server" Visible="<%#bool.Parse((Repeater1.Items.Count==0).ToString())%>" >
    <td align="center" colspan="6" style="height:0px; padding:4px; margin:0;">无相关数据!</td>
    </tr>
</FooterTemplate>
</asp:Repeater>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:10px 0;">
  <tr>
    <td width="15%" align="left">
    <input name="chkall" type="checkbox" id="chkall" value="all" class="checkbox" onClick="CheckAll(this.form)" /> 全选
    <asp:Button ID="submitid" runat="server"  OnClick="DelSelect_Click" Text="清除所选留言" CssClass="btn"/>
    <input name="BackURL" type="hidden" id="Hidden1" value="<%=LS.Common.Function.GetDecodeURL()%>">
    </td>
    <td width="83%"><div class="msdn"><webdiyer:AspNetPager id="AspNetPager1" runat="server" CurrentPageButtonClass="current" FirstPageText="Home" PrevPageText="Prev" NextPageText="Next" LastPageText="End" 
                                                   ShowDisabledButtons="true" onpagechanged="AspNetPager1_PageChanged" UrlPaging="true" PageIndexBoxClass="input_page" PageIndexBoxType="TextBox" SubmitButtonClass="go" SubmitButtonText="GO" ShowPageIndexBox="Always"></webdiyer:aspnetpager></div></td>
  </tr>
</table>
</asp:Panel>
    
    </div>
    </form>
</body>
</html>
