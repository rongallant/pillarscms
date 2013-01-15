<cfimport prefix="menu" taglib="menus/">

<cfif qPage.recordcount eq 0>
	<p>Page Not Found (404)</p>
<cfelse>
	<cfset pagecontent = qPage.content>
	<cfoutput>
		<!--- Level 2 Submenu --->
		<cfif qPage.DisplayMenu eq 1>
			<cfquery name="qGroup" datasource="#my.db.dsn#">
				SELECT pg_title AS title
				FROM #my.db.tablePrefix#_pgPages
				WHERE pg_id = '#listfirst(request.breadcrumbs)#'
			</cfquery>
			<cfsavecontent variable="submenu">
			<ul class="mySubMenu">
				<menu:LevelThreeMenu
					thispage="#qPage.pageid#"
					dsn="#my.db.dsn#"
					startmenu="#listfirst(request.breadcrumbs)#"
					page="#myself#pages.home"
					tableprefix="#my.db.tablePrefix#"
					showdisabled="no"
					levelone="1">
			</ul>
			</cfsavecontent>
			<cfset pagecontent = replace(qPage.content,"<!--InsertSubMenu-->",submenu,"one")>
		</cfif>
		#pagecontent#
	</cfoutput>
</cfif>