<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="new">
		<sec:security rights="600">
		<cfset xfa.Add = "#fusebox.thisCircuit#.add">
		<cfinclude template="qry_Get.cfm">
		<cfinclude template="dsp_Form.cfm">
		<cfinclude template="val_Form.cfm">
		<cfset my.page.heading = "New Category">
		<cfset my.page.subheading = "">
		<cfset my.page.heading = my.page.heading>
	</cfcase>

	<cfcase value="edit">
		<sec:security rights="500">
		<cfset xfa.Update = "#fusebox.thisCircuit#.update">
		<cfset xfa.Delete = "#fusebox.thisCircuit#.delete">
		<cfinclude template="dsp_Errors.cfm">
		<cfinclude template="qry_Get.cfm">
		<cfinclude template="dsp_Form.cfm">
		<cfinclude template="val_Form.cfm">
		<cfset my.page.heading = "Edit Category">
		<cfset my.page.subheading = "">
		<cfset my.page.heading = my.page.heading>
	</cfcase>

	<cfcase value="add">
		<sec:security rights="600">
		<cfset catid = CreateGUID()/>
		<cfinclude template="qry_Add.cfm"/>
		<cflocation url="#myself#BlogListCategories.home" addtoken="no"/>
	</cfcase>

	<cfcase value="update">
		<sec:security rights="500">
		<cfinclude template="qry_Update.cfm">
		<cflocation url="#myself#BlogListCategories.home" addtoken="no"/>
	</cfcase>

	<cfcase value="delete">
		<sec:security rights="700">
		<cfinclude template="qry_Delete.cfm">
		<cflocation url="#myself#BlogListCategories.home" addtoken="no"/>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8"/>
	</cfdefaultcase>

</cfswitch> 