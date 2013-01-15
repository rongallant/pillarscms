<cfimport prefix="sec" taglib="../../../">
<cfset showButton = false>
<cfif not ( isDefined('session.hideadmin') and session.hideadmin eq 1 ) and len(attributes.pageid)>
	<cfset showButton = true />
</cfif>
<cfif IsDefined("request.showbutton")>
	<cfset showButton = request.showbutton />
</cfif>
<cfif showButton>
	<cfoutput>
		<div class="EditorIcon">
			<a href="#myself##xfa.edit#&pageid=#attributes.pageid#<cfif IsDefined("request.page_full")>&page_full=#request.page_full#</cfif>" onMouseover="hOn('ea#attributes.pageid#','##FFFFCC');" onmouseout="hOff('ea#attributes.pageid#');" target="_blank">
				<img src="assets/images/editoricons/edit_sm.png" alt="Edit '#attributes.pagename#'" width="10" height="10" border="0"/></a>
		</div>
	</cfoutput>
</cfif>