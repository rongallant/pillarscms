<!--- Select the top 1 pr more from each selected category. --->
<cfset catidList = "" />
<cfloop list="#attributes.catid#" index="i">
	<cfset catidList = ListAppend(catidList,"'#i#'") />
</cfloop>

<cfquery name="qTopCatsTmp" datasource="#my.db.dsn#">
	SELECT
		MAX(a.lu_ts) AS entrydate,
		MAX(a.be_entryid) AS entryid,
		MAX(a.be_title) AS title,
		MAX(c.catid) AS catid,
		MAX(c.title) AS cattitle
	FROM #my.db.tableprefix#_BlogEntries AS a
	JOIN #my.db.tableprefix#_BlogCategoriesEntries AS b
		ON b.fk_be_entryid = a.be_entryid
	JOIN #my.db.tableprefix#_BlogCategories AS c
		ON b.fk_catid = c.catid
	WHERE b.fk_catid IN ( 
		<cfqueryparam value="#catidList#" cfsqltype="cf_sql_varchar" maxlength="37" list="true" />
	)
	GROUP BY c.catid
</cfquery>

<cfquery name="qTopCats" dbtype="query">
	SELECT * FROM qTopCatsTmp
	ORDER BY entrydate DESC
</cfquery>