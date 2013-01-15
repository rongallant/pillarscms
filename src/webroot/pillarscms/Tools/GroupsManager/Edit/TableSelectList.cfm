<cfif thisTag.ExecutionMode eq "start">
	<cfparam name="attributes.tabs" default="" />
	<cfparam name="attributes.path" default="" />
	<cfparam name="attributes.dsn" />
	<cfparam name="attributes.page" />
	<cfparam name="attributes.startmenu" />
	<cfparam name="attributes.showdisabled" default="no" />
	<cfparam name="attributes.submenu" default="yes" />
	<cfparam name="attributes.tableprefix" />
	<cfparam name="request.menucount" default="0" />
	<cfparam name="attributes.pagetypes" default="" />
	<cfif len(attributes.pagetypes)>
		<cfset lPageTypes = "" />
		<cfloop list="#attributes.pagetypes#" index="i">
			<cfset lPageTypes = ListAppend(lPageTypes,"'#i#'") />
		</cfloop>
	</cfif>
	<cfset request.menucount = request.menucount + 1 />
	<cfif not isDefined('attributes.root')>
		<cfset attributes.root = StructNew() />
		<cfset attributes.root.pageid = attributes.startmenu />
		<cfset attributes.root.children = ArrayNew(1) />
	</cfif>
	<cfquery name="qPages" datasource="#attributes.dsn#">
		SELECT
			a.parent_id AS parentid,
			a.pg_id AS pageid,
			a.pg_link_name AS linkname,
			a.pg_type AS pagetype,
			a.pg_link AS link,
			a.pg_isHome AS homepage,
			a.pg_enabled AS Enabled
		FROM #attributes.tableprefix#_pgPages AS a
		WHERE a.parent_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.root.pageid#" />
			<cfif isDefined('lPageTypes')>
				AND a.pg_type IN (<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="10" list="true" value="#lPageTypes#" />)
			</cfif>
			<cfif attributes.showdisabled eq "no">
				AND a.pg_enabled <> 0
			</cfif>
		ORDER BY
			a.pg_order,
			a.pg_link_name
	</cfquery>
	<cfset caller.RecCount = qPages.recordcount />
	<cfif qPages.Recordcount>
		<cfloop query="qPages">
			<cfset attributes.root.children[qPages.CurrentRow] = StructNew() />
			<cfset attributes.root.children[qPages.CurrentRow].parentid = qPages.parentid />
			<cfset attributes.root.children[qPages.CurrentRow].pageid = qPages.pageid />
			<cfset attributes.root.children[qPages.CurrentRow].linkname = qPages.linkname />
			<cfset attributes.root.children[qPages.CurrentRow].link = qPages.link />
			<cfset attributes.root.children[qPages.CurrentRow].children = ArrayNew(1) />
			<cfif request.menucount mod 2><cfset class = "myRow1" /><cfelse><cfset class = "myRow2" /></cfif>
			<cfoutput>
				<tr class="#class#" id="ListRow#request.menucount#">
					<td>
						<input type="checkbox" name="pageidlist" id="#qPages.pageid#" value="#qPages.pageid#"
							<cfif ListContains(request.pagelist,qPages.pageid)>checked="checked"</cfif> />
						<label for="#qPages.pageid#">
							#attributes.tabs#<cfif len(trim(qPages.linkname))>#qPages.linkname#<cfelse>(no title)</cfif>
						</label>
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
					<td>
					</td>
				</tr>
				<cf_TableSelectList
					root="#attributes.root.children[qPages.CurrentRow]#"
					tabs="#attributes.tabs#---------&nbsp;"
					dsn="#attributes.dsn#"
					tableprefix="#attributes.tableprefix#"
					page="#attributes.page#"
					startmenu="#attributes.startmenu#"
					submenu="#attributes.submenu#"
					showdisabled="#attributes.showdisabled#"
					pagetypes="#attributes.pagetypes#"
				/>
			</cfoutput>
		</cfloop>
	</cfif>
</cfif>