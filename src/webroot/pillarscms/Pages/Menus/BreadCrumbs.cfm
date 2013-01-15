<cfif thistag.executionmode eq "start">
	<cfparam name="attributes.dsn" />
	<cfparam name="attributes.tableprefix" />
	<cfparam name="attributes.page" />
	<cfparam name="attributes.userid" default="#ListLast(cgi.auth_user,"\")#" />
	<cfimport prefix="menu" taglib="./" />
	<cfquery name="qPages" datasource="#attributes.dsn#">
		SELECT DISTINCT parent_id
		FROM #attributes.tableprefix#_pgPages AS a 
		LEFT JOIN #attributes.tableprefix#_GroupsPages AS b 
			ON b.fk_pageid = a.pg_id 
		LEFT JOIN #attributes.tableprefix#_apps AS c 
			ON c.id = b.fk_groupid 
		LEFT JOIN #attributes.tableprefix#_userapps AS d 
			ON d.fk_app_id = c.id
		<cfif isDefined('attributes.page') and len(attributes.page)>
			WHERE pg_id = <cfqueryparam value="#attributes.page#" cfsqltype="cf_sql_varchar" maxlength="37" />
		<cfelse>
			WHERE pg_isHome = 1
		</cfif>
			<!--- Security --->
			AND pg_enabled = 1
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
	<cfif qPages.Recordcount>
		<cfparam name="request.breadcrumbs" default="" />
		<menu:CreateArray
			dsn="#attributes.dsn#"
			tableprefix="#attributes.tableprefix#"
			page="#qPages.parent_id#"
		/>
		<cfset request.breadcrumbs = ListAppend(request.breadcrumbs, attributes.page) />
	</cfif>
</cfif>