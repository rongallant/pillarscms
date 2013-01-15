<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="menu">
		<cfset xfa.Menu1 = "tools.home">
		<cfset xfa.Menu2 = "listIssues.home">
		<cfset xfa.Menu3 = "editIssues.new">
		<cfset xfa.Menu4 = "editArticles.new">
		<cfinclude template="dsp_Menu.cfm">
	</cfcase>
	
	<cfcase value="home">
		<cflocation url="#myself#listIssues.home" addtoken="no">
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>