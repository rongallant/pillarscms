<cfimport prefix="menu" taglib="menus/" />

<cfif isDefined('request.breadcrumbs') and ArrayLen(request.breadcrumbs) and StructKeyExists(request.breadcrumbs[1],"id")>
	<cfset thispage = request.breadcrumbs[1].id />
<cfelse>
	<cfset thispage = 1 />
</cfif>

<ul id="nav">
<menu:nestedlist
	startmenu="1"
	thispage="#thispage#"
	page="#myself##xfa.Page#"
	dsn="#my.db.dsn#"
	tableprefix="#my.db.tableprefix#"
	submenu="Yes"
/>
</ul>