<cfparam name="attributes.order" default="name" />

<cfquery name="qApps" datasource="#my.db.dsn#">
	SELECT
		id AS appid,
		name,
		description,
		enabled
	FROM #my.db.tableprefix#_apps
	ORDER BY #attributes.order#
</cfquery>