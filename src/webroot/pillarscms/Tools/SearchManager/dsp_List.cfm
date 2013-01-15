<cfif qoq.recordcount eq 0>
	<cfthrow type="custom" message="The collection '#application.applicationname#' does not exist."/>
</cfif>

<ul>
<cfloop query="qoq">
	<cfloop list="#qoq.columnlist#" index="i">
		<cfoutput><li><strong>#i#</strong> - #qoq[i][qoq.CurrentRow]#</li></cfoutput>
	</cfloop>
</cfloop>
</ul>