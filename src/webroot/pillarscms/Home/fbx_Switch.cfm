<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cflocation url="#myself#pages.home" addtoken="no" />
	</cfcase>

	<cfcase value="submenu">
		<cfinclude template="dsp_SubMenu.cfm" />
		<cfset my.page.heading = "Sub Menu" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="hideadmin">
		<cfinclude template="act_HideAdmin.cfm" />
		<cflocation url="#cgi.http_referer#" addtoken="no" />
	</cfcase>

	<cfcase value="pageblocks">
		<cfinclude template="qry_CreateBlock.cfm" />
		<cfinclude template="act_CreateBlock.cfm" />
	</cfcase>

	<cfcase value="siteblocks">
		<cfinclude template="qry_CreateBlockSite.cfm" />
		<cfinclude template="act_CreateBlock.cfm" />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>