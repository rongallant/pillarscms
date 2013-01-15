<cfoutput>

<cfif qPages.RecordCount eq 0>
	<p>There are no pages under this group</p>
	<p>&lt;&lt; <a href="#myself##xfa.PageList#">Back to list</a></p>
<cfelse>

<ul>
<cfloop query="qPages">
	<li><a href="#myself##xfa.EditPage#&pageid=#qPages.pg_id#">#qPages.pg_Title#</a></li>
</cfloop>
</ul>

</cfif>

</cfoutput>