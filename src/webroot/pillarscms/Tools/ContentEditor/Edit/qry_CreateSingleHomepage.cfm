<cfif not isDefined('attributes.pgIsHome')>
	<cfset attributes.pgIsHome = 0 />
</cfif>

<cfquery name="qCheckForDiff" datasource="#my.db.dsn#">
	SELECT pg_isHome
	FROM #my.db.tablePrefix#_pgPages
	WHERE pg_id = '#attributes.pageid#'
		AND pg_isHome = #attributes.pgIsHome#
</cfquery>

<cfif attributes.pagetype eq "page" and qCheckForDiff.recordcount eq 0>

 	<cfquery name="qAddHomepage" datasource="#my.db.dsn#">
		UPDATE #my.db.tablePrefix#_pgPages
		SET 
			pg_isHome = 1,
			lu_ts = #now()#,
			lu_id = '#cgi.auth_user#'
		WHERE pg_id = '#attributes.pageid#'
		AND pg_isHome = 0
		AND pg_Enabled = 1
		AND pg_PublishDate < #now()#
		AND (
			pg_RemoveDate > #now()#
			OR pg_Schedule = 0
		)
	</cfquery>
	
	<cfquery name="qResetNonHomepages" datasource="#my.db.dsn#">
		UPDATE #my.db.tablePrefix#_pgPages
		SET 
			pg_isHome = 0,
			lu_ts = #now()#,
			lu_id = '#cgi.auth_user#'
		WHERE pg_id <> '#attributes.pageid#'
		AND pg_isHome = 1
	</cfquery>

	<!--- I check that a homepage now exists --->
	<cfquery name="qCheckForHomepage" datasource="#my.db.dsn#">
		SELECT pg_id
		FROM #my.db.tablePrefix#_pgPages
		WHERE pg_isHome = 1
	</cfquery>

	<!--- I set a homepage if none exist --->
	<cfif qCheckForHomepage.recordcount eq 0>
		
		<cfquery name="qGetTopPage" datasource="#my.db.dsn#">
			SELECT TOP 1 pg_id
			FROM #my.db.tablePrefix#_pgPages
			WHERE pg_type = 'page'
				AND pg_Enabled = 1
				AND pg_PublishDate < #now()#
				AND (
					pg_RemoveDate > #now()#
					OR pg_Schedule = 0
				)
			ORDER BY cr_ts ASC
		</cfquery>

		<cfif qGetTopPage.recordcount gt 0>
			<cfquery name="qSetHomePage" datasource="#my.db.dsn#">
				UPDATE #my.db.tablePrefix#_pgPages
				SET 
					pg_isHome = 1,
					lu_ts = #now()#,
					lu_id = '#cgi.auth_user#'
				WHERE pg_id = '#qGetTopPage.pg_id#'
			</cfquery>
			<cfthrow type="custom" message="Could not set this page as homepage. A new page has been selected for you.<br /><a href='#myself##xfa.ListPages#'>Back to pages</a>" />
		<cfelse>
			<cfthrow type="custom" message="There are no pages to set as a homepage." />
		</cfif>

	</cfif>

</cfif>