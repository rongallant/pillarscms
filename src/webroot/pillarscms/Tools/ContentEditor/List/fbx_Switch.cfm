<cfimport prefix="fb" taglib="../../../" />
<cfimport prefix="sec" taglib="../../../" />

<cfswitch expression="#fusebox.fuseaction#">

	<cfcase value="Menu">
		<cfset xfa.Menu1 = "home.home">
		<cfset xfa.Menu2 = "">
		<cfinclude template="dsp_Menu.cfm">
	</cfcase>

	<cfcase value="home">
		<sec:security rights="200" tableprefix="#my.db.tableprefix#" thisapp="#my.site.name#" errorpage="#my.site.noauth#">
			<cfset xfa.ListPages = fusebox.thisCircuit & ".list" />
			<cfif isDefined('attributes.searchwarning') and attributes.searchwarning eq 1>
				<fb:fusebox fuseaction="SearchManager.AskToUpdateSearch" layout="none" />
			</cfif>
			<cfinclude template="dsp_ListContent.cfm" />
			<cfset my.page.heading = "Page Menu" />
			<cfset my.page.subheading = "Click a name to edit.<br />Pages marked as 'page' will show up in the site menu." />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

	<cfcase value="list">
		<sec:security rights="200" tableprefix="#my.db.tableprefix#" thisapp="#my.site.name#" errorpage="#my.site.noauth#">
			<cfset xfa.PageList = "pgList.home" />
			<cfset xfa.EditPage = "pgEdit.edit" />
			<cfinclude template="qry_GetGroup.cfm" />
			<cfinclude template="qry_GetPages.cfm" />
			<cfinclude template="dsp_List.cfm" />
			<cfset my.page.heading = "Pages for the group &quot;#qGroup.grp_name#&quot;" />
			<cfset my.page.subheading = "Select a group below to see a list of pages." />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

</cfswitch>