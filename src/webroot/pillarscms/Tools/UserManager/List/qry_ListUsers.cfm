<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="qry_ListUsers" language="ColdFusion">
	<responsibilities>
		I return all rows.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="update" date="2010-02-22" comments="SQL Injection fixes" />
		<history email="ron@rongallant.com" type="update" date="2003-07-28" comments="added enabled field" />
		<history email="ron@rongallant.com" type="create" />
	</properties>
	<io>
		<in>
			<string name="my.db.dsn" />
			<string scope="attributes" name="Order" />
		</in>
		<out>
			<recordset name="getMessages">
				<string name="usrid" />
				<string name="FirstName" />
				<string name="LastName" />
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
		a.Enabled
	FROM #my.db.tableprefix#_users AS a
	ORDER BY #attributes.Order# ASC
</cfquery>