<cfif thistag.executionmode eq "start">
	<cfimport prefix="menu" taglib="./" />
	<cfparam name="attributes.dsn" />
	<cfparam name="attributes.tableprefix" />
	<cfparam name="attributes.page" />
	<cfparam name="attributes.userid" />
	<cfif not isDefined('request.cnt')>
		<cfset request.breadcrumbs = ArrayNew(1) />
		<cfset request.cnt = 0 />
	</cfif>
	<cfquery name="qCreateArray" datasource="#attributes.dsn#">
		SELECT DISTINCT parent_id, pg_id, pg_link_name, pg_isHome
		FROM #attributes.tableprefix#_pgPages AS a 
		LEFT JOIN #attributes.tableprefix#_GroupsPages AS b 
			ON b.fk_pageid = a.pg_id 
		LEFT JOIN #attributes.tableprefix#_apps AS c 
			ON c.id = b.fk_groupid 
		LEFT JOIN #attributes.tableprefix#_userapps AS d 
			ON d.fk_app_id = c.id
			<cfif isDefined('attributes.page') and len(attributes.page)>
				WHERE a.pg_id = <cfqueryparam value="#attributes.page#" cfsqltype="cf_sql_varchar" maxlength="37" />
			<cfelse>
				WHERE a.pg_isHome = 1
			</cfif>
			AND a.pg_enabled = 1
			AND a.pg_type IN ( 'page', 'nomenu', 'link' )
			AND (
				(
					a.pg_Schedule = 1
					AND ( pg_PublishDate <= <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" /> )
					AND ( pg_RemoveDate > <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" /> )
				)
				OR ( a.pg_Schedule = 0 )
			)
			AND (
				b.fk_pageid IS NULL
				OR (
					d.fk_user_id = <cfqueryparam value="#attributes.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />
					AND d.permissions >= 100
				)
				OR 1 <= (
					SELECT COUNT(aa.identifier) AS 'count'
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
	</cfquery>
	<cfif qCreateArray.Recordcount>
		<menu:createarray
			dsn="#attributes.dsn#"
			tableprefix="#attributes.tableprefix#"
			page="#qCreateArray.parent_id#"
			userid="#attributes.userid#"
		/>
		<cfif qCreateArray.recordcount and qCreateArray.pg_id neq 1>
			<cfset request.cnt = request.cnt + 1 />
			<cfset request.breadcrumbs[request.cnt] = StructNew() />
			<cfset request.breadcrumbs[request.cnt].name = qCreateArray.pg_link_name />
			<cfset request.breadcrumbs[request.cnt].id = qCreateArray.pg_id />
			<cfset request.breadcrumbs[request.cnt].isHome = qCreateArray.pg_isHome />
		</cfif>
	</cfif>
</cfif>