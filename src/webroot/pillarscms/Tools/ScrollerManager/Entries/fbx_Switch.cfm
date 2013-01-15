<cfimport prefix="sec" taglib="../../../">

<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="Menu">
		<cfset xfa.Menu1 = "tools.home">
		<cfset xfa.Menu2 = "scroll.home">
		<cfset xfa.Menu3 = "#fusebox.thisCircuit#.list">
		<cfset xfa.Menu4 = "#fusebox.thisCircuit#.new">
		<cfinclude template="dsp_Menu.cfm">
	</cfcase>

	<cfcase value="List">
		<sec:security rights="200">
		<cfset xfa.edit = "#fusebox.thisCircuit#.Edit" />
		<cfset xfa.delete = "#fusebox.thisCircuit#.Delete" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="qry_ScrollerName.cfm" />
		<cfinclude template="qry_Entries.cfm" />
		<cfinclude template="dsp_List.cfm" />
		<cfset my.page.heading = "#qScroller.name# - Scroller Messages" />
		<cfset my.page.subheading = "This section is for reviewing entries that are on the selected news scroller." />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="New">
		<sec:security rights="600">
		<cfset xfa.Add = "#fusebox.thisCircuit#.Add">
		<cfinclude template="qry_ScrollerName.cfm">
		<cfinclude template="qry_Get.cfm">
		<cfinclude template="dsp_Edit.cfm">
		<cfinclude template="val_Edit.cfm">
		<cfinclude template="val_Load.cfm">
		<cfset my.page.heading = "#qScroller.name# - New Message">
		<cfset my.page.subheading = "This section allows you to add a new entry to your scroller.">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfcase value="Edit">
		<sec:security rights="500">
		<cfset xfa.Delete = "#fusebox.thisCircuit#.Delete">
		<cfset xfa.Update = "#fusebox.thisCircuit#.Update">
		<cfinclude template="qry_ScrollerName.cfm">
		<cfinclude template="qry_Get.cfm">
		<cfinclude template="dsp_Edit.cfm">
		<cfinclude template="val_Load.cfm">
		<cfinclude template="val_Edit.cfm">
		<cfset my.page.heading = "#qScroller.name# - Edit Message">
		<cfset my.page.subheading = "This section allows you to edit the selected entry.">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfcase value="Add">
		<sec:security rights="600">
		<cfset attributes.entryid = CreateGUID() />
		<cfinclude template="qry_Add.cfm" />
		<cflocation url="#myself##fusebox.thisCircuit#.list&scrollerid=#attributes.scrollerid#" addtoken="no" />
	</cfcase>

	<cfcase value="Update">
		<sec:security rights="500">
		<cfinclude template="qry_Update.cfm">
		<cflocation url="#myself##fusebox.thisCircuit#.list&scrollerid=#attributes.scrollerid#" addtoken="no">
	</cfcase>

	<cfcase value="Delete">
		<sec:security rights="700">
		<cfinclude template="qry_Delete.cfm">
		<cflocation url="#myself##fusebox.thisCircuit#.list&scrollerid=#attributes.scrollerid#" addtoken="no">
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>
	
</cfswitch>