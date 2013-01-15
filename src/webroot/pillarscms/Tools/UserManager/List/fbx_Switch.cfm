<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfset xfa.GetUsername = "#fusebox.thisCircuit#.GetUsername" />
		<cfset xfa.GetApp = "#fusebox.thisCircuit#.GetApp" />
		<cfset xfa.Edit = "editusers.Edit" />
		<cfset xfa.delete = "editusers.Delete" />
		<cfinclude template="qry_ListUsers.cfm" />
		<cfinclude template="dsp_List.cfm" />
		<cfset my.page.heading = "List All Users" />
		<cfset my.page.subheading = "I am a list of all users in this tool." />
		<cfset my.page.title = "#my.page.heading#" />
	</cfcase>

	<cfcase value="GetApp">
		<cfset xfa.GetUsername = "#fusebox.thisCircuit#.GetUsername" />
		<cfset xfa.GetApp = "#fusebox.thisCircuit#.GetApp" />
		<cfset xfa.Edit = "editusers.Edit" />
		<cfset xfa.delete = "editusers.Delete" />
		<cfinclude template="qry_AppInfo.cfm" />
		<cfinclude template="qry_GetApp.cfm" />
		<cfinclude template="dsp_List.cfm" />
		<cfset my.page.heading = "List All &quot;#qAppInfo.name#&quot; Users" />
		<cfset my.page.subheading = "I am a list of all users in the &quot;#qAppInfo.name#&quot; application." />
		<cfset my.page.title = "#my.page.heading#" />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>