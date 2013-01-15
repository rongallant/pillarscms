<cfparam name="attributes.story" default="" />
<cfoutput>
<ul>
	<cfloop query="request.qIssue">
		<li><a href="#myself##xfa.ViewStory#&story=#request.qIssue.storyid#&pageid=#caller.attributes.pageid#"
			<cfif attributes.story eq request.qIssue.storyid> id="current"</cfif>>#request.qIssue.title#</a></li>
	</cfloop>
</ul>
</cfoutput>