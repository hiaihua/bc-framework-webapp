<!--[if !IE]><!--><!DOCTYPE html><!--<![endif]-->
<!--[if !IE]><!DOCTYPE html><![endif]-->
<!--[if lte IE 8]><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><![endif]-->
<!--[if gte IE 9]><!DOCTYPE html><![endif]-->
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title><s:text name="app.title" /></title>
<script type="text/javascript">var ts = '<s:property value="ts" />';</script>
<link rel="shortcut icon" type="image/x-icon" href="<s:url value='/bc/libs/themes/default/images/favicon.png'><s:param name='ts' value='ts'/></s:url>"/>
<link rel="stylesheet" type="text/css" href="<s:url value='/ui-libs/jquery-ui/1.9pre/themes/base/jquery-ui.css' />" />	
<link rel="stylesheet" type="text/css" href="<s:url value='/ui-libs/jquery-ui/1.8.16/themes/%{personalConfig.theme}/jquery-ui.css' />" />	
<link rel="stylesheet" type="text/css" href="<s:url value='/ui-libs/jquery-ui/plugins/timepicker/0.9.6/jquery-ui-timepicker-addon.css' />" />
<link rel="stylesheet" type="text/css" href="<s:url value='/ui-libs/jquery-ui/plugins/pnotify/1.1.0/jquery.pnotify.default.css' />" />
<s:if test='%{"true" == getText("app.debug")}'>
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/core.css' ><s:param name='ts' value='ts'/></s:url>" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/tabs.css' ><s:param name='ts' value='ts'/></s:url>" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/desktop.css' ><s:param name='ts' value='ts'/></s:url>" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/shortcuts.css' ><s:param name='ts' value='ts'/></s:url>" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/grid.css' ><s:param name='ts' value='ts'/></s:url>" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/grid.export.css' ><s:param name='ts' value='ts'/></s:url>" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/tree.css' ><s:param name='ts' value='ts'/></s:url>" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/form.css' ><s:param name='ts' value='ts'/></s:url>" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/boxPointer.css' ><s:param name='ts' value='ts'/></s:url>" />
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/attach.css' ><s:param name='ts' value='ts'/></s:url>" />
</s:if>
<s:else>
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/bc.css' ><s:param name='ts' value='ts'/></s:url>" />
</s:else>
<!-- 额外加载的css文件 -->
<s:if test='%{"app.index.css" != getText("app.index.css")}'>
	<s:generator separator="," val="%{getText('app.index.css')}">
		<s:iterator var="extraCss">
			<link rel="stylesheet" type="text/css" href="<s:url value='%{extraCss}' ><s:param name='ts' value='ts'/></s:url>" />
		</s:iterator>
	</s:generator>
</s:if>
</head>
<body style='font-size:<s:property value="personalConfig.font" />px;' class="bc">
<!-- 整个桌面 -->
<div id="desktop" class="bc-desktop">
	<!-- 系统菜单条 -->
	<div id="top" class="ui-widget-header unselectable" unselectable="on">
		<img class="sysIcon" src="<s:url value='/bc/libs/themes/default/images/logo48.png' />"
			title='<s:text name="app.title"/> v<s:text name="app.version"/>&#10;登录帐号：<s:property value="context.user.name" />(<s:property value="context.user.pname" />)&#10;登录时间：<s:property value="#session.loginTime" />'>
		<s:property value="startMenu" escapeHtml="false"/>
		<table class="topIcons" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<!-- <td class="topIcon" title="邮箱" id="bcmail">
					<a class="icon i0004">&nbsp;</a>
					<span class="number ui-state-highlight">8</span>
				</td> -->
				<s:if test='%{getText("app.bcq") == "true" && !outerNet && !mobile}'>
				<td class="topIcon" title="聊天" id="bcq"><a class="icon i0003">&nbsp;</a></td>
				</s:if>
				<td class="topIcon" title="帮助" id="bchelp"><a class="icon i0001">&nbsp;</a></td>
				<td class="topIcon" title="退出" id="quickLogout"><a class="icon i0000">&nbsp;</a></td>
			</tr>
		</table>
	</div>
	
	<div id="middle" class="ui-widget-content">
		<!-- 桌面区域 -->
		<div id="center" class="bc-shortcuts unselectable" unselectable="on">
			<!-- 回收站 -->
			<a class="recycle" data-m="true" title='<s:text name="shortcut.title.drag2recyle" />'
				data-id='recycle'
				data-standalone='false'
				data-type='2' 
 				data-mid='recycle'
				data-option='' 
				data-order='9999'
				data-iconClass='i0504'
				data-name='回收站'
				data-url='<s:url value="/bc/recycle" />'>
				<span class='icon i0504'></span>
				<span class="text">回收站</span>
			</a>
			
			<!-- 桌面图标 -->
			<s:iterator value="shortcuts" status="stuts">
				<a class="shortcut" 
					data-id='<s:property value="id" />'
					data-aid='<s:property value="aid" />'
					<s:if test="sid > 0">data-mid='<s:property value="sid" />'</s:if>
	 				<s:else>data-mid='shortcut-<s:property value="id" />'</s:else>
					data-standalone='<s:property value="standalone" />'
					data-order='<s:property value="order" />'
					data-iconClass='<s:property value="iconClass" />'
					data-name='<s:property value="name" />'
					data-url='<s:url value="%{url}" />'>
					<span class='icon <s:property value="iconClass" />'></span>
					<span class="text"><s:property value="name" /></span>
					<s:if test="%{cfg != null && !cfg.trim().isEmpty()}"><pre style="display:none"><s:property value="cfg" /></pre></s:if>
				</a>
			</s:iterator>
		</div>
		
		<!-- 右边栏 -->
		<div id="right" class="ui-widget-content unselectable" unselectable="on">
		</div>
	</div>
	
	<!-- 任务条 -->
	<div id="bottom" class="ui-widget-header">
		<div id="copyrightBar"><a href='<s:text name="app.company.url" />' target="_blank"><s:text name="app.company.copyright" /></a></div>
		<div id="quickButtons"></div>
		<table class="bottomIcons" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="bottomIcon" id="quickShowHide" title="显示桌面"><a class="ui-widget-header">&nbsp;</a></td>
			</tr>
		</table>
	</div>
</div>
<input type="hidden" id="token" name="token" value='<s:property value="token"/>'/>
<s:if test='%{"true" != getText("app.product")}'><div id="test"><s:text name="app.debugInfo"/></div></s:if>
<!-- 空白框架，通常用于下载附件 -->
<iframe id="blank" name="blank" style="width:0; height:0; display:hidden;" src="about:blank" scrolling="no" frameborder="0"></iframe>
<script type="text/javascript" src="<s:url value='/ui-libs/jquery/1.7.2/jquery.min.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/jquery/plugins/cookie/1.2.0/jquery.cookie.js'/>"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/jquery/plugins/json/2.2/jquery.json.min.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/jquery-ui/1.9pre/ui/jquery-ui.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/jquery-ui/1.9pre/ui/i18n/jquery.ui.datepicker-zh-CN.js' />"></script>
<s:if test="mobile"><script type="text/javascript" src="<s:url value='/ui-libs/jquery-ui/plugins/TouchPunch/0.2.2/jquery.ui.touch-punch.min.js' />"></script></s:if>
<script type="text/javascript" src="<s:url value='/ui-libs/jquery-ui/plugins/timepicker/0.9.6/jquery-ui-timepicker-addon.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/jquery-ui/plugins/timepicker/0.9.6/i18n/jquery-ui-timepicker-zh-CN.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/jquery-ui/plugins/pnotify/1.1.0/jquery.pnotify.min.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/jquery/plugins/easing/1.3/jquery.easing.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/jquery/plugins/mousewheel/3.0.6/jquery.mousewheel.min.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/mustache/0.6.0/mustache.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/moment/2.0.0/moment.min.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/moment/2.0.0/lang/zh-cn.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/underscore/1.4.4/underscore-min.js' />"></script>
<script type="text/javascript" src="<s:url value='/ui-libs/backbone/1.0.0/backbone-min.js' />"></script>
<script type="text/javascript">
	bc={};
	bc.syskey = '<s:text name="app.name" />';
	bc.title = '<s:text name="app.title"/> v<s:text name="app.version"/>';
	bc.root = "<%=request.getContextPath()%>";
	bc.debug = <s:text name="app.debug" />;
	bc.mobile = <s:property value="mobile" />;
	bc.outerNet = <s:property value="outerNet" />;
	bc.bcq = <s:text name="app.bcq" />;
	bc.loginTime = '${loginTime}';
	bc.md5 = '${md5}';
	bc.sid = '<s:property value="sid" />';
	
	//一定要使用location.host获取真实的url地址，否则safari在初始化WebSocket时会重置session导致信息丢失
	bc.wsurl = <s:text name="app.ws.url"/>;
	
	bc.ts = '<s:property value="ts" />';//系统编译发布的时间
	if (bc.debug) {
		jQuery(function() {
			//logger.toggle();
			//logger.enable("debug");
		});
	}
	var userId = '<s:property value="context.user.id" />';
	var userCode = '<s:property value="context.user.code" />';
	var userName = '<s:property value="context.user.name" escapeHtml="false"/>';
</script>
<s:if test='%{getText("app.debug") == "true"}'>
	<script type="text/javascript" src="<s:url value='/bc/libs/core.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/ajax.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/msg.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/validate.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/page.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/toolbar.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/toolbar.search.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/grid.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/grid.export.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/grid.import.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/tree.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/form.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/boxPointer.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/loader.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/loader.preconfig.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/editor.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/attach.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/attach.html5.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/attach.flash.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/file.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/image.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/desktop.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<link rel="stylesheet" type="text/css" href="<s:url value='/bc/libs/themes/default/logger.css' ><s:param name='ts' value='ts'/></s:url>" />
	<script type="text/javascript" src="<s:url value='/bc/libs/logger.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/debug.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/browser.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/tabs.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/dialog.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript" src="<s:url value='/bc/libs/chat.js' ><s:param name='ts' value='ts'/></s:url>"></script>
</s:if>
<s:else>
	<script type="text/javascript" src="<s:url value='/bc/libs/bc.js' ><s:param name='ts' value='ts'/></s:url>"></script>
	<script type="text/javascript">
	if(!window['logger']){
		/** JavaScript日志组件的幻象，实际的见logger.js */
		window['logger'] = {
			debugEnabled:false,infoEnabled:false,warnEnabled:false,profileEnabled:false,
			clear:$.noop,debug:$.noop,info:$.noop,warn:$.noop,error:$.noop,
			profile:$.noop,enable:$.noop,disabled:$.noop,show:$.noop,test:true
		};
	}
	</script>
</s:else>
<!-- 额外加载的js文件 -->
<s:if test='%{"app.index.js" != getText("app.index.js")}'>
	<s:generator separator="," val="%{getText('app.index.js')}">
		<s:iterator var="extraJs">
			<script type="text/javascript" src="<s:url value='%{extraJs}' ><s:param name='ts' value='ts'/></s:url>"></script>
		</s:iterator>
	</s:generator>
</s:if>
<script type="text/javascript">
jQuery(function() {
	$("#desktop").bcdesktop();
	$("#test").click(function(){logger.toggle();});
});
</script>
</body>
</html>