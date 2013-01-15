<cfquery name="qCat" datasource="#my.db.dsn#">
	SELECT TOP 5
		a.be_entryid AS entryid,
		a.be_title AS title,
		a.be_shorttext AS shorttext,
		a.be_longtext AS 'longtext',
		a.be_enabled AS enabled,
		a.cr_ts,
		a.lu_ts,
		<cfif isDefined('attributes.catid') and len(attributes.catid)>
			c.catid,
			c.title AS cat
		<cfelse>
			' ' AS cat
		</cfif>
	FROM #my.db.tableprefix#_BlogEntries AS a
	<cfif isDefined('attributes.catid') and len(attributes.catid)>
		LEFT OUTER JOIN #my.db.tableprefix#_BlogCategoriesEntries AS b
			ON b.fk_be_entryid = a.be_entryid
		LEFT OUTER JOIN #my.db.tableprefix#_BlogCategories AS c
			ON b.fk_catid = c.catid
		WHERE b.fk_catid = <cfqueryparam value="#attributes.catid#" cfsqltype="cf_sql_varchar" maxlength="37" />
	</cfif>
	ORDER BY a.lu_ts DESC
</cfquery>