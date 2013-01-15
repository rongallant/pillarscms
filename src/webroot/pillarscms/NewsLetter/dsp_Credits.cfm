<cfoutput>
<cfif ListLen(request.qIssue.creditslist)>
	<h5>Contributing Writers:</h5>
	<ul>
	<cfloop list="#request.qIssue.creditslist#" delimiters="|" index="i"><li>#trim(i)#</li></cfloop>
	</ul>
</cfif>
</cfoutput>