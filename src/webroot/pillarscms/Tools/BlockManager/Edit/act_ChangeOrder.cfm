<cfparam name="attributes.go" />

<!--- select all entries --->
<cfquery name="qAll" datasource="#my.db.dsn#">
	SELECT 
		blockid AS id,
		fk_pageid AS pageid,
		layoutarea,
		orderby
	FROM #my.db.tableprefix#_Blocks
	WHERE fk_pageid = '#qBlocks.pageid#'
		AND layoutarea = '#qBlocks.layoutarea#'
	ORDER BY orderby ASC
</cfquery>

<!--- create array --->
<cfset neworder = ArrayNew(1)>
<cfloop query="qAll">
	<cfset neworder[qAll.CurrentRow] = qAll.id>
</cfloop>

<!--- Reorder --->
<cfif arraylen(neworder) eq 2>	
	<cfset ArraySwap(neworder,1,2)>
<cfelse>
	<cfloop index="i" from="1" to="#arraylen(neworder)#">
		<cfif neworder[i] eq attributes.blockid>
			<cfif attributes.go eq "up">
				<cfset tmp = i - 1>
			<cfelseif attributes.go eq "down">
				<cfset tmp = i + 1>
			</cfif>
			<cfset ArraySwap(neworder,i,tmp)>
			<cfbreak>
		</cfif>
	</cfloop>
</cfif>

<!--- Update entries --->
<cfset tmp = 0>
<cfloop index="i" from="1" to="#ArrayLen(neworder)#">
	<cfset tmp = tmp + 1>
	<cfquery name="qUpdateOrder" datasource="#my.db.dsn#">
		UPDATE #my.db.tableprefix#_Blocks
		SET orderby = #tmp#
		WHERE blockid = '#neworder[i]#'
	</cfquery>
</cfloop>