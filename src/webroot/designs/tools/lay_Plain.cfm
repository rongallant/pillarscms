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

<table width="100%" border="0" cellspacing="0" cellpadding="10">
	<tr>
		<td>
			#fusebox.layout#
		</td>
	</tr>
</table>

</body>
</html>
</cfoutput>