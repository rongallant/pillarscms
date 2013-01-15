<cfif thisTag.ExecutionMode eq "start">
	<cfoutput>
		<p>Date Printed: #DateFormat(now(),"mmmm d, yyyy")#: #TimeFormat(now(),"hh:mm TT")#</p>
	</cfoutput>
</cfif>