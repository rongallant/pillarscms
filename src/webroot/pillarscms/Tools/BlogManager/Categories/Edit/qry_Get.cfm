<cfparam name="attributes.catid" default="0">

<cfquery name="qCat" datasource="#my.db.dsn#">
	SELECT
		catid AS id,
		title,
		description,
		cr_id,
		cr_ts,
		lu_id,
		lu_ts
	FROM #my.db.tableprefix#_BlogCategories
	WHERE catid = '#attributes.catid#'
</cfquery>