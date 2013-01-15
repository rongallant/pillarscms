<cfimport prefix="fb" taglib="../../pillarscms/">
<cfoutput>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>#my.site.title#<cfif my.page.title neq "">- #my.page.title#</cfif></title>
	<style type="text/css" media="all">
		@import "#my.design.folder##my.theme.folder#styles/main.css";
	</style>
	<cfif isDefined('request.qforms') and request.qforms eq 1>
		<script type="text/javascript" src="assets/scripts/qForm/qforms.js"></script>
		<script type="text/javascript" src="assets/scripts/qForm/pillarscms_loadqf.js"></script>
	</cfif>
</head>
<body>

<table cellspacing="0" cellpadding="0" border="0" width="100%">
	<cfif isdefined('my.site.heading')>
		<tr>
			<td bgcolor="##0072BC" style="padding: 3px 0 3px 10px;">
				<div style="font: bold 20px arial; color:white;">
					#my.site.heading#
					<cfif isdefined('my.site.subheading')>
						<span style="font:bold 12px arial; color:white;">#my.site.subheading#</span>
					</cfif>
				</div>
			</td>
		</tr>
	</cfif>
		<tr>
			<td height="10" bgcolor="##FFBA68">
			<cfif isdefined('my.layout.mainmenu') and ListLen(my.layout.mainmenu)>
				<div id="myMainMenu">
				<cfloop list="#my.layout.mainmenu#" index="i">
					<fb:fusebox fuseaction="#ListFirst(i,'|')#" layout="#ListLast(i,'|')#">
				</cfloop>
				</div>
			</cfif>
			<cfif isdefined('my.layout.submenu') and ListLen(my.layout.submenu)>
				<div id="SubMenu">
				<cfloop list="#my.layout.submenu#" index="i">
					<fb:fusebox fuseaction="#ListFirst(i,'|')#" layout="#ListLast(i,'|')#">
				</cfloop>
				</div>
			</cfif>
			</td>
		</tr>
	<tr>
		<td style="padding:10px;">
			#fusebox.layout#
			<div align="center"><a href="#self#"><b>back to website</b></a></div>
		</td>
	</tr>
</table>

</body>
</html>
</cfoutput>