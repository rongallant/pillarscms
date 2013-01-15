<cfimport prefix="sec" taglib="../../../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home,new">
		<sec:security rights="600" errorpage="#my.site.noauth#">
		<cfset xfa.delete = "#fusebox.thisCircuit#.deleteconfirm" />
		<cfinclude template="act_MinimizeScript.cfm" />
		<cfinclude template="qry_Blank.cfm" />
		<cfinclude template="dsp_Form.cfm" />
		<cfinclude template="val_Load.cfm" />
		<cfinclude template="val_Form.cfm" />
		<cfset my.page.heading = "New Application" />
		<cfset my.page.subheading = "Add a new application." />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="edit">
		<sec:security rights="500" errorpage="#my.site.noauth#">
		<cfset xfa.delete = "#fusebox.thisCircuit#.deleteconfirm" />
		<cfinclude template="qry_GetApp.cfm" />
		<cfinclude template="dsp_Form.cfm" />
		<cfinclude template="val_Load.cfm" />
		<cfinclude template="val_Form.cfm" />
		<cfset my.page.heading = "Edit &quot;#qApp.name#&quot;" />
		<cfset my.page.subheading = "Edit the &quot;#qApp.name#&quot; application entry." />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="errors">
		<cfset xfa.ListUsers = "ListUsers.getapp">
		<cfinclude template="dsp_Errors.cfm" />
		<cfset my.page.heading = "Error" />
		<cfset my.page.subheading = "Displays application error messages." />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="deleteconfirm">
		<sec:security rights="700" errorpage="#my.site.noauth#">
		<cfset xfa.edit = "#fusebox.thisCircuit#.edit" />
		<cfset xfa.delete = "#fusebox.thisCircuit#.delete" />
		<cfinclude template="qry_GetApp.cfm" />
		<cfinclude template="dsp_DeleteConfirm.cfm" />
		<cfset my.page.heading = "Delete Confirmation" />
		<cfset my.page.subheading = "Please read below information before deleting application" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

<!--- Action fuses --->
	<cfcase value="add">
		<sec:security rights="600" errorpage="#my.site.noauth#">
		<cfinclude template="qry_AddApp.cfm" />
		<cflocation url="#myself#ListApps.home" addtoken="no" />
	</cfcase>

	<cfcase value="update">	
		<sec:security rights="500" errorpage="#my.site.noauth#">
		<cfinclude template="qry_UpdateApp.cfm" />
		<cflocation url="#myself#ListApps.home" addtoken="no" />
	</cfcase>

	<cfcase value="delete">
		<sec:security rights="700" errorpage="#my.site.noauth#">
		<cfinclude template="qry_DeleteApp.cfm" />
		<cfif not isDefined('dontgo')>
			<cflocation url="#myself#ListApps.home" addtoken="no" />
		</cfif>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>