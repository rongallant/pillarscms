<cfimport prefix="sec" taglib="../../../../"/>
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="new">
		<sec:security rights="600">
		<cfset xfa.add = fusebox.thisCircuit & ".add"/>
		<cfinclude template="qry_Get.cfm"/>
		<cfinclude template="dsp_Form.cfm"/>
		<cfinclude template="val_Form.cfm"/>
		<cfset my.page.heading = "New Entry"/>
		<cfset my.page.subheading = "Fill in the fields and click 'Add Entry'"/>
		<cfset my.page.title = my.page.heading/>
	</cfcase>

	<cfcase value="edit">
		<sec:security rights="500">
		<cfset xfa.update = "#fusebox.thisCircuit#.update" />
		<cfset xfa.delete = "#fusebox.thisCircuit#.delete" />
		<cfset xfa.frontpage = "blog.entry" />
		<cfinclude template="qry_Get.cfm"/>
		<cfinclude template="dsp_Form.cfm"/>
		<cfinclude template="val_Form.cfm"/>
		<cfset my.page.heading = "Edit Entry"/>
		<cfset my.page.subheading = "Fill in the fields and click 'Update Entry'"/>
		<cfset my.page.title = my.page.heading/>
	</cfcase>

	<cfcase value="add">
		<sec:security rights="600">
		<cfset attributes.entryid = CreateGUID()/>
		<cfinclude template="qry_Add.cfm"/>
		<cfinclude template="qry_DeleteEntryCats.cfm"/>
		<cfinclude template="qry_AddEntryCats.cfm"/>
		<cflocation url="#myself#BlogListEntries.home&searchwarning=1" addtoken="no"/>
	</cfcase>

	<cfcase value="update">
		<sec:security rights="500">
		<cfinclude template="qry_Update.cfm">
		<cfinclude template="qry_DeleteEntryCats.cfm"/>
		<cfinclude template="qry_AddEntryCats.cfm"/>
		<cflocation url="#myself#BlogListEntries.home&searchwarning=1" addtoken="no"/>
	</cfcase>

	<cfcase value="delete">
		<sec:security rights="700">
		<cfinclude template="qry_Delete.cfm">
		<cflocation url="#myself#BlogListEntries.home&searchwarning=1" addtoken="no"/>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8"/>
	</cfdefaultcase>

</cfswitch>