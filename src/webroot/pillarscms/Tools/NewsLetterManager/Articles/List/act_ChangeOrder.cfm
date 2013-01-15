<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2004-04-22" />
	</properties>
</fusedoc>
--->

<cfif isdefined('attributes.go')>

	<!--- select all entries --->
	<cfquery name="qAll" datasource="#my.db.dsn#">
		SELECT
			a.article_id AS id,
			a.article_order AS orderby,
			a.fk_issue_id AS issueid
		FROM #my.db.tableprefix#_Articles AS a
		WHERE a.fk_issue_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.issueid#" />
		ORDER BY a.article_order ASC
	</cfquery>
	
	<!--- create array --->
	<cfset neworder = ArrayNew(1) />
	<cfloop query="qAll">
		<cfset neworder[qAll.CurrentRow] = qAll.id />
	</cfloop>

	<!--- Reorder --->
	<cfloop index="i" from="1" to="#arraylen(neworder)#">
		<cfif neworder[i] eq attributes.id>
			<cfif attributes.go eq "up">
				<cfset tmp = i - 1 />
			<cfelseif attributes.go eq "down">
				<cfset tmp = i + 1 />
			</cfif>
			<cfset ArraySwap(neworder,i,tmp) />
			<cfbreak />
		</cfif>
	</cfloop>

	<!--- Update entries --->
	<cfloop index="i" from="1" to="#ArrayLen(neworder)#">
		<cfquery name="qUpdateOrder" datasource="#my.db.dsn#">
			UPDATE #my.db.tableprefix#_articles
			SET article_order = <cfqueryparam cfsqltype="cf_sql_integer" maxlength="10" value="#i#" />
			WHERE article_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#neworder[i]#" />
		</cfquery>
	</cfloop>

</cfif>