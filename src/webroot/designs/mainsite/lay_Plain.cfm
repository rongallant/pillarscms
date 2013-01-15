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
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>#my.site.title#<cfif len(my.page.title)> - #my.page.title#</cfif></title>
	<meta http-equiv="imagetoolbar" content="no" />
	<style type="text/css" media="all">
		@import url("designs/MainStyle.css");
		@import url("designs/mainsite/main/styles/main.css");
	</style>
	<script src="assets/scripts/scripts.js" type="text/javascript"></script>
	<cfif isDefined('request.qforms') and request.qforms eq 1>
		<script type="text/javascript" src="assets/scripts/qForm/qforms.js"></script>
		<script type="text/javascript" src="assets/scripts/qForm/pillarscms_loadqf.js"></script>
	</cfif>
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

</body>
</html>
</cfoutput>