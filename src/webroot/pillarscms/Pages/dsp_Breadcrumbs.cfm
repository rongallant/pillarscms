<cfoutput>
<ul>
	<li><a href="#self#">Home</a></li>
	<cfif isDefined('request.breadcrumbs') and ArrayLen(request.breadcrumbs)>
		<cfloop from="1" to="#ArrayLen(request.breadcrumbs)#" index="i">
			<cfif request.breadcrumbs[i].isHome neq 1>
				<li><a href="#myself##xfa.Page#&pageid=#request.breadcrumbs[i].id#">#request.breadcrumbs[i].name#</a></li>
			</cfif>
		</cfloop>
	</cfif>
</ul>
</cfoutput>