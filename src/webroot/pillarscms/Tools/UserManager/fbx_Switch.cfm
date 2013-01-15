<cfswitch expression="#fusebox.fuseaction#">

	<cfcase value="home">
		<cflocation url="#myself#ListUsers.home" addtoken="no">
	</cfcase>

	<cfcase value="Menu">
		<cfset xfa.Menu1 = "tools.home">
		<cfset xfa.Menu2 = "listusers.home">
		<cfset xfa.Menu3 = "editusers.NewUser">
		<cfinclude template="dsp_Menu.cfm">
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>