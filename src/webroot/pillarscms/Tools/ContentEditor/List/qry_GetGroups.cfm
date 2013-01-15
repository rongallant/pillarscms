<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
	<io>
		<in>
			<string name="" />
		</in>
		<out>
			<string name="" />
		</out>
	</io>
</fusedoc>
--->

<cfquery name="qGroups" datasource="#my.db.dsn#">
	SELECT
		fk_grp_parent AS parentid,
		grp_id AS groupid,
		grp_name AS groupname
	FROM pgGroups
	ORDER BY grp_order
	ORDER BY grp_order, grp_name
</cfquery>