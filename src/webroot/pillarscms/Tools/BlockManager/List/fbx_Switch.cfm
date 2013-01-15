<cfimport prefix="sec" taglib="../../../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="listAll">
		<sec:security rights="200">
		<cfset xfa.DeleteBlock = "bmEdit.delete" />
		<cfset xfa.ChangeOrder = "bmEdit.changeorder" />
		<cfset xfa.AddBlock = "bmEdit.edit" />
		<cfset xfa.PageBlocks = "#fusebox.thisCircuit#.listPage" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="qry_ListAllBlocks.cfm" />
		<cfinclude template="dsp_ListAllBlocks.cfm" />
		<cfset my.page.heading = "List All Blocks" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="listPage">
		<sec:security rights="200">
		<cfset xfa.DeleteBlock = "bmEdit.delete" />
		<cfset xfa.ChangeOrder = "bmEdit.changeorder" />
		<cfset xfa.AddBlock = "bmEdit.edit" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="qry_GetBlocks.cfm" />
		<cfinclude template="dsp_BlockList.cfm" />
		<cfset my.page.heading = "Blocks on #qBlocks.pagetitle#" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>