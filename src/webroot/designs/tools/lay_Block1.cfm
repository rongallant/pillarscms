<cfparam name="attributes.tablequerystring" default="">
<cfparam name="attributes.EditString" default="">
<cfparam name="attributes.tag" default="">
<cfparam name="attributes.OrderString" default="">
<cfparam name="attributes.width" default="100%">

<cfoutput>
<!-- START TableOne -->
<table width="#attributes.width#" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td height="16" width="17"><img src="#my.design.folder##my.theme.folder#images/tbl_upperLeft.gif" width="17" height="16" border="0"></td>
		<td height="16" background="#my.design.folder##my.theme.folder#images/tbl_top.gif"><img src="#my.design.folder##my.theme.folder#images/pixel.gif" width="1" height="1" border="0"></td>
		<td height="16" width="18"><img src="#my.design.folder##my.theme.folder#images/tbl_upperRight.gif" width="18" height="16" border="0"></td>
	</tr>
	<tr>
		<td background="#my.design.folder##my.theme.folder#images/tbl_left.gif"></td>
		<td background="#my.design.folder##my.theme.folder#images/tbl_bg.gif">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
						<cfif isDefined('my.page.heading')>
							<div class="myPageTitle">#my.page.heading#</div>
						</cfif>
						<cfif isDefined('my.page.subheading')>
							<div class="myPageSubtitle">#my.page.subheading#</div>
						<cfelse>
							<div><img src="#my.design.folder##my.theme.folder#images/pixel.gif" width="1" height="5" border="0"></div>
						</cfif>
					</td>
					<td align="right">
						<cfif isDefined('request.TableRight')><div id="BlockOneMenu">#request.TableRight#</div></cfif>
					</td>
				</tr>
				<tr>
					<td colspan="2" bgcolor="white" style="padding:0px;">#fusebox.layout#</td>
				</tr>
			</table>
		</td>
		<td background="#my.design.folder##my.theme.folder#images/tbl_right.gif"></td>
	</tr>
	<tr>
		<td height="20" width="17"><img src="#my.design.folder##my.theme.folder#images/tbl_lowerLeft.gif" width="17" height="20" border="0"></td>
		<td height="20" background="#my.design.folder##my.theme.folder#images/tbl_bottom.gif"></td>
		<td height="20" width="18"><img src="#my.design.folder##my.theme.folder#images/tbl_lowerRight.gif" width="18" height="20" border="0"></td>
	</tr>
</table>
<div><img src="#my.design.folder##my.theme.folder#images/pixel.gif" width="1" height="10" border="0"></div>
<!-- END TableOne -->
</cfoutput>