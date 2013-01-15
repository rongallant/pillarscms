<cfimport prefix="menu" taglib="../Pages/menus/" />
<cfif isdefined('request.breadcrumbs') and len(request.breadcrumbs)>
	<cfset thispage = listfirst(request.breadcrumbs) />
<cfelse>
	<cfset thispage = 0 />
</cfif>
<cfif isdefined('attributes.pageid') and len(attributes.pageid)>
	<cfset thispage = attributes.pageid />
<cfelse>
	<cfset thispage = 0 />
</cfif>
<ul id="nav">
<menu:nestedlists
	dsn="#my.db.dsn#"
	tableprefix="#my.db.tablePrefix#"
	page="#myself#pages.home"
	startmenu="06595B78-B22E-CAE5-4F2E0312E62FF695"
	thispage="#thispage#"
	showdisabled="no"
	levelone="1"
/>
</ul>