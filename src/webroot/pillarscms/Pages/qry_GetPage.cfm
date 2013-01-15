<cfquery name="qPage" datasource="#my.db.dsn#">
	SELECT
		a.pg_id AS pageid,
		a.pg_title AS title,
		a.pg_Author AS author,
		a.pg_Content AS content,
		a.pg_DisplayMenu AS displaymenu,
		a.pg_DisplayNav AS displaynav,
		a.pg_type AS pagetype,
		e.name AS theme		
	FROM #my.db.tablePrefix#_pgPages AS a
		LEFT JOIN #my.db.tableprefix#_GroupsPages AS b
			ON b.fk_pageid = a.pg_id
		LEFT JOIN #my.db.tableprefix#_apps AS c
			ON c.id = b.fk_groupid
		LEFT JOIN #my.db.tableprefix#_userapps AS d
			ON d.fk_app_id = c.id
	LEFT OUTER JOIN #my.db.tablePrefix#_Layouts AS e
		ON e.layoutid = a.fk_layoutid
	<cfif isDefined('attributes.pageid') and len(attributes.pageid)>
		WHERE a.pg_id = <cfqueryparam value="#attributes.pageid#" cfsqltype="cf_sql_varchar" maxlength="37" />
	<cfelse>
		WHERE a.pg_isHome = 1
	</cfif>
	<cfif request.previewmode eq 1>
		AND a.pg_Enabled = 1
		AND (
			(
				a.pg_Schedule = 1
				AND ( a.pg_PublishDate <= <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" /> )
				AND ( a.pg_RemoveDate > <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" /> )
			)
			OR ( a.pg_Schedule = 0 )
		)
		AND (
			b.fk_pageid IS NULL
			OR (
				d.fk_user_id = <cfqueryparam value="#my.user.authuser#" cfsqltype="cf_sql_varchar" maxlength="8" />
				AND d.permissions >= 100
			)
			OR 1 <= (
				SELECT COUNT(aa.identifier) AS COUNT
				FROM #my.db.tableprefix#_apps AS aa
				LEFT OUTER JOIN #my.db.tableprefix#_userapps AS bb
					ON bb.fk_app_id = aa.id
				LEFT OUTER JOIN #my.db.tableprefix#_users AS cc
					ON cc.username = bb.fk_user_id
				WHERE aa.identifier = 'admin'
					AND bb.permissions >= 100
					AND cc.enabled = '1'
					AND cc.username = <cfqueryparam value="#my.user.authuser#" cfsqltype="cf_sql_varchar" maxlength="8" />
			)
		)
	</cfif>
</cfquery>