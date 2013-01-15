<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
</fusedoc>
--->

<!--- I deisplay only 6 month of issues --->
<cfif request.my.app.mode eq 0>
	<cfset sixMonthsAgo = dateadd("m", -6, now()) />
</cfif>

<cfquery name="qHistory" datasource="#my.db.dsn#">
	SELECT DISTINCT
		DatePart("yyyy",a.issue_startdate) AS startyear,
		a.issue_startdate AS startdate,
		a.issue_id AS issueid,
		b.article_title AS title
	FROM #my.db.tableprefix#_Issues a
	JOIN #my.db.tableprefix#_Articles b
		ON issue_id = fk_issue_id
	WHERE a.issue_startdate < (
		SELECT MAX(a.issue_startdate)
		FROM #my.db.tableprefix#_Issues AS a
		JOIN #my.db.tableprefix#_Articles AS b
			ON b.fk_issue_id = a.issue_id
		WHERE a.issue_enabled = 1
			AND b.article_enabled = 1
			AND a.issue_startdate <= <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" />
		)
	<cfif isDefined('sixMonthsAgo')>
		AND  a.issue_startdate > <cfqueryparam value="#sixMonthsAgo#" cfsqltype="cf_sql_timestamp" />
	</cfif>
	ORDER BY a.issue_startdate ASC
</cfquery>