<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="menu">
		<cfset xfa.Menu1 = "email.contact" />
		<cfset xfa.Menu2 = "email.request" />
		<cfinclude template="dsp_Menu.cfm" />
	</cfcase>

	<cfcase value="home">
		<cfset xfa.RequestEmail = "email.request" />
		<cfinclude template="qry_GetApps.cfm" />
		<cfinclude template="act_BuildAppArray.cfm" />
		<cfinclude template="dsp_AppMenu.cfm" />
		<cfset my.page.title = "Home" />
		<cfset my.page.heading = "Hello #my.user.fname#" />
		<cfset my.page.subheading = "Select an application below to begin managing your site." />
	</cfcase>

	<cfcase value="NotAuth">
		<cfinclude template="dsp_NotAuth.cfm" />
		<cfset my.page.heading = "Not Authorized" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>