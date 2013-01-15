<cfoutput>
<ul>
	<cfloop query="qTopCats">
		<li>
			<a href="#myself##xfa.Detailed#&entryid=#qTopCats.entryid#">
			<span class="catdate">#DateFormat(qTopCats.entrydate,"mm/dd/yy")#</span>
			#qTopCats.title#</a>
			<sec:security thisApp="BlogManager" rights="100">
				<cfif not ( StructKeyExists(session, 'hideadmin') and session.hideadmin )>
				<span class="EditorIcon">
					<a href="#myself##xfa.edit#&entryid=#qTopCats.entryid#" target="_blank">
					<img src="assets/images/editoricons/edit_sm.png" alt="Edit Area" width="10" height="10" border="0"/></a>
				</span>
				</cfif>
			</sec:security>
		</li>
	</cfloop>
</ul>
</cfoutput>