<cfimport prefix="menu" taglib="menus/" />

<cfif isDefined('request.breadcrumbs') and arraylen(request.breadcrumbs) and (fusebox.isCustomTag eq TRUE)>
	<cfif ArrayLen(request.breadcrumbs) gte 2>
		<cfset tmp = ArrayLen(request.breadcrumbs) />
		<cfsavecontent variable="SubMenuOutput">
		<ul>
			<menu:nestedlist
				startmenu="#request.breadcrumbs[2].id#"
				thispage="#request.breadcrumbs[tmp].id#"
				page="#myself##xfa.Page#"
				dsn="#my.db.dsn#"
				tableprefix="#my.db.tablePrefix#"
			/>
		</ul>
		</cfsavecontent>
		<cfif request.lvlcount gt 3 or request.lvlcount lt 2>
			<cfset my.theme.layout = "none" />
		<cfelse>
			<cfoutput>#SubMenuOutput#</cfoutput>
		</cfif>
	</cfif>
<cfelse>
	<cfset my.theme.layout = "none" />
</cfif>