<cfimport prefix="fb" taglib="../../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="category">
		<cfset xfa.Detail = "#fusebox.thisCircuit#.entry" />
		<cfset xfa.edit = "BlogEditEntries.edit" />
		<cfinclude template="qry_Category.cfm" />
		<cfinclude template="dsp_Category.cfm" />
		<cfset my.page.heading = qCat.cat />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="categoryList">
		<cfset xfa.Detailed = "#fusebox.thisCircuit#.entry" />
		<cfset xfa.edit = "BlogEditEntries.edit" />
		<cfinclude template="qry_CategoryTitles.cfm" />
		<cfinclude template="dsp_CategoryTitles.cfm" />
		<cfset my.page.heading = qCat.cat />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="categoryHistory">
		<cfset xfa.Detailed = "#fusebox.thisCircuit#.entry" />
		<cfset xfa.edit = "BlogEditEntries.edit" />
		<cfinclude template="qry_CategoryHistory.cfm" />
		<cfinclude template="dsp_CategoryHistory.cfm" />
		<cfset my.page.heading = qCat.cat />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="topcats">
		<cfset xfa.Detailed = "#fusebox.thisCircuit#.entry" />
		<cfset xfa.edit = "BlogEditEntries.edit" />
		<cfinclude template="qry_TopCats.cfm" />
		<cfinclude template="dsp_TopCats.cfm" />
		<cfset my.page.heading = attributes.blocktitle />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="entry">
		<cfset xfa.edit = "BlogEditEntries.edit" />
		<cfinclude template="qry_Entry.cfm" />
		<cfinclude template="dsp_Entry.cfm" />
		<cfset entrydate = DateFormat(qEntry.date,"mmmm d, yyyy") />
		<cfset my.page.heading = "#qEntry.title# <span class='smallheading'>#entrydate#</span>" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="preview">
		<sec:security rights="200" thisapp="blogmanager">
		<cfinclude template="qry_PreviewEntry.cfm" />
		<cfinclude template="dsp_Entry.cfm" />
		<cfset my.page.heading = request.qStory.title />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>