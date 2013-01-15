<cfimport prefix="sec" taglib="../" />
<sec:security thisApp="SiteManager" rights="100">
<cfoutput>
	<div class="admintoggle">
		<cfif isDefined('session.hideadmin') and session.hideadmin eq 1>
			<a href="#myself##xfa.ToggleAdmin#&hideadmin=0">Show Edit Buttons</a>
		<cfelse>
			<a href="#myself##xfa.ToggleAdmin#&hideadmin=1">Hide Edit Buttons</a>
		</cfif>
		- <a href="#myself##xfa.Admin#">Site Administration</a>
	</div>
</cfoutput>
</sec:security>