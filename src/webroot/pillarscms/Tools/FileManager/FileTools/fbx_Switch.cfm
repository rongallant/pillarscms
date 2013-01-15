<cfimport prefix="sec" taglib="../../../">
<cfswitch expression = "#fusebox.fuseaction#">

<!--- Displays --->
	<cfcase value="Select">
		<sec:security rights="600" errorpage="#my.site.noauth#">
		<cfset xfa.Upload = "#fusebox.thisCircuit#.Upload">
		<cfinclude template="dsp_Upload.cfm">
		<cfinclude template="val_Upload.cfm">
		<cfset my.page.heading = "Upload File">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfcase value="Edit">
		<sec:security rights="500" errorpage="#my.site.noauth#">
		<cfset xfa.rename = "#fusebox.thisCircuit#.Rename">
		<cfset xfa.move = "#fusebox.thisCircuit#.Move">
		<cfset xfa.delete = "#fusebox.thisCircuit#.Delete">
		<cfinclude template="dsp_Edit.cfm">
		<cfinclude template="val_Edit.cfm">
		<cfset my.page.heading = "Edit File">
		<cfset my.page.title = my.page.heading>
	</cfcase>

<!--- Actions --->
	<cfcase value="Upload">
		<sec:security rights="600" errorpage="#my.site.noauth#">
		<cfparam name="attributes.folderparent" type="string">
		<cfparam name="form.filename" type="string">
		<cfinclude template="act_Upload.cfm">
		<cfif request.regerror eq 0>
			<cfset returnpath = URLEncodedFormat(attributes.folderparent)>
			<cflocation url="#myself#pgFileManager.home&filefolder=#returnpath#" addtoken="No">
		</cfif>
	</cfcase>

	<cfcase value="Rename">
		<sec:security rights="500" errorpage="#my.site.noauth#">
		<cfparam name="attributes.filename" type="string">
		<cfinclude template="act_Rename.cfm">
		<cfif request.regerror eq 0>
			<cfset returnpath = attributes.filename>
			<cfif listlen(returnpath,"/") gt 1>
				<cfset returnpath = ListDeleteAt( returnpath, listlen(returnpath,"/"), "/" ) & "/">
			<cfelse>
				<cfset returnpath = "">
			</cfif>
			<cflocation url="#myself#pgFileManager.home&filefolder=#returnpath#" addtoken="No">
		</cfif>
	</cfcase>

	<cfcase value="Move">
		<sec:security rights="600" errorpage="#my.site.noauth#">
		<cfparam name="attributes.filename" type="string">
		<cfparam name="attributes.move" type="string">
		<cfinclude template="act_Move.cfm">
		<cfset returnpath = URLEncodedFormat(attributes.move)>
		<cflocation url="#myself#pgFileManager.home&filefolder=#returnpath#" addtoken="No">
	</cfcase>

	<cfcase value="Delete">
		<sec:security rights="700" errorpage="#my.site.noauth#">
		<cfparam name="attributes.filename" type="string">
		<cfinclude template="act_Delete.cfm">
		<cfset returnpath = attributes.filename>
		<cfif listlen(returnpath,"/") gt 1>
			<cfset returnpath = ListDeleteAt( returnpath, listlen(returnpath,"/"), "/" ) & "/">
		<cfelse>
			<cfset returnpath = "">
		</cfif>
		<cflocation url="#myself#pgFileManager.home&filefolder=#returnpath#" addtoken="No">
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>