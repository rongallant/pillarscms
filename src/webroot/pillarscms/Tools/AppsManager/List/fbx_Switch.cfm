<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfset xfa.Edit = "editapps.Edit" />
		<cfset xfa.delete = "editapps.Delete" />
		<cfset xfa.GetApp = "#fusebox.thisCircuit#.GetApp" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="qry_ListApps.cfm" />
		<cfinclude template="dsp_ListApps.cfm" />
		<cfset my.page.heading = "List Groups" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="GetApp">
		<cfset xfa.GetUsername = "#fusebox.thisCircuit#.GetUsername" />
		<cfset xfa.GetApp = "#fusebox.thisCircuit#.GetApp" />
		<cfset xfa.Edit = "editusers.Edit" />
		<cfset xfa.delete = "editusers.Delete" />
		<cfinclude template="qry_GetApp.cfm" />
		<cfinclude template="dsp_List.cfm" />
		<cfset request.title = "List #getMessages.name# Users" />
		<cfset my.page.heading = "List Group" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>