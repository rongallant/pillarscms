<cfimport prefix="sec" taglib="../">
<cfoutput>
<ul>
	<li><a href="#myself##xfa.Menu1#&pageid=#caller.attributes.pageid#">Current Issue</a></li>
	<li><a href="#myself##xfa.Menu2#&pageid=#caller.attributes.pageid#">Previous Issues</a></li>
	<cfif isDefined('attributes.story') and len(attributes.story)>
		<li><a href="#myself##xfa.Menu4#&story=#attributes.story#&layout=print&pageid=#caller.attributes.pageid#" target="_blank">Print Full Issue</a></li>
	</cfif>
</ul>
</cfoutput>