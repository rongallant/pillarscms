<cfimport prefix="sec" taglib="../../../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="new">
		<sec:security rights="600" errorpage="#my.site.noauth#">
		<cfset xfa.delete = "#fusebox.thisCircuit#.delete" />
		<cfinclude template="act_MinimizeScript.cfm" />
		<cfinclude template="qry_Get.cfm" />
		<cfinclude template="qry_GetPages.cfm" />
		<cfinclude template="dsp_Form.cfm" />
		<cfinclude template="val_Load.cfm" />
		<cfinclude template="val_Form.cfm" />
		<cfset my.page.heading = "New Group" />
		<cfset my.page.subheading = "Add a new group." />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="edit">
		<sec:security rights="500" errorpage="#my.site.noauth#">
		<cfparam name="attributes.groupid" type="guid" />
		<cfset xfa.delete = "#fusebox.thisCircuit#.delete" />
		<cfinclude template="qry_Get.cfm" />
		<cfinclude template="qry_GetPages.cfm" />
		<cfinclude template="dsp_Form.cfm" />
		<cfinclude template="val_Load.cfm" />
		<cfinclude template="val_Form.cfm" />
		<cfset my.page.heading = "Edit &quot;#qGroup.name#&quot;" />
		<cfset my.page.subheading = "Edit the &quot;#qGroup.name#&quot; group entry." />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="add">
		<sec:security rights="600" errorpage="#my.site.noauth#">
		<cfset attributes.groupid = createGUID() />
		<cfinclude template="qry_Add.cfm" />
		<cfinclude template="qry_AddPages.cfm" />
		<cflocation url="#myself#ListGroups.home" addtoken="no" />
	</cfcase>

	<cfcase value="update">	
		<sec:security rights="500" errorpage="#my.site.noauth#">
		<cfparam name="attributes.groupid" type="guid" />
		<cfinclude template="qry_Update.cfm" />
		<cfinclude template="qry_DeletePages.cfm" />
		<cfinclude template="qry_AddPages.cfm" />
		<cflocation url="#myself#ListGroups.home" addtoken="no" />
	</cfcase>

	<cfcase value="delete">
		<sec:security rights="700" errorpage="#my.site.noauth#">
		<cfset xfa.ListUsers = "ListUsers.getapp">
		<cfparam name="attributes.groupid" type="guid" />
		<cfinclude template="qry_DeletePages.cfm" />
		<cfinclude template="qry_Delete.cfm" />
		<cfif not isDefined('dontgo')>
			<cflocation url="#myself#ListGroups.home" addtoken="no" />
		</cfif>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>