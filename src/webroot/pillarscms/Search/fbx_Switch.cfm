<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="form">
		<cfset xfa.SearchResults = "#fusebox.thisCircuit#.searchresults" />
		<cfinclude template="dsp_Search.cfm" />
		<cfinclude template="val_SearchForm.cfm" />
		<cfset my.page.heading = "Search" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="searchresults">
		<cfparam name="attributes.stage" default="pub" />
		<cfparam name="attributes.criteria" default="" />
		<cfparam name="attributes.startrow" default="1" />
		<cfparam name="attributes.maxrows" default="10" />
		<cfset xfa.Pages = "pages.home" />
		<cfset xfa.Newsletter = "NewsLetter.home" />
		<cfset search  = application.my.searchengine.search(attributes.criteria,attributes.startrow) />
		<cfinclude template="dsp_Results.cfm" />
		<cfset my.page.heading = "Document Matches #attributes.startrow# - #search.status.lastrow# of #search.status.found#" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>