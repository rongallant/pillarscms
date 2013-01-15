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
	<style type="text/css" media="all">
		BODY { background-color: ##FFFFFF; }
	</style>
</head>
<body>

<table width="100%" border="0" cellspacing="0" cellpadding="10">
	<tr>
		<td>
			<cfif isDefined('my.page.heading')>
				<h1>
					#my.page.heading#
					<cfif isDefined('my.page.subheading')>
						<div style="font-size:50%; font-weight:normal;">#my.page.subheading#</div>
					</cfif>
				</h1>
			</cfif>
		</td>
	</tr>
	<tr>
		<td>
			#fusebox.layout#
			<p>&nbsp;</p>
			<div style="color:black;"><b>Printed:</b> #DateFormat(now(),'mmmm dd, yyyy')#</div>
			<div style="color:black;"><b>Printed By:</b> #cgi.auth_user#</div>
			<div style="color:black;"><b>Link:</b> #cgi.server_name#/#cgi.script_name#<cfif cgi.query_string neq "">?#cgi.query_string#</cfif></div>
		</td>
	</tr>
</table>

</body>
</html>
</cfoutput>