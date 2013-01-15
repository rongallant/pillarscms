<cfimport prefix="ui" taglib="../tags/">
<cfcontent reset="yes">
<cfif search.results.recordcount gt 0>
	<cfoutput>
		<div class="mySearch">
			<ui:pagination totalrows="#search.status.found#"
				maxrows="#search.arguments.maxrows#" startrow="#attributes.startrow#"
				baseuri="#myself##attributes.fuseaction#" searchstring="criteria=#attributes.criteria#"/>

			<cfloop query="search.results">
				<cfif search.results.custom2 lte now()>
					<cfscript>
						if (search.results.CurrentRow MOD 2) rowCLASS="row";
						else rowCLASS="alt";
					</cfscript>
					<div class="mySearchRow #rowCLASS#">
						<div class="docTitle">
							<span class="number">#search.results.rank#.</span>
							<cfif search.results.custom3 eq "page">
								<a href="#myself##xfa.Pages#&pageid=#search.results.key#">#search.results.title#</a>
							<cfelse>
								<a href="#myself##xfa.Newsletter#&story=#search.results.key#">#search.results.title#</a>
							</cfif>
						</div>
						<div class="summary">#search.results.context#</div>
					</div>
				</cfif>
			</cfloop>
		</div>
	</cfoutput>
<cfelse>
	<cfoutput>
		<p>Your search - <strong>#attributes.criteria#</strong> - did not match any articles.</p>
	</cfoutput>
</cfif>