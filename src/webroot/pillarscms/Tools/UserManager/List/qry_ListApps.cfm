<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="qry_ListApps" language="ColdFusion">
	<responsibilities>
		I return a list of all distinct applications.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" />
	</properties>
	<io>
		<in>
			<string name="my.db.dsn" />
		</in>
		<out>
			<recordset name="qApps" format="CFML">
				<string name="appid" />
				<string name="name" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfquery name="qApps" datasource="#my.db.dsn#">
	SELECT
		a.id AS appid,
		a.name
	FROM #my.db.tableprefix#_apps AS a
	ORDER BY a.name
</cfquery>