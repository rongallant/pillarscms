<cfquery name="qEntry" datasource="#my.db.dsn#">
	SELECT
		a.be_entryid AS entryid,
		a.be_title AS title,
		a.be_shorttext AS shorttext,
		a.be_longtext AS 'longtext',
		a.be_enabled AS enabled,
		a.cr_ts,
		a.cr_id,
		a.lu_ts,
		a.lu_id
	FROM #my.db.tableprefix#_BlogEntries AS a
	<cfif isDefined('attributes.entryid') and len(attributes.entryid)>
		WHERE a.be_entryid = <cfqueryparam value="#attributes.entryid#" cfsqltype="cf_sql_varchar" maxlength="37" />
	<cfelse>
		WHERE 1 = 0
	</cfif>
</cfquery>