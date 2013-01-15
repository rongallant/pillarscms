<cfloop list="#form.myapps#" index="appid">

	<cfset found = 0 />

	<cfloop query="qAppList">
		<cfif qAppList.id eq appid>
			<cfset found = 1 />
		</cfif>
	</cfloop>

	<cfif found neq 1>
		<cfquery name="AddUserApp" datasource="#my.db.dsn#">
			INSERT INTO #my.db.tableprefix#_userapps (
				fk_user_id,
				fk_app_id,
				permissions,
				cr_id,
				cr_ts
			)
			VALUES (
				<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(lcase(attributes.usrid))#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(appid)#" />,
				100,
				<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="#cgi.auth_user#" />,
				<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />
			)
		</cfquery>
	</cfif>

</cfloop>

<cfoutput>#found#</cfoutput>