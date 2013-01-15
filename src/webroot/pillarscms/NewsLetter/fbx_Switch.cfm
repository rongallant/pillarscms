<cfimport prefix="fb" taglib="../" />
<cfimport prefix="sec" taglib="../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="GetStory">
		<cfinclude template="qry_GetStory.cfm" />
		<cfinclude template="qry_GetIssue.cfm" />
	</cfcase>

	<cfcase value="home">
		<cfset xfa.ViewStory = fusebox.thisCircuit & ".home" />
		<cfset xfa.PrintStory = fusebox.thisCircuit & ".print" />
		<cfset xfa.PrintAll = fusebox.thisCircuit & ".printall" />
		<cfset xfa.EditPage = "editArticles.edit" />
		<cfinclude template="dsp_Story.cfm" />
		<cfinclude template="act_UpdateSearchResults.cfm" />
		<cfparam name="attributes.pageid" default="" />
		<fb:fusebox fuseaction="#fusebox.thisCircuit#.NavBar" pageid="#attributes.pageid#" layout="none">
		<cfset my.page.heading = request.qStory.title />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="preview">
		<sec:security rights="200" thisapp="NewsLetterManager">
		<cfset xfa.ViewStory = fusebox.thisCircuit & ".home" />
		<cfset xfa.PrintStory = fusebox.thisCircuit & ".print" />
		<cfset xfa.PrintAll = fusebox.thisCircuit & ".printall" />
		<cfset xfa.EditPage = "editArticles.edit" />
		<cfinclude template="qry_GetStoryPreview.cfm" />
		<cfinclude template="qry_GetIssue.cfm" />
		<cfinclude template="dsp_Story.cfm" />
		<cfinclude template="act_UpdateSearchResults.cfm" />
		<cfset my.page.heading = request.qStory.title />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="print">
		<cfinclude template="dsp_Story.cfm" />
		<cfset my.page.heading = request.qStory.title />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="printall">
		<cfif request.qStory.recordcount gt 0>
			<cfinclude template="qry_GetFullIssue.cfm" />
			<cfloop query="request.qStory">
				<cfinclude template="dsp_Story.cfm" />
			</cfloop>
			<cfset my.page.heading = "All stories for #DateFormat(request.qStory.startdate,'mmmm d, yyyy')#" />
		<cfelse>
			<cfset my.page.heading = "All stories" />
			<cfoutput><p>There are no stories</p></cfoutput>
		</cfif>
		<cfset my.page.title = my.page.heading />
		<cfset my.theme.layout = "print" />
	</cfcase>

	<cfcase value="archives">
		<cfset xfa.ViewStory = fusebox.thisCircuit & ".home" />
		<cfset xfa.PrintStory = fusebox.thisCircuit & ".print" />
		<cfset xfa.PrintAll = fusebox.thisCircuit & ".printall" />
		<cfset xfa.getissue = fusebox.thisCircuit & ".home" />
		<cfset attributes.story = 1 />
		<cfinclude template="qry_History.cfm" />
		<cfinclude template="dsp_History.cfm" />
		<cfset my.page.heading = "Previous Issues" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="mainmenu">
		<cfset xfa.Menu1 = fusebox.thisCircuit & ".home" />
		<cfset xfa.Menu2 = fusebox.thisCircuit & ".archives" />
		<cfset xfa.Menu3 = fusebox.thisCircuit & ".print" />
		<cfset xfa.Menu4 = fusebox.thisCircuit & ".printall" />
		<cfset xfa.Menu5 = fusebox.thisCircuit & ".home" />
		<cfinclude template="dsp_MainMenu.cfm" />
	</cfcase>

	<cfcase value="menu">
		<cfset xfa.ViewStory = fusebox.thisCircuit & ".home" />
		<cfinclude template="dsp_LeftMenu.cfm" />
	</cfcase>

	<cfcase value="NavBar">
		<cfset xfa.ViewStory = fusebox.thisCircuit & ".home" />
		<cfset xfa.PrintStory = fusebox.thisCircuit & ".print" />
		<cfset xfa.PrintAll = fusebox.thisCircuit & ".printall" />
		<cfset xfa.EditPage = "editArticles.edit" />
		<cfinclude template="dsp_NavBar.cfm" />
	</cfcase>

	<cfcase value="credits">
		<cfinclude template="dsp_Credits.cfm" />
	</cfcase>

	<cfcase value="footer">
		<cfset xfa.History = fusebox.thisCircuit & ".archives" />
		<cfinclude template="dsp_Footer.cfm" />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>