<cfimport prefix="sec" taglib="../../../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="edit">
		<sec:security rights="500">
		<cfset xfa.DeleteBlock = "#fusebox.thisCircuit#.delete" />
		<cfset xfa.ChangeOrder = "#fusebox.thisCircuit#.changeorder" />
		<cfset xfa.Submit = "#fusebox.thisCircuit#.GetListType" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="qry_GetBlockTypes.cfm" />
		<cfinclude template="qry_GetBlockLayouts.cfm" />
		<cfinclude template="qry_GetBlockLayoutAreas.cfm" />
		<cfinclude template="dsp_BlockForm.cfm" />
		<cfinclude template="val_BlockForm.cfm" />
		<cfset my.page.heading = "Add Block" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="GetListType">
		<sec:security rights="200">
		<cfset xfa.SelectBlock = "#fusebox.thisCircuit#.add" />
		<cfinclude template="#pathto('tags','cf')#formToHidden.cfm" />
		<cfinclude template="dsp_ListForm.cfm" />
	</cfcase>

	<cfcase value="selectBlogCatList">
		<sec:security rights="200">
		<cfset xfa.SelectBlock = "#fusebox.thisCircuit#.add" />
		<cfset xfa.DisplayBlock = "blog.categoryTitles" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="#pathto('tags','cf')#formToHidden.cfm" />
		<cfinclude template="qry_ListBlogCats.cfm" />
		<cfinclude template="dsp_ListBlogCats.cfm" />
		<cfset my.page.heading = " Category List" />
		<cfset my.page.subheading = "Select a category to display as a block." />
		<cfset my.page.heading = my.page.heading />
	</cfcase>

	<cfcase value="selectBlogCat">
		<sec:security rights="200">
		<cfset xfa.SelectBlock = "#fusebox.thisCircuit#.add" />
		<cfset xfa.DisplayBlock = "blog.category" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="#pathto('tags','cf')#formToHidden.cfm" />
		<cfinclude template="qry_ListBlogCats.cfm" />
		<cfinclude template="dsp_ListBlogCats.cfm" />
		<cfset my.page.heading = "Category Detailed" />
		<cfset my.page.subheading = "Select category to display as a block." />
		<cfset my.page.heading = my.page.heading />
	</cfcase>

	<cfcase value="selectBlogTopCats">
		<sec:security rights="200">
		<cfset xfa.SelectBlock = "#fusebox.thisCircuit#.add" />
		<cfset xfa.DisplayBlock = "blog.category" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="#pathto('tags','cf')#formToHidden.cfm" />
		<cfinclude template="qry_ListBlogCats.cfm" />
		<cfinclude template="dsp_selectBlogTopCats.cfm" />
		<cfset my.page.heading = "Category Detailed" />
		<cfset my.page.subheading = "Select category to display as a block." />
		<cfset my.page.heading = my.page.heading />
	</cfcase>

	<cfcase value="selectFinish">
		<sec:security rights="200">
		<cfset xfa.SelectBlock = "#fusebox.thisCircuit#.add" />
		<cfset xfa.DisplayBlock = "contact.home" />
		<cfinclude template="#pathto('tags','cf')#formToHidden.cfm" />
		<cfinclude template="dsp_selectFinish.cfm" />
		<script type="text/javascript">document.forms['myForm'].submit();</script>
		<cfset my.theme.layout = "none" />
	</cfcase>

	<cfcase value="selectNewsScroller">
		<sec:security rights="200">
		<cfset xfa.SelectBlock = "#fusebox.thisCircuit#.add" />
		<cfset xfa.DisplayBlock = "blog.category" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="#pathto('tags','cf')#formToHidden.cfm" />
		<cfinclude template="qry_NewsScroller.cfm" />
		<cfinclude template="dsp_NewsScroller.cfm" />
		<cfset my.page.heading = "Select News Scroller" />
		<cfset my.page.subheading = "" />
		<cfset my.page.heading = my.page.heading />
	</cfcase>

	<cfcase value="selectPage">
		<sec:security rights="200">
		<cfset xfa.SelectBlock = "#fusebox.thisCircuit#.add" />
		<cfset xfa.DisplayBlock = "pages.NoTitle" />
		<cfinclude template="#pathto('tags','cf')#formToHidden.cfm" />
		<cfinclude template="dsp_selectPage.cfm" />
		<cfset my.page.heading = "Select Page" />
		<cfset my.page.subheading = "Select a page from the drop down list that will be displayed in the selected block area." />
		<cfset my.page.heading = my.page.heading />
	</cfcase>

	<cfcase value="add">
		<sec:security rights="600">
		<cfinclude template="qry_GetBlockTypes.cfm" />
		<cfinclude template="qry_GetCatTitle.cfm" />
		<cfinclude template="qry_AddBlock.cfm" />
		<cflocation url="#myself#bmList.ListAll" addtoken="no" />
	</cfcase>

	<cfcase value="delete">
		<sec:security rights="700">
		<cfinclude template="qry_DeleteBlock.cfm" />
		<cflocation url="#myself#bmList.ListAll" addtoken="no" />
	</cfcase>

	<cfcase value="changeorder">
		<sec:security rights="500">
		<cfinclude template="qry_BlockList.cfm" />
		<cfinclude template="act_ChangeOrder.cfm" />
		<cflocation url="#myself#bmList.ListAll" addtoken="no" />
	</cfcase>

	<cfcase value="closewindow">
		<sec:security rights="200">
		<script type="text/javascript">window.close();</script>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>