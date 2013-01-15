<cfquery name="qEntry" datasource="#my.db.dsn#">
	SELECT
		a.be_entryid AS entryid,
		a.be_title AS title,
		a.be_shorttext AS shorttext,
		a.be_longtext AS 'longtext',
		a.be_enabled AS enabled,
		a.lu_ts AS 'date'
	FROM #my.db.tableprefix#_BlogEntries AS a
	WHERE a.be_enabled = 1
		AND a.be_entryid = <cfqueryparam value="#attributes.entryid#" cfsqltype="cf_sql_varchar" maxlength="37" />
</cfquery>