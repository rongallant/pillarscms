<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="qry_AppInfo" language="ColdFusion">
	<responsibilities>
		I return a list of all the users under a paticular application.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="update" date="2010-02-22" comments="SQL Injection fixes" />
		<history email="ron@rongallant.com" type="create" date="2001-10-08" />
	</properties>
	<io>
		<in>
			<string name="my.db.dsn" />
			<string scope="attributes" name="appid" />
		</in>
		<out>
			<recordset name="qAppInfo">
				<string name="appid" />
				<string name="name" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfquery name="qAppInfo" datasource="#my.db.dsn#">
	SELECT
		a.id AS appid,
		a.name
	FROM #my.db.tableprefix#_apps AS a
	WHERE a.id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.appid)#" />
	ORDER BY a.name ASC
</cfquery>