<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfset xfa.ListArticles = "listArticles.home">
		<cfset xfa.EditIssue = "editIssues.edit">
		<cfinclude template="qry_ListIssues.cfm">
		<cfinclude template="dsp_ListIssues.cfm">
		<cfset my.page.heading = "List Issues">
		<cfset my.page.subheading = "Select a date below to see it's current articles.">
		<cfset my.page.heading = my.page.heading>
	</cfcase>

	<cfdefaultcase>
		<cfoutput>
	       I received a fuseaction called <b>"#fusebox.fuseaction#"</b> that
		   circuit <b>"#fusebox.circuit#"</b> doesn't have a handler for.
		</cfoutput>
	</cfdefaultcase>

</cfswitch> 