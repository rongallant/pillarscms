<cfif thistag.executionmode eq "start">
	<cfimport prefix="tag" taglib="./" />
	<cfparam name="attributes.path" default="" />
	<cfparam name="attributes.dsn" />
	<cfparam name="attributes.page" />
	<cfparam name="attributes.thispage" />
	<cfparam name="attributes.startmenu" default="1" />
	<cfparam name="attributes.nesteddepth" default="2" />
	<cfparam name="attributes.tableprefix" />
	<cfparam name="attributes.showdisabled" default="no" />
	<cfparam name="attributes.submenu" default="yes" />
	<cfparam name="attributes.lvlcount" default="0" />
	<cfset attributes.lvlcount = attributes.lvlcount + 1 />
	<cfset request.lvlcount = attributes.lvlcount />
	<cfif not isDefined('attributes.root')>
		<cfset attributes.root = StructNew() />
		<cfset attributes.root.pageid = attributes.startmenu />
		<cfset attributes.root.children = ArrayNew(1) />
	</cfif>
	<cfquery name="qNestedList" datasource="#attributes.dsn#">
		SELECT DISTINCT
			parent_id AS parentid,
			pg_id AS pageid,
			pg_type AS pagetype,
			pg_link_name AS linkname,
			pg_link_url AS linkurl,
			pg_LinkUrlTarget AS linktarget
		FROM #attributes.tableprefix#_pgPages
		WHERE parent_id = <cfqueryparam value="#attributes.root.pageid#" cfsqltype="cf_sql_varchar" maxlength="37" />
			AND pg_type IN ( 'page', 'link' )
			<cfif attributes.showdisabled eq "no">
				AND pg_enabled = 1
			</cfif>
			AND
			(
				(
					pg_Schedule = 1
					AND ( pg_PublishDate <= <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" /> )
					AND ( pg_RemoveDate > <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" /> )
				)
				OR ( pg_Schedule = 0 )
			)
		ORDER BY pg_order, pg_link_name
	</cfquery>
	<cfif qNestedList.Recordcount>
		<cfloop query="qNestedList">
			<cfset attributes.root.children[qNestedList.CurrentRow] = StructNew() />
			<cfset attributes.root.children[qNestedList.CurrentRow].parentid = qNestedList.parentid />
			<cfset attributes.root.children[qNestedList.CurrentRow].pageid = qNestedList.pageid />
			<cfset attributes.root.children[qNestedList.CurrentRow].linkname = qNestedList.linkname />
			<cfset attributes.root.children[qNestedList.CurrentRow].children = ArrayNew(1) />
			<cfif attributes.submenu eq "yes" and attributes.lvlcount lt attributes.nesteddepth>
				<cfsavecontent variable="isSubMenu">
					<tag:horizontaltable
						root="#attributes.root.children[qNestedList.CurrentRow]#"
						dsn="#attributes.dsn#"
						tableprefix="#attributes.tableprefix#"
						thispage="#attributes.thispage#"
						page="#attributes.page#"
						startmenu="#attributes.startmenu#"
						submenu="#attributes.submenu#"
						showdisabled="#attributes.showdisabled#"
						lvlcount="#attributes.lvlcount#"
						nesteddepth="#attributes.nesteddepth#"
					/>
				</cfsavecontent>
			</cfif>
			<cfscript>
				if ( qNestedList.pagetype eq "link" ) {
					if ( qNestedList.linkurl contains "http:" or qNestedList.linkurl contains "file:" or qNestedList.linkurl contains "ftp:" or qNestedList.linkurl contains "https:" or qNestedList.linkurl contains "##" )
						theurl = qNestedList.linkurl;
					else theurl = qNestedList.linkurl & "&pageid=" & qNestedList.pageid;
				} else theurl = attributes.page & "&pageid=" & qNestedList.pageid;
				if ( qNestedList.pageid eq attributes.thispage )
					listclass = 'id="me"';
				else listclass = "";
				if ( isdefined('isSubMenu') and len(trim(isSubMenu)) )
					listclass = listclass & ' class="isFolder"';
				if ( qNestedList.pageid eq attributes.thispage )
					subClass = 'class="active"';
				else subClass = 'class="inactive"';
				if ( qNestedList.linkurl contains "##" )
					target = 'target="_self"';
				else if ( len(qNestedList.linktarget) and not (qNestedList.linkurl contains "##") )
					target = 'target="#qNestedList.linktarget#"';
				else target = 'target="_self"';
			</cfscript>
			<cfoutput>
				<td #listclass#><a href="#theurl#" #target#>#qNestedList.linkname#</a></td>
				<cfif isdefined('isSubMenu') and len(trim(isSubMenu))><ul #subClass#>#isSubMenu#</ul></cfif>
			</cfoutput>
		</cfloop>
	</cfif>
</cfif>