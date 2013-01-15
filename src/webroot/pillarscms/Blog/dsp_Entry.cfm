<cfoutput>
<div class="Article">
	<div id="description">#qEntry.longtext#</div>
	<cfif not ( StructKeyExists(session, 'hideadmin') and session.hideadmin )>
		<div class="EditorIcon">
			<a href="#myself##xfa.edit#&entryid=#qEntry.entryid#" target="_blank">	
			<img src="assets/images/editoricons/edit_sm.png" alt="Edit Area" width="10" height="10" border="0"/></a>
		</div>
	</cfif>
</div>
</cfoutput>