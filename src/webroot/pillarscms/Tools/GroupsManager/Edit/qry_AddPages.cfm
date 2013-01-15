<cfif ListLen(attributes.pageidlist)>
	<cfloop list="#attributes.pageidlist#" index="i">
		<cfquery name="qAddGroupPages" datasource="#my.db.dsn#">
			INSERT INTO #my.db.tableprefix#_GroupsPages (
				fk_groupid,
				fk_pageid
			)
			VALUES (
				<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.groupid#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#i#" />
			)
		</cfquery>
	</cfloop>
</cfif>