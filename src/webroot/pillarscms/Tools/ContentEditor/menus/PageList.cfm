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
		pg_type AS pagetype,
		pg_link AS link,
		pg_enabled AS Enabled
	FROM #attributes.tableprefix#_pgPages
	WHERE parent_id = '#attributes.root.pageid#'
	<cfif attributes.showdisabled eq "no">
	AND pg_enabled != 0
	</cfif>
	ORDER BY pg_order, linkname
</cfquery>


<cfset caller.RecCount = qPages.recordcount>
<cfif qPages.Recordcount gt 0>

	<cfloop query="qPages">
		<cfset attributes.root.children[qPages.CurrentRow] = StructNew()>
		<cfset attributes.root.children[qPages.CurrentRow].parentid = qPages.parentid>
		<cfset attributes.root.children[qPages.CurrentRow].pageid = qPages.pageid>
		<cfset attributes.root.children[qPages.CurrentRow].linkname = qPages.linkname>
		<cfset attributes.root.children[qPages.CurrentRow].link = qPages.link>
		<cfset attributes.root.children[qPages.CurrentRow].children = ArrayNew(1)>

		<cfif qPages.Enabled eq 0>
			<cfset disabled = 1>
		<cfelse>
			<cfset disabled = 0>
		</cfif>

		<cfoutput>
			<cfsavecontent variable="NestedMenu">
			<cfif attributes.submenu eq "yes">
				<div id="#qPages.pageid#" style="display: none; margin-left: 2em;">
				<cf_PageList
					root="#attributes.root.children[qPages.CurrentRow]#"
					tabs="#attributes.tabs#---------&nbsp;"
					dsn="#attributes.dsn#"
					tableprefix="#attributes.tableprefix#"
					page="#attributes.page#"
					startmenu="#attributes.startmenu#"
					submenu="#attributes.submenu#"
					showdisabled="#attributes.showdisabled#">
				</div>
			</cfif>
			</cfsavecontent>

			<div class="TreeMenuItem">
				<cfif qPages.currentrow gt 1>
					<a href="index.cfm?fuseaction=pgEdit.changeorder&groupid=#qPages.parentid#&id=#qPages.pageid#&go=up">
						<img src="pillarscms/Tools/ContentEditor/tree/iconup.gif" width="10" height="9" alt="Up" border="0" /></a>
				<cfelse>
					<img src="pillarscms/Tools/ContentEditor/tree/spacer.gif" width="10" height="9" border="0" />
				</cfif>
					<img src="pillarscms/Tools/ContentEditor/tree/spacer.gif" width="1" height="9" border="0" />
				<cfif qPages.currentrow lt qPages.recordcount>
					<a href="index.cfm?fuseaction=pgEdit.changeorder&groupid=#qPages.parentid#&id=#qPages.pageid#&&go=down">
						<img src="pillarscms/Tools/ContentEditor/tree/icondown.gif" width="10" height="9" alt="Down" border="0" /></a>
				<cfelse>
					<img src="Tools/ContentEditor/tree/spacer.gif" width="10" height="9" border="0" />
				</cfif>
				<cfif RecCount gt 0>
					<a id="x#qPages.pageid#" href="javascript:Toggle('#qPages.pageid#');"><img src="Tools/ContentEditor/tree/folder.gif" width="16" height="16" border="0"/></a>
				<cfelse>
					<img src="pillarscms/Tools/ContentEditor/tree/text.gif" width="16" height="16" border="0"/>
				</cfif>
				<cfif qPages.pagetype eq "link">
					<cfset xfa = "pgEdit.editLink">
				<cfelse>
					<cfset xfa = "pgEdit.editPage">
				</cfif>
				<a href="index.cfm?fuseaction=#xfa#&pageid=#qPages.pageid#" class="myMenuLink<cfif disabled eq 1>Disabled</cfif>">#qPages.linkname#</a> (#qPages.pagetype#)<cfif disabled eq 1> - Disabled</cfif>
			</div>
			#NestedMenu#
		</cfoutput>
	</cfloop>

<cfelseif ( qPages.Recordcount eq 0 ) and ( attributes.root.pageid eq 1 )>
	<cfset request.NoMenuItems = 1>
</cfif>