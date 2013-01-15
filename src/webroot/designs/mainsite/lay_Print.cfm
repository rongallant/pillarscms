<cfimport prefix="fb" taglib="../../pillarscms/" />

<!--- I generate the blocks to be outputed on the layout --->
<fb:fusebox fuseaction="home.siteblocks" layout="none" />
<cfif isDefined('attributes.pageid') and len(attributes.pageid)>
	<fb:fusebox fuseaction="home.pageblocks" pageid="#attributes.pageid#" layout="none" />
</cfif>

<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" />
<html>
<head>
	<title>#my.site.title#<cfif len(my.page.title)> - #my.page.title#</cfif></title>
	<meta content="text/html; charset=windows-1252" http-equiv="Content-Type" />
	<meta http-equiv="imagetoolbar" content="no" />
	<script type="text/javascript" language="javascript1.1" src="assets/scripts/RowHighlighter.js"></script>
	<style type="text/css" media="all">
		@import url("designs/MainStyle.css");
		@import url("designs/mainsite/main/styles/main.css");
		@import url("designs/mainsite/main/styles/print.css");
	</style>
</head>
<body #my.layout.bodytag#>

	<div class="MainBodyArea">
		<!--- top --->
		<cfif isDefined('request.my.layout.top') and len(request.my.layout.top)>
			#request.my.layout.top#
		</cfif>

		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr valign="top">
				<td>
					<!--- bodycolumn1 --->
					<cfif isDefined('request.my.layout.bodycolumn1') and len(request.my.layout.bodycolumn1)>
						#request.my.layout.bodycolumn1#
					</cfif>

					<!--- Fusebox Layout Area --->
					#fusebox.layout#
				</td>

				<!--- bodycolumn2 --->
				<cfif isDefined('request.my.layout.bodycolumn2') and len(request.my.layout.bodycolumn2)>
					<td width="175" style="padding-left:10px;">
						#request.my.layout.bodycolumn2#
						<img src="designs/mainsite/main/images/spacer.gif" width="165" height="1" border="0" alt="" /></td>
				</cfif>

				<!--- bodycolumn3 --->
				<cfif isDefined('request.my.layout.bodycolumn3') and len(request.my.layout.bodycolumn3)>
					<td width="175" style="padding-left:10px;">
						#request.my.layout.bodycolumn3#
						<img src="designs/mainsite/main/images/spacer.gif" width="165" height="1" border="0" alt="" /></td>
				</cfif>
			</tr>
		</table>

		<!--- bottom --->
		<cfif isDefined('request.my.layout.bottom') and len(request.my.layout.bottom)>
			#request.my.layout.bottom#
		</cfif>

	</div>

	<p>&nbsp;</p>

	<div style="color:black;"><b>Printed:</b> #DateFormat(now(),'mmmm dd, yyyy')#</div>
	<div style="color:black;"><b>Printed By:</b> #cgi.auth_user#</div>
	<div style="color:black;"><b>Link:</b> #cgi.server_name#/#cgi.script_name#<cfif cgi.query_string neq "">?#cgi.query_string#</cfif></div>

</body>
</html>
</cfoutput>