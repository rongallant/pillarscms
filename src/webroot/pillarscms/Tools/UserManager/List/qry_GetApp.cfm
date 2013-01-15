<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="qry_GetApp" language="ColdFusion">
	<responsibilities>
		I return a list of all the users under a paticular application.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="update" date="2010-02-22" comments="SQL Injection fixes" />
		<history email="ron@rongallant.com" type="update" date="2003-07-28" comments="added Enabled field" />
		<history email="ron@rongallant.com" type="create" />
	</properties>
	<io>
		<in>
			<string name="my.db.dsn" />
			<string scope="attributes" name="appid" />
			<string scope="attributes" name="Order" />
		</in>
		<out>
			<recordset name="getMessages">
				<string name="usrid" />
				<string name="FirstName" />
				<string name="LastName" />
				<string name="appid" />
				<string name="name" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfif NOT listContainsNoCase("username,lastname", attributes.Order)>
	<cfset attributes.Order = "LastName" />
</cfif>

<cfquery name="getMessages" datasource="#my.db.dsn#">
	SELECT
		a.username AS usrid,
		a.FirstName,
		a.LastName,
		a.Enabled,
		c.id AS appid,
		c.name
	FROM #my.db.tableprefix#_users AS a
	LEFT OUTER JOIN #my.db.tableprefix#_userapps AS b
		ON a.username = b.fk_user_id
	LEFT OUTER JOIN #my.db.tableprefix#_apps AS c
		ON c.id = b.fk_app_id
	WHERE c.id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.appid)#" />
	ORDER BY a.#attributes.Order# ASC
</cfquery>