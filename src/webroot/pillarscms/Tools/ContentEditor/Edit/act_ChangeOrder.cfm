<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2004-09-21" />
	</properties>
</fusedoc>
--->

<cfif isdefined('attributes.go')>

	<!--- select all entries --->
	<cfquery name="qAll" datasource="#my.db.dsn#">
		SELECT
			pg_id AS id,
			pg_order AS orderby
		FROM #my.db.tablePrefix#_pgPages
		WHERE parent_id = '#attributes.groupid#'
		ORDER BY orderby ASC
	</cfquery>

	<!--- create array --->
	<cfset neworder = ArrayNew(1)>
	<cfloop query="qAll">
		<cfset neworder[qAll.CurrentRow] = qAll.id>
	</cfloop>

	<!--- Reorder --->
	<cfloop index="i" from="1" to="#arraylen(neworder)#">
		<cfif neworder[i] eq attributes.id>
			<cfif attributes.go eq "up">
				<cfset tmp = i - 1>
			<cfelseif attributes.go eq "down">
				<cfset tmp = i + 1>
			</cfif>
			<cfset ArraySwap(neworder,i,tmp)>
			<cfbreak>
		</cfif>
	</cfloop>

	<!--- Update entries --->
	<cfset tmp = 0>
	<cfloop index="i" from="1" to="#ArrayLen(neworder)#">
		<cfset tmp = tmp + 1>
		<cfquery name="qUpdateOrder" datasource="#my.db.dsn#">
			UPDATE #my.db.tablePrefix#_pgPages
			SET pg_order = #tmp#
			WHERE parent_id = '#attributes.groupid#'
			AND pg_id = '#neworder[i]#'
		</cfquery>
	</cfloop>

</cfif>