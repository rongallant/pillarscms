<cfimport prefix="sec" taglib="../../">
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="menu">
		<cfset xfa.Menu1 = "tools.home">
		<cfset xfa.Menu2 = "pgFileManager.home">
		<cfset xfa.Menu3 = "FileTools.Select">
		<cfset xfa.Menu4 = "FolderTools.create">
		<cfinclude template="dsp_Menu.cfm">
	</cfcase>

	<cfcase value="Home">
		<sec:security rights="200">
		<cfset xfa.RenameFile = "FileTools.Rename">
		<cfset xfa.DeleteFile = "FileTools.Delete">
		<cfset xfa.ViewImage = "#fusebox.thisCircuit#.ViewImage">
		<cfinclude template="dsp_Home.cfm">
		<cfset my.page.heading = "Browse">
		<cfset my.page.subheading = request.subheading>
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>