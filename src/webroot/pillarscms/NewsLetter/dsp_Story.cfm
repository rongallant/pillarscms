<cfif request.qStory.recordcount eq 0>
	<cfthrow type="fusebox" errorcode="404" />
	<cfoutput><p>404 error - Page not found.</p></cfoutput>
<cfelse>
	<cfoutput><div class="EditableArea" id="ea#request.qIssue.storyid#">#request.qStory.content#</div></cfoutput>
</cfif>