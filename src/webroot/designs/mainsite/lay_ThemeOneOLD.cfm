<!--- I am the default look for the site --->
<cfimport prefix="menu" taglib="../../pillarscms/Pages/Menus/" />
<cfimport prefix="fb" taglib="../../pillarscms/" />

<!--- I generate the blocks to be outputed on the layout --->
<fb:fusebox fuseaction="home.siteblocks" layout="none" />
<cfif isDefined('attributes.pageid') and len(attributes.pageid)>
	<fb:fusebox fuseaction="home.pageblocks" pageid="#attributes.pageid#" layout="none" />
</cfif>

<cfoutput>
<!-- Theme One -->
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
<a name="##top" id="top"></a>

<div class="BodyWidth">

<table width="100%" cellpadding="0" cellspacing="0" border="0" height="82" style="border-bottom:1px solid ##B4B3B3">
	<tr>
		<td rowspan="2" width="57" valign="top"><img src="assets/images/spacer.gif" width="57" height="82" border="0" alt="" /></td>
		<td valign="top" align="right">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td height="25"><a href="/"><img src="assets/images/spacer.gif" width="168" height="23" border="0" alt="" /></a></td>
					<td width="100%" class="topNav">
						<!--- Site Menu --->
						<cfif isDefined('request.my.layout.sitemenu') and len(request.my.layout.sitemenu)>
							#request.my.layout.sitemenu#
						</cfif>
					</td>
					<td valign="top" nowrap="nowrap" style="padding-right:10px;">
						
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<!-- start personalization -->
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td><img src="assets/images/spacer.gif" width="213" height="45" border="0" alt="Logo" /></td>
					<td width="80" background="assets/images/spacer.gif"><img src="designs/mainsite/main/images/default/banner_linefade.gif" width="80" height="55" border="0" alt="" /></td>
					<td width="100%" align="right" background="designs/mainsite/main/images/default/banner_lines.gif" style="padding:0 10px 0 0;" valign="top"> 
						<!--- personalization --->
						<cfscript>
							function write_greeting() {
								hr = hour(now());
								if ( hr gte 1 and hr lte 11 ) greet = "Good morning";
								else if ( hr gte 12 and hr lte 17 ) greet = "Good afternoon";
								else greet = "Good evening";
								return greet;
							}
						</cfscript>
						<div class="greeting">#write_greeting()# #my.user.fname#</div>
						<div class="datetime">Today is #DateFormat(now(),"dddd, mmmm d, yyyy")#</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<!--- Main Menu --->
<cfif isDefined('request.my.layout.mainmenu') and len(request.my.layout.mainmenu)>
	<div class="myHorizontalMainMenu">#request.my.layout.mainmenu#</div>
</cfif>
		
<table border="0" cellpadding="0" cellspacing="0" class="motherTable">
	<tr valign="top">
		<td class="leftcolumn">
			<!--- leftcolumn --->
			<cfif isDefined('request.my.layout.leftcolumn') and len(request.my.layout.leftcolumn)>
				#request.my.layout.leftcolumn#
				<div><img src="designs/mainsite/main/images/spacer.gif" width="180" height="1" alt="" border="0" /></div>
			</cfif>
		</td>
		<td width="100%" class="ContentArea">
			<!--- Page Top --->
			<cfif isDefined('request.my.layout.top') and len(request.my.layout.top)>
				#request.my.layout.top#
			</cfif>
			
			<!--- Heading --->
			<cfif isDefined('my.page.heading') and len(my.page.heading)>
				<h1>#my.page.heading#</h1>
			</cfif>

			<!--- main text content goes here --->
			#fusebox.layout#

			<!--- Page Bottom --->
			<cfif isDefined('request.my.layout.bottom') and len(request.my.layout.bottom)>
				#request.my.layout.bottom#
			</cfif>
		</td>
		<td class="rightcolumn">
			<!--- rightcolumn --->
			<cfif isDefined('request.my.layout.rightcolumn') and len(request.my.layout.rightcolumn)>
				#request.my.layout.rightcolumn#
				<img src="designs/mainsite/main/images/spacer.gif" width="180" height="1" alt="" border="0" />
			</cfif>
		</td>
	</tr>
	<tr>
		<td class="footer" colspan="3">
			<!--- Footer --->
			<cfif isDefined('request.my.layout.footer') and len(request.my.layout.footer)>
				#request.my.layout.footer#
			</cfif>
		</td>
	</tr>
</table>

<!--- Adnin Menu --->
<cfif isDefined('request.my.layout.adminmenu') and len(request.my.layout.adminmenu)>
</cfif>
	#request.my.layout.adminmenu#


</div>
</body>
</html>
</cfoutput>