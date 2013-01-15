<!---<cfimport prefix="fb" taglib="../">
<cfif not isDefined('application.my.currentIssue') or ( application.my.currentIssue neq request.qStory.startdate )>
	<cflock scope="application" type="exclusive" timeout="60">
		<cfset application.my.currentIssue = request.qStory.startdate>
		<fb:fusebox fuseaction="SearchManager.Update" layout="none">
	</cflock>
</cfif>--->