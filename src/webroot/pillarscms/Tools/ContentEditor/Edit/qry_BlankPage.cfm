<cfquery name="qPage" datasource="#my.db.dsn#">
	SELECT
		pg_id,
		parent_id,
		fk_layoutid,
		pg_link_name,
		pg_link_url,
		pg_LinkUrlTarget,
		pg_type AS pagetype,
		pg_title,
		pg_Content AS Content,
		pg_DisplayMenu,
		pg_DisplayNav,
		pg_order,
		pg_Author,
		pg_PublishDate,
		pg_RemoveDate,
		pg_Schedule,
		pg_isHome,
		pg_Notes,
		pg_Enabled,
		cr_ts,
		cr_id,
		lu_ts,
		lu_id
	FROM #my.db.tablePrefix#_pgPages
	WHERE 1=0
</cfquery>