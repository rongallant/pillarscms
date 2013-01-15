<cfparam name="attributes.tabs" default="">
<cfparam name="attributes.path" default="">
<cfparam name="attributes.dsn">
<cfparam name="attributes.page">
<cfparam name="attributes.startmenu">
<cfparam name="attributes.showdisabled" default="no">
<cfparam name="attributes.submenu" default="yes">
<cfparam name="attributes.tableprefix">
<cfparam name="request.menucount" default="0" />
<cfparam name="attributes.pagetypes" default="">
<cfif len(attributes.pagetypes)>
	<cfset lPageTypes = "" />
	<cfloop list="#attributes.pagetypes#" index="i">
		<cfset lPageTypes = ListAppend(lPageTypes,"'#i#'") />
	</cfloop>
</cfif>
<cfset request.menucount = request.menucount + 1 />
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
		pg_isHome AS homepage,
		pg_enabled AS Enabled
	FROM #attributes.tableprefix#_pgPages
	WHERE parent_id = '#attributes.root.pageid#'
		<cfif isDefined('lPageTypes')>
			AND pg_type IN (#PreserveSingleQuotes(lPageTypes)#)
		</cfif>
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
		<cfif request.menucount mod 2><cfset class = "myRow1"><cfelse><cfset class = "myRow2"></cfif>
		<cfoutput>
			<tr class="#class#" id="ListRow#request.menucount#">
				<td>
					<cfif qPages.currentrow gt 1>
						<a href="index.cfm?fuseaction=pgEdit.changeorder&groupid=#qPages.parentid#&id=#qPages.pageid#&go=up"
							onmouseover="hover('ListRow#request.menucount#','myRowHover');"
							onmouseout="hover('ListRow#request.menucount#','#class#');">
							<img src="pillarscms/Tools/ContentEditor/tree/iconup.gif" width="10" height="9" alt="Up" border="0" /></a>
					<cfelse>
						<img src="pillarscms/Tools/ContentEditor/tree/spacer.gif" width="10" height="9" border="0" />
					</cfif>
						<img src="pillarscms/Tools/ContentEditor/tree/spacer.gif" width="1" height="9" border="0" />
					<cfif qPages.currentrow lt qPages.recordcount>
						<a href="index.cfm?fuseaction=pgEdit.changeorder&groupid=#qPages.parentid#&id=#qPages.pageid#&&go=down"
							onmouseover="hover('ListRow#request.menucount#','myRowHover');"
							onmouseout="hover('ListRow#request.menucount#','#class#');">
							<img src="pillarscms/Tools/ContentEditor/tree/icondown.gif" width="10" height="9" alt="Down" border="0" /></a>
					<cfelse>
						<img src="pillarscms/Tools/ContentEditor/tree/spacer.gif" width="10" height="9" border="0" />
					</cfif>
				</td>
				<td>
					<cfif qPages.pagetype eq "link">
						<cfset xfa = "pgEdit.editLink">
					<cfelse>
						<cfset xfa = "pgEdit.editPage">
					</cfif>
					#attributes.tabs#<a href="index.cfm?fuseaction=#xfa#&pageid=#qPages.pageid#"
						onmouseover="hover('ListRow#request.menucount#','myRowHover');"
						onmouseout="hover('ListRow#request.menucount#','#class#');">
						<cfif len(trim(qPages.linkname))>#qPages.linkname#<cfelse>(no title)</cfif></a>
				</td>
				<td align="center">
					<cfif qPages.homepage eq 1>
						<img src="designs/tools/main/icons/iconcheckmark.gif" width="15" height="14" alt="Enabled" />
					</cfif>
				</td>
				<td align="center">#qPages.pagetype#</td>
				<td align="center">
					<cfif qPages.Enabled eq 1>
						<img src="designs/tools/main/icons/iconcheckmark.gif" width="15" height="14" alt="Enabled" />
					<cfelse>
						<img src="designs/tools/main/icons/icondelete.gif" width="15" height="15" alt="Disabled" />
					</cfif>
				</td>
			</tr>
			<cf_tablelist
				root="#attributes.root.children[qPages.CurrentRow]#"
				tabs="#attributes.tabs#---------&nbsp;"
				dsn="#attributes.dsn#"
				tableprefix="#attributes.tableprefix#"
				page="#attributes.page#"
				startmenu="#attributes.startmenu#"
				submenu="#attributes.submenu#"
				showdisabled="#attributes.showdisabled#"
				pagetypes="#attributes.pagetypes#"
			>
		</cfoutput>
	</cfloop>
</cfif>