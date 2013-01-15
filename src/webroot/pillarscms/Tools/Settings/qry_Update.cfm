<cfloop list="#fieldnames#" index="i" delimiters=",">
	<cfif listFirst(i, "_") eq "settings">
		<cfquery name="qSettings" datasource="#my.db.dsn#">
			UPDATE #my.db.tableprefix#_Settings
			SET varValue = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="5000" value="#attributes[i]#" />
			WHERE varID = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#listlast(i, "_")#" />
		</cfquery>
	</cfif>
</cfloop>