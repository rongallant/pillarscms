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

<cfparam name="attributes.groupid" default="1">

<cfquery name="qPages" datasource="#my.db.dsn#">
	SELECT
		parent_id,
		pg_id,
		pg_title,
		pg_DisplayMenu,
		pg_order,
		pg_Author,
		pg_PublishDate,
		pg_Notes,
		pg_Enabled,
		cr_ts,
		cr_id,
		lu_ts,
		lu_id
	FROM #my.db.tablePrefix#_pgPages
	WHERE parent_id = '#attributes.parentid#'
	ORDER BY pg_order, pg_title
</cfquery>