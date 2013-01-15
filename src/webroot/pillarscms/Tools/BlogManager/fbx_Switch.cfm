<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="menu">
		<cfset xfa.Menu1 = "tools.home">
		<cfset xfa.Menu2 = "BlogListEntries.home">
		<cfset xfa.Menu3 = "BlogEditEntries.new">
		<cfset xfa.Menu4 = "BlogListCategories.home">
		<cfset xfa.Menu5 = "BlogEditCategories.new">
		<cfinclude template="dsp_Menu.cfm">
	</cfcase>

	<cfcase value="home">
		<cflocation url="#myself#BlogListEntries.home" addtoken="no"/>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8"/>
	</cfdefaultcase>

</cfswitch>