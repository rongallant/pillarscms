<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="qry_GetMenu.cfm" language="ColdFusion">
	<responsibilities>
		I return a list of the logged in users applications.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2002-12-20" />
	</properties>
	<io>
		<in>
			<string name="my.db.dsn" />
			<string scope="attributes" name="userid" />
		</in>
		<out>
			<recordset name="wuMenu">
				<string name="application" />
				<string name="name" />
				<string name="path" />
				<string name="firstname" />
				<string name="lastname" />
				<string name="" />
				<string name="" />
				<string name="" />			
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfquery name="wuMenu" datasource="#my.db.dsn#">
	SELECT
		a.id application,
		a.identifier,
		a.name,
		a.path,
		c.firstname,
		c.lastname
	FROM webutils_apps a
		LEFT OUTER JOIN webutils_userapps b
			ON b.fk_app_id = a.id
		LEFT OUTER JOIN webutils_users c
			ON c.username = b.fk_user_id
	WHERE a.enabled = 1
	ORDER BY a.name
</cfquery>