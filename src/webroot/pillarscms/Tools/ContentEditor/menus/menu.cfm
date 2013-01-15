<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="menu.cfm" language="ColdFusion">
	<responsibilities>
		I display a menu conected with the content management system.
	</responsibilities>
	<properties>
		<property name="Version" value="0.3" />
		<history email="ron@rongallant.com" type="update" date="2004-03-17" comments="can now show disabled pages" />
		<history email="ron@rongallant.com" type="update" date="2004-03-17" comments="turn off submenus" />
		<history email="ron@rongallant.com" type="create" date="2004-03-16" />
	</properties>
	<io>
		<in>
			<structure scope="attributes">
				<string name="tabs" comments="Do No Edit" />
				<string name="path" comments="Do Not Edit" />
				<string name="startmenu" comments="pageid to start menu tree" optional="No" />
				<string name="dsn" comments="DSN to database" optional="No" />
				<string name="showdisabled" comments="Show disabled pages" />
				<string name="submenu" comments="display tree below first level" />
				<string name="page" comments="page that displays pages" optional="No" />
			</structure>
		</in>
	</io>
</fusedoc>
--->

<cfparam name="attributes.tabs" default="">
<cfparam name="attributes.path" default="">
<cfparam name="attributes.dsn">
<cfparam name="attributes.page">
<cfparam name="attributes.startmenu">
<cfparam name="attributes.showdisabled" default="no">
<cfparam name="attributes.submenu" default="yes">
<cfparam name="attributes.tableprefix">

<cfif not isDefined('attributes.root')>
	<cfset attributes.root = StructNew()>
	<cfset attributes.root.pageid = attributes.startmenu>
	<cfset attributes.root.children = ArrayNew(1)>
</cfif>

<cfquery name="qPages" datasource="#attributes.dsn#">
	SELECT
		parent_id AS parentid,
		pg_id AS pageid,
		pg_link_name AS linkname,
		pg_link AS link,
		pg_enabled AS Enabled
	FROM #attributes.tableprefix#_pgPages
	WHERE parent_id = '#attributes.root.pageid#'
	AND pg_type = 'page'
	<cfif attributes.showdisabled eq "no">
	AND pg_enabled != 0
	</cfif>
	ORDER BY pg_order, linkname
</cfquery>

<cfif qPages.Recordcount gt 0>

	<cfloop query="qPages">
		<cfset attributes.root.children[qPages.CurrentRow] = StructNew()>
		<cfset attributes.root.children[qPages.CurrentRow].parentid = qPages.parentid>
		<cfset attributes.root.children[qPages.CurrentRow].pageid = qPages.pageid>
		<cfset attributes.root.children[qPages.CurrentRow].linkname = qPages.linkname>
		<cfset attributes.root.children[qPages.CurrentRow].link = qPages.link>
		<cfset attributes.root.children[qPages.CurrentRow].children = ArrayNew(1)>

		<cfoutput>
			<cfif qPages.Enabled eq 0>
				#attributes.tabs#<a class="myMenuLinkDisabled" href="#attributes.page#&pageid=#qPages.pageid#">#qPages.linkname#</a><br><br>
			<cfelse>
				#attributes.tabs#<a class="myMenuLink" href="#attributes.page#&pageid=#qPages.pageid#">#qPages.linkname#</a><br><br>
			</cfif>
		</cfoutput>

		<cfif attributes.submenu eq "yes">
			<cf_menu
				root="#attributes.root.children[qPages.CurrentRow]#"
				tabs="#attributes.tabs#&nbsp;-&nbsp;"
				dsn="#attributes.dsn#"
				tableprefix="#attributes.tableprefix#"
				page="#attributes.page#"
				startmenu="#attributes.startmenu#"
				submenu="#attributes.submenu#"
				showdisabled="#attributes.showdisabled#">
		</cfif>
	</cfloop>

<cfelseif ( qPages.Recordcount eq 0 ) and ( attributes.root.pageid eq 1 )>
	<cfset request.NoMenuItems = 1>
</cfif>