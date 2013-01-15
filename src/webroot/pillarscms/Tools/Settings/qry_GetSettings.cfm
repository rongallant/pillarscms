<cfquery name="qSettings" datasource="#my.db.dsn#">
	SELECT
		var.varID,
		var.varScope,
		var.varName,
		var.varValue,
		var.varTitle,
		var.varDescription,
		var.varFieldType,
		grp.groupID,
		grp.groupOrderby,
		grp.groupName,
		grp.groupDescription
	FROM #my.db.tablePrefix#_Settings AS var
	JOIN #my.db.tablePrefix#_SettingsGrps AS grp
		ON var.fk_groupid = grp.groupid
	ORDER BY
		grp.groupOrderby,
		var.varOrderby
</cfquery>