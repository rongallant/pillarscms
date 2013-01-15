<cfimport prefix="sec" taglib="../../">

<cfif wuMenu.RecordCount neq 0>
	<cfset myApps = arrayNew(2)>
	<cfparam name="i" default="1">
	<cfoutput query="wuMenu">
		<sec:security rights="100" thisapp="#wuMenu.identifier#">
			<cfif request.validated eq 1>
				<cfset myApps[i][1] = wuMenu.name>
				<cfset myApps[i][2] = wuMenu.path>
				<cfset myApps[i][3] = wuMenu.description>
				<cfset i = i+1>
			</cfif>
		</sec:security>
	</cfoutput>
</cfif>