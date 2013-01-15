<cfimport prefix="sec" taglib="../" />
<cfoutput>
	<ul>
		<cfloop query="qCat">
			<li>
				<a href="#myself##xfa.Detailed#&entryid=#qCat.entryid#">
				<span class="catdate">#DateFormat(qCat.lu_ts,"mm/dd/yy")#</span>#qCat.title#</a>
				<sec:security thisApp="BlogManager" rights="100">
					<cfif not ( StructKeyExists(session, 'hideadmin') and session.hideadmin )>
					<span class="EditorIcon">
						<a href="#myself##xfa.edit#&entryid=#qCat.entryid#" target="_blank">	
						<img src="assets/images/editoricons/edit_sm.png" alt="Edit Area" width="10" height="10" border="0"/></a>
					</span>
					</cfif>
				</sec:security>
			</li>
		</cfloop>
	</ul>
</cfoutput>