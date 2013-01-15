<cfquery name="qBlockTypes" datasource="#my.db.dsn#">
	SELECT
		blocktypeid,
		blockfuseaction,
		blockselectfuseaction,
		displayname
	FROM #my.db.tableprefix#_BlockTypes
	<cfif isDefined('attributes.blocktypeid') and len(attributes.blocktypeid)>
		WHERE blocktypeid = '#attributes.blocktypeid#'
	</cfif>
	ORDER BY orderby
</cfquery>