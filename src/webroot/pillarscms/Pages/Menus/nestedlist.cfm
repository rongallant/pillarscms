<cfif thistag.executionmode eq "start">
	<cfimport prefix="tag" taglib="./" />
	<cfparam name="attributes.dsn" />
	<cfparam name="attributes.tableprefix" />
	<cfparam name="attributes.page" />
	<cfparam name="attributes.thispage" />
	<cfparam name="attributes.path" default="" />
	<cfparam name="attributes.startmenu" default="1" />
	<cfparam name="attributes.nesteddepth" default="2" />
	<cfparam name="attributes.showdisabled" default="no" />
	<cfparam name="attributes.submenu" default="yes" />
	<cfparam name="attributes.lvlcount" default="0" />
	<cfparam name="attributes.userid" default="#session.userid#" />
	<cfset attributes.lvlcount = attributes.lvlcount + 1 />
	<cfset request.lvlcount = attributes.lvlcount />
	<cfif not isDefined('attributes.root')>
		<cfset attributes.root = StructNew() />
		<cfset attributes.root.pageid = attributes.startmenu />
		<cfset attributes.root.children = ArrayNew(1) />
	</cfif>
	<cfquery name="qNestedList" datasource="#attributes.dsn#">
		SELECT DISTINCT
			a.parent_id AS parentid,
			a.pg_id AS pageid,
			a.pg_type AS pagetype,
			a.pg_link_name AS linkname,
			a.pg_link_url AS linkurl,
			a.pg_LinkUrlTarget AS linktarget,
			a.pg_order AS orderby
		FROM #attributes.tableprefix#_pgPages AS a 
		LEFT JOIN #attributes.tableprefix#_GroupsPages AS b 
			ON b.fk_pageid = a.pg_id 
		LEFT JOIN #attributes.tableprefix#_apps AS c 
			ON c.id = b.fk_groupid 
		LEFT JOIN #attributes.tableprefix#_userapps AS d 
			ON d.fk_app_id = c.id
		WHERE a.parent_id = <cfqueryparam value="#attributes.root.pageid#" cfsqltype="cf_sql_varchar" maxlength="37" />
			AND a.pg_type IN ( 'page', 'link' )
			AND (
				a.pg_Schedule = 0
				OR (
					a.pg_Schedule = 1
					AND ( a.pg_PublishDate <= <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" /> )
					AND ( a.pg_RemoveDate > <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" /> )
				)
			)
			<!--- Security --->
			<cfif attributes.showdisabled eq "no">
			AND pg_enabled = 1
			AND (
				b.fk_pageid IS NULL
				OR (
					d.fk_user_id = <cfqueryparam value="#attributes.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />
					AND d.permissions >= 100
				)
				OR 1 <= (
					SELECT count(aa.identifier) AS count
					FROM #attributes.tableprefix#_apps aa
					LEFT OUTER JOIN #attributes.tableprefix#_userapps bb
						ON bb.fk_app_id = aa.id
					LEFT OUTER JOIN #attributes.tableprefix#_users cc
						ON cc.username = bb.fk_user_id
					WHERE aa.identifier = 'admin'
					AND bb.permissions >= 100
					AND cc.enabled = '1'
					AND cc.username = <cfqueryparam value="#attributes.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />
				)
			)
			</cfif>
		ORDER BY
			a.pg_order,
			a.pg_link_name,
			a.pg_link_url,
			a.pg_LinkUrlTarget,
			a.pg_type,
			a.parent_id,
			a.pg_id
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
					<tag:nestedlist
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
					linkid = 'id="me"';
				else linkid = "";
				if ( isdefined('isSubMenu') and len(trim(isSubMenu)) )
					listclass = 'class="isFolder"';
				else listclass = "";
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
				<li #listclass#>
					<a href="#theurl#" #target# #linkid#>#qNestedList.linkname#</a>
					<cfif isdefined('isSubMenu') and len(trim(isSubMenu))><ul #subClass#>#isSubMenu#</ul></cfif>
				</li>
			</cfoutput>
		</cfloop>
	</cfif>
</cfif>