<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="Menu">
		<cfset xfa.Menu1 = "tools.home">
		<cfset xfa.Menu2 = "pgList.home">
		<cfset xfa.Menu3 = "pgEdit.newPage">
		<cfset xfa.Menu4 = "pgEdit.newLink">
		<cfinclude template="dsp_Menu.cfm">
	</cfcase>

	<cfcase value="home">
		<cflocation url="#myself#pgList.home" addtoken="no">
		<cfset xfa.Menu1 = "tools.home">
		<cfset xfa.Menu2 = "pgList.home">
		<cfset xfa.Menu3 = "pgEdit.newPage">
		<cfset xfa.Menu4 = "gpEdit.newLink">
		<cfinclude template="dsp_Home.cfm">
		<cfset my.page.heading = "Welcome to the page editor">
		<cfset my.page.subheading = "">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>