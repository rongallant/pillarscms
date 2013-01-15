<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cflocation url="#myself#ListApps.home" addtoken="no">
	</cfcase>

	<cfcase value="menu">
		<cfset xfa.Menu1 = "tools.home">
		<cfset xfa.Menu2 = "admin.home">
		<cfset xfa.Menu3 = "listapps.home">
		<cfset xfa.Menu4 = "editapps.new">
		<cfinclude template="dsp_Menu.cfm">
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>