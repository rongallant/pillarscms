<cfimport prefix="sec" taglib="../../../">
<cfswitch expression = "#fusebox.fuseaction#">

<!--- Displays --->
	<cfcase value="Create">
		<sec:security rights="600" errorpage="#my.site.noauth#">
		<cfset xfa.Add = "#fusebox.thisCircuit#.addfolder">
		<cfinclude template="dsp_CreateFolder.cfm">
		<cfinclude template="val_CreateFolder.cfm">
		<cfset my.page.heading = "Create Folder">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfcase value="Edit">
		<sec:security rights="500" errorpage="#my.site.noauth#" />
		<cfparam name="attributes.folder" type="string">
		<cfset xfa.Rename = "#fusebox.thisCircuit#.Rename">
		<cfset xfa.Move = "#fusebox.thisCircuit#.Move">
		<cfset xfa.Delete = "#fusebox.thisCircuit#.Delete">
		<cfinclude template="dsp_RenameFolder.cfm">
		<cfinclude template="val_RenameFolder.cfm">
		<sec:security rights="700">
			<cfinclude template="dsp_DeleteFolder.cfm">
			<cfinclude template="val_DeleteFolder.cfm">
		</sec:security>
		<cfset my.page.heading = "Edit Folder">
		<cfset my.page.title = my.page.heading>
	</cfcase>

<!--- Actions --->
	<cfcase value="Rename">
		<sec:security rights="500" errorpage="#my.site.noauth#">
		<cfparam name="attributes.folder" type="string">
		<cfparam name="attributes.newname" type="string">
		<cfinclude template="act_Rename.cfm">
		<cfif request.regerror eq 0>
			<cfset returnpath = listDeleteAt( attributes.folder, listlen(attributes.folder,"/"), "/" )>
			<cfif len(returnpath)><cfset returnpath = returnpath & "/"></cfif>
			<cflocation url="#myself#pgFileManager.home&filefolder=#returnpath#" addtoken="No">
		</cfif>
	</cfcase>

	<cfcase value="Delete">
		<sec:security rights="700" errorpage="#my.site.noauth#">
		<cfparam name="attributes.folder" type="string">
		<cfinclude template="act_Delete.cfm">
		<cfset returnpath = attributes.folder>
		<cfset returnpath = listDeleteAt( attributes.folder, listlen(attributes.folder,"/"), "/" ) & "/">
		<cflocation url="#myself#pgFileManager.home&filefolder=#returnpath#" addtoken="No">
	</cfcase>

	<cfcase value="AddFolder">
		<sec:security rights="600" errorpage="#my.site.noauth#">
		<cfparam name="attributes.folderparent" type="string">
		<cfparam name="attributes.foldername" type="string">
		<cfinclude template="act_Create.cfm">
		<cfif request.regerror eq 0>
			<cfset returnpath = attributes.folderparent & attributes.foldername & "/">
			<cflocation url="#myself#pgFileManager.home&filefolder=#returnpath#" addtoken="No">
		</cfif>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>