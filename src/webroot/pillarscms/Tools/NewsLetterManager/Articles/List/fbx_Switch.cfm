<cfimport prefix="fb" taglib="../../../../" />
<cfimport prefix="sec" taglib="../../../../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<sec:security rights="200">
		<cfset xfa.ChangeOrder = "#fusebox.thisCircuit#.ChangeOrder" />
		<cfset xfa.Edit = "editArticles.edit" />
		<cfif isDefined('attributes.searchwarning') and attributes.searchwarning eq 1>
			<fb:fusebox fuseaction="SearchManager.AskToUpdateSearch" layout="none"/>
		</cfif>
		<cfinclude template="act_CreateIssueCookie.cfm" />
		<cfinclude template="qry_ListArticles.cfm" />
		<cfinclude template="dsp_ListArticles.cfm" />
		<cfset my.page.heading = "List Articles" />
		<cfset my.page.subheading = "Select an artical below to edit." />
		<cfset my.page.heading = my.page.heading />
	</cfcase>

	<cfcase value="ChangeOrder">
		<sec:security rights="500">
		<cfinclude template="act_ChangeOrder.cfm">
		<cflocation url="#myself#listArticles.home&issueid=#attributes.issueid#" addtoken="no"/>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>