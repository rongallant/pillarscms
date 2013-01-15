<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="menu">
		<cfset xfa.Menu1 = "tools.home" />
		<cfset xfa.Menu2 = "listGroups.home" />
		<cfset xfa.Menu3 = "editGroups.new" />
		<cfinclude template="dsp_Menu.cfm" />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>