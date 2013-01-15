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

<cfquery name="qGroup" datasource="#my.db.dsn#">
	SELECT
		fk_grp_parent,
		grp_name,
		grp_Enabled
	FROM ICBUpgGroups
	WHERE grp_id = '#attributes.groupid#'
</cfquery>