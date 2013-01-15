<cfif thistag.executionmode eq "start">
	<cfimport prefix="tag" taglib="./" />
	<cfparam name="attributes.path" default="" />
	<cfparam name="attributes.dsn" />
	<cfparam name="attributes.page" />
	<cfparam name="attributes.thispage" />
	<cfparam name="attributes.startmenu" default="1" />
	<cfparam name="attributes.tableprefix" />
	<cfparam name="attributes.showdisabled" default="no" />
	<cfparam name="attributes.submenu" default="yes" />
	<cfparam name="request.lvlcount" default="0" />
	<cfparam name="attributes.lvlcount" default="0" />
	<cfset attributes.lvlcount = attributes.lvlcount + 1 />
	<cfif not isDefined('attributes.root')>
		<cfset attributes.root = StructNew() />
		<cfset attributes.root.pageid = attributes.startmenu />
		<cfset attributes.root.children = ArrayNew(1) />
	</cfif>
	<cfquery name="qPages" datasource="#attributes.dsn#">
		SELECT DISTINCT
			a.parent_id AS parentid,
			a.pg_id AS pageid,
			a.pg_type AS pagetype,
			a.pg_link_name AS linkname,
			a.pg_link_url AS linkurl,
			a.pg_LinkUrlTarget AS linktarget,
			a.pg_link AS link,
			a.pg_enabled AS Enabled
		FROM #attributes.tableprefix#_pgPages AS a
		WHERE a.parent_id = <cfqueryparam value="#attributes.root.pageid#" cfsqltype="cf_sql_varchar" maxlength="37" />
			AND (
				a.pg_type = 'page'
				OR a.pg_type = 'link'
			)
			<cfif attributes.showdisabled eq "no">
				AND a.pg_enabled != 0
			</cfif>
		ORDER BY a.pg_order, a.linkname
	</cfquery>
	<cfif qPages.Recordcount gt 0>
		<cfloop query="qPages">
			<cfset attributes.root.children[qPages.CurrentRow] = StructNew() />
			<cfset attributes.root.children[qPages.CurrentRow].parentid = qPages.parentid />
			<cfset attributes.root.children[qPages.CurrentRow].pageid = qPages.pageid />
			<cfset attributes.root.children[qPages.CurrentRow].linkname = qPages.linkname />
			<cfset attributes.root.children[qPages.CurrentRow].link = qPages.link />
			<cfset attributes.root.children[qPages.CurrentRow].children = ArrayNew(1) />
			<cfif attributes.submenu eq "yes" and attributes.lvlcount lt 2>
				<cfsavecontent variable="isSubMenu">
					<tag:jsnestedlist
						root="#attributes.root.children[qPages.CurrentRow]#"
						dsn="#attributes.dsn#"
						tableprefix="#attributes.tableprefix#"
						thispage="#attributes.thispage#"
						page="#attributes.page#"
						startmenu="#attributes.startmenu#"
						submenu="#attributes.submenu#"
						showdisabled="#attributes.showdisabled#"
						lvlcount="#attributes.lvlcount#"
					>
				</cfsavecontent>
			</cfif>
			<cfoutput>
				<cfif qPages.pagetype eq "link">
					<cfset theurl = qPages.linkurl />
				<cfelse>
					<cfset theurl = "#attributes.page#&pageid=#qPages.pageid#" />
				</cfif>
				<cfif isdefined('isSubMenu') and len(trim(isSubMenu))>
					<li class="isFolder"><a id="x#qPages.pageid#" href="javascript:Toggle('#qPages.pageid#');">#qPages.linkname#</a></li>
				<cfelse>
					<cfif qPages.pageid eq attributes.thispage>
						<li id="me"><a href="#theurl#">#qPages.linkname#</a></li>
					<cfelse>
						<li><a href="#theurl#" target="#qPages.linktarget#">#qPages.linkname#</a></li>
					</cfif>
				</cfif>
				
				<cfif attributes.thisPage eq attributes.root.pageid>
					<cfset displaySub = "none" />
				<cfelse>
					<cfset displaySub = "block" />
				</cfif>
				
				<cfif isdefined('isSubMenu') and len(trim(isSubMenu))><ul id="#qPages.pageid#" style="display:#displaySub#;">#isSubMenu#</ul></cfif>
			</cfoutput>
		</cfloop>
	</cfif>
</cfif>