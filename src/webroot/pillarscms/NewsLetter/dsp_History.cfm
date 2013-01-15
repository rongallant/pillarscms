<div id="HistoryPage">

<cfif qHistory.recordcount gt 0>
	<cfoutput query="qHistory" group="startyear">
		<h2>#qHistory.startyear#</h2>
		<ul>
			<cfoutput>
			<li><a href="#myself##xfa.GetIssue#&issue=#qHistory.issueid#"><strong>#DateFormat(qHistory.startdate,'mmmm')#</strong></a> - #qHistory.title#</li></cfoutput>
		</ul>
	</cfoutput>
<cfelse>
	<cfoutput>
		<p>There are no past issues.</p>
	</cfoutput>
</cfif>

</div>