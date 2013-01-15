<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfset xfa.Edit = "editGroups.Edit" />
		<cfset xfa.delete = "editGroups.Delete" />
		<cfset xfa.Get = fusebox.thisCircuit & ".GetGroup" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="qry_ListGroups.cfm" />
		<cfinclude template="dsp_ListGroups.cfm" />
		<cfset my.page.title = "Groups" />
		<cfset my.page.heading = "List Groups" />
		<cfset my.page.subheading = "" />
	</cfcase>

	<cfcase value="GetGroup">
		<cfset xfa.GetRacf = "#fusebox.thisCircuit#.GetRacf" />
		<cfset xfa.GetApp = "#fusebox.thisCircuit#.GetApp" />
		<cfset xfa.Edit = "editusers.Edit" />
		<cfset xfa.delete = "editGroups.Delete" />
		<cfinclude template="qry_GetGroup.cfm" />
		<cfinclude template="dsp_List.cfm" />
		<cfset request.title = "" />
		<cfset my.page.heading = "" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = "#my.page.heading#" />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>