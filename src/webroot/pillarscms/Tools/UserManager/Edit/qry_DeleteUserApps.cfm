<cfoutput query="qAppList">
	<cfif not listcontains(form.myapps, qAppList.id)>
		<cfquery name="Delete" datasource="#my.db.dsn#">
			DELETE FROM #my.db.tableprefix#_userapps
			WHERE fk_user_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(lcase(attributes.usrid))#" />
			AND fk_app_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(qAppList.id)#" />
		</cfquery>
	</cfif>
</cfoutput>