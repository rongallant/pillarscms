<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="new">
		<cfset xfa.Add = "#fusebox.thisCircuit#.add">
		<cfinclude template="qry_GetIssue.cfm">
		<cfinclude template="dsp_Form.cfm">
		<cfinclude template="val_Form.cfm">
		<cfset my.page.heading = "New Issue">
		<cfset my.page.subheading = "">
		<cfset my.page.heading = my.page.heading>
	</cfcase>

	<cfcase value="edit">
		<cfset xfa.Update = "#fusebox.thisCircuit#.update">
		<cfset xfa.Delete = "#fusebox.thisCircuit#.delete">
		<cfinclude template="dsp_Errors.cfm">
		<cfinclude template="qry_GetIssue.cfm">
		<cfinclude template="dsp_Form.cfm">
		<cfinclude template="val_Form.cfm">
		<cfset my.page.heading = "Edit Issue">
		<cfset my.page.subheading = "">
		<cfset my.page.heading = my.page.heading>
	</cfcase>

	<cfcase value="add">
		<cfinclude template="act_CreateDateTime.cfm">
		<cfinclude template="qry_Add.cfm">
		<cfset session.StartDateTime = attributes.StartDateTime>
		<cfset session.editor = attributes.editor>
		<cfset session.credits = attributes.credits>
		<cflocation url="#myself#listIssues.home" addtoken="no">
	</cfcase>

	<cfcase value="update">
		<cfinclude template="act_CreateDateTime.cfm">
		<cfinclude template="qry_Update.cfm">
		<cfset session.StartDateTime = attributes.StartDateTime>
		<cfset session.editor = attributes.editor>
		<cfset session.credits = attributes.credits>
		<cflocation url="#myself#listIssues.home" addtoken="no">
	</cfcase>

	<cfcase value="delete">
		<cfinclude template="qry_Delete.cfm">
		<cflocation url="#myself#listIssues.home" addtoken="no">
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch> 