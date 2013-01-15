<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="menu">
		<cfset xfa.Menu1 = "tools.home">
		<cfset xfa.Menu2 = "bmList.ListAll">
		<cfset xfa.Menu3 = "bmEdit.edit">
		<cfset xfa.Menu4 = "">
		<cfinclude template="dsp_Menu.cfm" />
	</cfcase>

	<cfcase value="home">
		<cflocation url="#myself#bmList.ListAll" addtoken="no" />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>