<html xmlns:bizsolo="http://www.savvion.com/sbm/BizSolo" xmlns:sbm="http://www.savvion.com/sbm" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:xalan="http://xml.apache.org/xalan" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:sfe="http://www.savvion.com/sbm/sfe" xmlns:c="http://java.sun.com/jstl/core">
<head><META http-equiv="Content-Type" content="text/html; charset=utf-8">

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.savvion.BizSolo.Server.*,com.savvion.BizSolo.beans.*,java.util.Vector" %>
<%@ page errorPage="/BizSolo/common/jsp/error.jsp" %>
<%@ taglib uri="/BizSolo/common/tlds/bizsolo.tld" prefix="bizsolo" %>
<%@ taglib uri="/bpmportal/tld/bpmportal.tld" prefix="sbm" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sfe" uri="http://jmaki/v1.0/jsp" %>
  <jsp:useBean id="bizManage" class="com.savvion.sbm.bizmanage.api.BizManageBean" scope="session"></jsp:useBean>
  <jsp:useBean id="bean" class="com.savvion.BizSolo.beans.Bean" scope="session"></jsp:useBean>
  <jsp:useBean id="factoryBean" class="com.savvion.BizSolo.beans.EPFactoryBean" scope="session"></jsp:useBean>
  <jsp:useBean id="bizSite" class="com.savvion.sbm.bpmportal.bizsite.api.BizSiteBean" scope="session"></jsp:useBean>
<%! String _PageName = "Place Order"; %>
<%! String __webAppName = "CustomerOrderVehicle"; %>
<% pageContext.setAttribute( "contextPath", request.getContextPath()+"/"); %>
<bizsolo:if test='<%=_PageName.equals(request.getParameter("_PageName")) %>'>
    <bizsolo:setDS name=""></bizsolo:setDS>
    <bizsolo:setDS name="bizsite_instanceName,bizsite_priority"></bizsolo:setDS>
    <bizsolo:executeAction epClassName="com.savvion.BizSolo.beans.PAKCreatePI" perfMethod="commit" mode="BizSite" dsi=""></bizsolo:executeAction>
<% /* Workaround, retAddr will disappear in the future */ %>
<% String retAddr = bean.getPropString("returnPage"); %>
<% if(retAddr != null) { %>
<bizsolo:redirectURL page="<%= retAddr %>"/>
<% } %>
</bizsolo:if>
<bizsolo:if test='<%= ! _PageName.equals(request.getParameter("_PageName")) %>'>
    <bizsolo:initApp mode="BizSite" name="CustomerOrderVehicle" refresh="true"></bizsolo:initApp>
    <bizsolo:initDS name="bizsite_instruction"></bizsolo:initDS>
    <bizsolo:initDS name="bizsite_priority" hexval="FALSE"></bizsolo:initDS>
    <bizsolo:initDS name="bizsite_instanceName" hexval="FALSE"></bizsolo:initDS>
    <bizsolo:executeAction epClassName="com.savvion.BizSolo.beans.PAKGetDS" perfMethod="commit" mode="BizSite" dso=""></bizsolo:executeAction>
</bizsolo:if>

<title>Place Order</title>
<!-- Javascript -->
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/initControls.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/customValidation.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/prototype.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/effects.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/scriptaculous.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/pwr.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/engine.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/cal.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/util.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/utilities.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/fvalidate/fValidate.config.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/fvalidate/fValidate.core.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/fvalidate/fValidate.lang-enUS.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/fvalidate/fValidate.validators.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/fvalidate/pValidate.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/document.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/jscalendar/calendar.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/jscalendar/calendar-en.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/jscalendar/calendar-setup.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>dwr/interface/adapterDWR.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/utilities/utilities.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/container/container-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/connection/connection-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/resize/resize-beta-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/animation/animation-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/json/json-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/logger/logger-min.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/checkboxvalidation/SpryValidationCheckbox.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/confirmvalidation/SpryValidationConfirm.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/passwordvalidation/SpryValidationPassword.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/radiovalidation/SpryValidationRadio.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/selectvalidation/SpryValidationSelect.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/textareavalidation/SpryValidationTextarea.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry/textfieldvalidation/SpryValidationTextField.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/spry//SpryEffects.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/ext/adapter/ext/ext-base.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/ext/ext-all.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/ext/PagingRowNumberer.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/BmViewport.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/WaitDialog.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/LoggerDialog.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/ResizableDialog.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/FormWidget.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/FormPanel.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/FormWidgetHandler.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/TransactionAjaxObject.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/BusinessObjectHandler.js"></script>
<script language="JavaScript" src="<c:out value='${contextPath}'/>bpmportal/javascript/sbm/sbm.utils.js"></script>
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/fonts/fonts.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/resize/assets/skins/sam/resize.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/container/assets/skins/sam/container.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/yahoo/logger/assets/skins/sam/logger.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/checkboxvalidation/SpryValidationCheckbox.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/confirmvalidation/SpryValidationConfirm.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/textareavalidation/SpryValidationTextarea.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/passwordvalidation/SpryValidationPassword.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/radiovalidation/SpryValidationRadio.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/selectvalidation/SpryValidationSelect.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/spry/textfieldvalidation/SpryValidationTextField.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/ext/resources/css/ext-all.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/javascript/ext/resources/css/xtheme-default.css">
<link rel="stylesheet" type="text/css" href="<c:out value='${contextPath}'/>bpmportal/css/theme01/bm-all.css">
<script language="JavaScript">
 Ext.BLANK_IMAGE_URL = '<c:out value='${contextPath}'/>bpmportal/javascript/ext/resources/images/default/s.gif';
	 
	  var isIFrame = <%= (PublicResources.INTERACTIVE_MODE.equalsIgnoreCase(bean.getPropString(PublicResources.MODE)) || PublicResources.SLAVE_MODE.equalsIgnoreCase(bean.getPropString(PublicResources.MODE))) ? true : false %>;
	  
<!--
    function AlertReassign()
    {
      if (document.form.elements['bizsite_assigneeName'].value == '' )
      {
        alert('Please provide assignee name!')
        document.form.elements['bizsite_assigneeName'].focus();
        return false;
      }
      else
      {
        return true;
      }
    }
    
    var uploadWnd;
    var param;
 
    function openDocAttWin( slotName,sesID, ptname, piname, docurl, docServer, readonly, ismultiline, appendwith, isStart )
    {
      param = 'bzsid=' + sesID;
      param += '&pt=' + ptname;
      param += '&pi=' + piname;
      param += '&ds=' + slotName;
      param += '&docurl=' + docurl;
      param += '&readonly=' + readonly;
      param += '&ismultiline=' + ismultiline;
      param += '&appendwith=' + appendwith;
      param += '&isPICreation=' + isStart;
      uploadWnd = openDocumentPresentation(docServer + '/BizSite.DocAttacher?' + param, isIFrame);
    }

    function setCheckBoxStyleForIE()
    {
      var isIE = (navigator.appName == "Microsoft Internet Explorer") ? 1 : 0;
      var w_Elements = document.getElementsByTagName("input");
      for ( i=0; i < w_Elements.length; ++i)
      {
          if(isIE && (w_Elements.item(i).getAttribute("type") == "checkbox" || w_Elements.item(i).getAttribute("type") == "radio"))
            w_Elements.item(i).className = "ChkBoxNone";
      }
    }
    
    function onSuccess() {
    }
    
    
   function editDecimal(element,pms,scale)
    {
    if(typeof element == 'string') element = document.getElementById(element);
	var id = element.getAttribute('id');
	if (element != null)
	{
	      var newurl = '<c:out value='${contextPath}'/>bpmportal/common/pop_decimal_dataslot.jsp?elementID=' + id + '&pms=' + pms + '&scale=' + scale + '&value=' + element.value;
	      
        MM_openBrWindow(newurl,'editdecimal','scrollbars=yes,resizable=yes,width=690,height=174');
	}
}
//-->
</script>

<bizsolo:link rel="stylesheet"></bizsolo:link>

<sbm:setLocale value="<%= bizManage.getLocale() %>"></sbm:setLocale>
<% try{ %><sbm:setBundle scope="page" basename="CustomerOrderVehicle/properties/CustomerOrderVehicle"></sbm:setBundle><% } catch(Exception e){}%>
</head>
<body class="apbody yui-skin-sam" onUnload="pwr.removePakBizSoloBeanFromCache('<%=session.getId()%>', onSuccess);" onLoad="setCheckBoxStyleForIE();hideControls();beforeInitControls();initControls();initTabs();sbm.utils.onDOMReady();abc();">
<form method="post" name="form" onsubmit="return sbm.utils.onFormSubmit();">
<div id="northDiv"></div><% /* Workaround, activityName will disappear in the future */ %>
<% String activityName = bean.getPropString("workitemName"); %>
<div id="resultDiv">
<div style='visibility:hidden;display:none' class='vBoxClass' name='errors' id='errors'></div>
<input name="_PageName" type="hidden" value="Place Order">
<%if(bean.getPropString("workitemName") != null) {%><input name="_WorkitemName" type="hidden" value="<%= URLHexCoder.encode(bean.getPropString("workitemName")) %>"/><input name="_WorkitemId" type="hidden" value="<%= bean.getPropString("workitemId") %>"/><%}%>
<input name="bizsite_pagetype" type="hidden" value="start">
<input name="_ProcessTemplateName" type="hidden" value='<%=bean.getPropString("ptName")%>'>
<input name="_yahoo_flow_button" type="hidden" value=''>
<!-- Content --> 

    
      
    
    
<!-- Header -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td class="ApSegTblInBg">
<table border="0" cellspacing="0" align="center" cellpadding="4" width="100%">
<tr align="center">
<td class="ApSegTitle"><bizsolo:getLabel type="RESOURCE" name="processTemplateLabel_"></bizsolo:getLabel></td>
</tr></table>
<table border="0" cellspacing="1" align="center" cellpadding="4" width="100%" class="ApSegDataTbl">
<tr border="1" align="center">
<td border="1" width="15%" class="ApSegGenLabel"><bizsolo:getLabel type="RESOURCE" name="BIZSITE_INSTANCE_NAME_LABEL"></bizsolo:getLabel></td>
<td border="1" width="55%" class="ApSegGenData"><input name="bizsite_instanceName" size="30" maxlength="240" type="text" class="ApInptTxt"><script>addValue("bizsite_instanceName", "<bizsolo:getLabel type='RESOURCE' name='processTemplateLabel_'/>");</script></td>
<td border="1" width="15%" class="ApSegGenLabel"><bizsolo:getLabel type="RESOURCE" name="BIZSITE_PRIORITY_LABEL"></bizsolo:getLabel></td>
<td border="1" width="15%" class="ApSegGenData"><select name="bizsite_priority" class="ApInptSelect"><option value="critical"><bizsolo:getLabel type="RESOURCE" name="PRIORITY_CRITICAL"></bizsolo:getLabel></option><option value="high"><bizsolo:getLabel type="RESOURCE" name="PRIORITY_HIGH"></bizsolo:getLabel></option><option value="medium"><bizsolo:getLabel type="RESOURCE" name="PRIORITY_MEDIUM"></bizsolo:getLabel></option><option value="low"><bizsolo:getLabel type="RESOURCE" name="PRIORITY_LOW"></bizsolo:getLabel></option></select></td>
</tr>
<tr><td border="1" width="15%" class="ApSegGenLabel"><bizsolo:getLabel type="RESOURCE" name="BIZSITE_INSTRUCTION_LABEL"></bizsolo:getLabel></td>
<td border="1" colspan="3" class="ApSegGenData"><sbm:message key="workstep.Place Order.instruction"></sbm:message></td></tr>
</table>
</td>
</tr>
</table>

    <br clear="all">
<table align="left" cellpadding="0" cellspacing="0" class="ApSegDataTbl" id="table1" width="100%">
      <tbody>
        <tr>
          <td class="ApSegDataVal" width="69%" rowspan="1" colspan="1" valign="top">
            <br clear="all">
<div class="SbmTabSection" id="tabbedPane1">
<div style=""><div class="x-hide-display" id="tabbedPane1_page1">

                <font color="#000000">
                  <Label class="ApSegDataslotLabel" for="list1"><sbm:message key="OUT.eTestDriveWS.2_1"></sbm:message></Label>
                </font>
                <select size="5" id="list1" style="width:276px; height:52px; " name="OUT.eTestDriveWS.2_1" disabled></select><script>addValue("OUT.eTestDriveWS.2_1", '<bizsolo:value name="OUT.eTestDriveWS.2_1"></bizsolo:value>');</script>

                <input type="checkbox" value="true" class="ApInptChkBox" name="OUT.result.1_0" id="checkBox1">
<script>addValue("OUT.result.1_0", '<bizsolo:value name="OUT.result.1_0"></bizsolo:value>');</script>
      

              </div>
<div class="x-hide-display" id="tabbedPane1_page2">
</div>
<div class="x-hide-display" id="tabbedPane1_page3">

                <br clear="all">
<sfe:widget name="sbm.combobox" id="cbOptionsGroup1" args="{'size':20, 'readonly':true, 'disabled':false, 'cascade':false, 'level':0, 'validationType':'none', 'validation':{}, 'toolTip':'Savvion Combobox widget.', 'tabOrder':'0', 'service':'radioVehicleBrand.sjs'}" />

                <select size="1" class="ApInptSelect" id="cbOptions1"></select>

                <br clear="all">
<br clear="all">
<sfe:widget name="sbm.combobox" id="cbOptionsGroup2" args="{'size':20, 'readonly':true, 'disabled':false, 'cascade':false, 'level':0, 'validationType':'none', 'validation':{}, 'toolTip':'Savvion Combobox widget.', 'tabOrder':'0', 'service':'radioVehicleBrand.sjs'}" />

                <select size="1" class="ApInptSelect" id="cbOptions2"></select>

              </div>
</div>
</div>

          </td>
        </tr>
      </tbody>
    </table>
    <br clear="all">
<br clear="all">
<br clear="all">
<br clear="all">


</div>
<!-- Footer -->

<div id="cmdDiv">
<table width="100%" cellpadding="0" align="center" cellspacing="0" border="0">
<tr align="center">
<td class="ApButtonDarkBg" width="63%">
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="ApBtnSpace">
<input name="bizsite_completeTask" id="btn-complete" class="ApScrnButton" onMouseOver="this.className='ApScrnButtonHover';" onMouseOut="this.className='ApScrnButton';" onClick="clickedButton=this.name;this.onsubmit = new Function('return false');" value="<bizsolo:getLabel name='CREATE_LABEL' type='RESOURCE'/>" type="submit"></td>
<td class="ApBtnSpace">
<input type="button" name="bizsite_reset" id="btn-reset" class="ApScrnButton" onMouseOver="this.className='ApScrnButtonHover';" onMouseOut="this.className='ApScrnButton';" onClick="sbm.utils.reset()" value="<bizsolo:getLabel name='RESET_LABEL' type='RESOURCE'/>"></td>
<td class="ApBtnSpace">
<input type="button" name="Submit1323" id="btn-cancel" class="ApScrnButton" onMouseOver="this.className='ApScrnButtonHover';" onMouseOut="this.className='ApScrnButton';" onClick="sbm.utils.cancel()" value="<bizsolo:getLabel name='CANCEL_LABEL' type='RESOURCE'/>"></td>
</tr>
</table>
</td>
</tr>
</table>
</div>

  
                    <div id="resizablepanel" style="display:none">
                        <div class="hd">Alert Dialog</div>
                        <div class="bd"></div>
                        <div class="ft"></div>
                    </div> 
<div id="southDiv"></div></form>
</body>

<script language="JavaScript">
<!--
function beforeInitControls() {
}
-->
</script>
<script language="JavaScript">
<!--
function userValidationJavascipt() {
  return true;
}
-->
</script>
<sbm:dataSources appName="CustomerOrderVehicle" appType="bizlogic">
  <sbm:dataSource type="managed" name="Place Order/WebServiceAdapters/GenericWebServiceAdapter">
    <sbm:dataAttribute name="class">com.savvion.sbm.adapters.webservice.WebServiceAdapter</sbm:dataAttribute>
    <sbm:dataField name="OUT.result.1_0" type="Boolean">
      <sbm:dataAttribute name="type">receive</sbm:dataAttribute>
      <sbm:dataControl type="checkbox" editable="true" controlId="checkBox1"></sbm:dataControl>
    </sbm:dataField>
  </sbm:dataSource>
</sbm:dataSources>
<script language="JavaScript">
<!--
    
function abc(eventContext) {
sbm.adaplet.invoke("Place Order/WebServiceAdapters/GenericWebServiceAdapter");
}


function radioBrand_onChange(eventContext) {
}


  -->
</script>
<!--Initialize extensible widgets.-->
<script language="JavaScript">
<!--
var allWidgets = [{widget:'cbOptionsGroup1', bound:'false', editable:'false', type:'sbm.combobox', source: {type:'SERVICE', serviceURL:'radioVehicleBrand.sjs'}, target:{type:'DATASLOT', dataSlotName:'', dataSlotType:''}, dsType:'', service:'false'},
{widget:'cbOptionsGroup2', bound:'false', editable:'false', type:'sbm.combobox', source: {type:'SERVICE', serviceURL:'radioVehicleBrand.sjs'}, target:{type:'DATASLOT', dataSlotName:'', dataSlotType:''}, dsType:'', service:'false'}
];
var businessObjects = [];
var formWidgetHandler;
sbm.utils.onDOMReady = function() {
sbm.adaplet.invoke("Place Order/WebServiceAdapters/GenericWebServiceAdapter");

YAHOO.util.Event.onDOMReady(function(){formWidgetHandler = new FormWidgetHandler(allWidgets);});
}
Ext.onReady(function(){
var tabs = new Ext.TabPanel({
    id:'tabbedPane1',
    renderTo:'tabbedPane1',
    activeTab: 0,
    cls:'auto-width-tab-strip',
    frame:true,
    plain:true,
    defaults:{autoHeight: true},
    items:[{    contentEl:'tabbedPane1_page1',title:'Brand & Model'
                     
                     }
                     ,
{    contentEl:'tabbedPane1_page2',title:'Engine & Colour'
                     
                     }
                     ,
{    contentEl:'tabbedPane1_page3',title:'Options'
                     
                     }
                      ]});

});
         var viewport = new Bm.util.BmViewport('');
sbm.utils.onFormSubmit = function() {
         if(allWidgets.length > 0 && !formWidgetHandler.validateWidgets()) return false;
        try{
             if(!userValidationJavascipt()) return false;
             if(!sbm.utils.beforeFormSubmit('box+label')) return false;
         }catch(e){}
         document.form.action='<%=response.encodeURL("PlaceOrder.jsp")%>';
         if(allWidgets.length > 0)formWidgetHandler.saveDataSlots();
         return true;
}
-->
</script>

</html>