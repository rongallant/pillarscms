<cfimport prefix="fb" taglib="../../../../">
<cfimport prefix="sec" taglib="../../../../">
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<sec:security rights="200">
		<cfset xfa.Edit = "BlogEditEntries.edit">
		<cfif isDefined('attributes.searchwarning') and attributes.searchwarning eq 1>
			<fb:fusebox fuseaction="SearchManager.AskToUpdateSearch" layout="none"/>
		</cfif>
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="qry_List.cfm">
		<cfinclude template="dsp_List.cfm">
		<cfif len(trim(qEntries.cat))>
			<cfset my.page.heading = "List Entries for ( #qEntries.cat# )">
		<cfelse>
			<cfset my.page.heading = "List Entries">
		</cfif>
		<cfset my.page.subheading = "Select an entry below to edit.">
		<cfset my.page.heading = my.page.heading>
	</cfcase>

	<cfcase value="selectblock">
		<sec:security rights="200">
		<cfinclude template="qry_ListBlocks.cfm">
		<cfinclude template="dsp_ListBlocks.cfm">
		<cfset my.page.heading = "Select an entry to display as a block.">
		<cfset my.page.subheading = "">
		<cfset my.page.heading = my.page.heading>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>