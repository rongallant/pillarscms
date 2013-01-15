<cftry>
	<!--- I am the start of the error message --->
	<cfoutput>
		<ul>
			<li><b>Date:</b> #DateFormat(now(),"mmmm dd, yyyy")# at #TimeFormat(now(),"hh:mm:ss tt")#</li>
		</ul>
		<cfset debugList = "cfcatch,attributes,application,url,form,cookie,client,cgi">
		<cfset debugList = "cfcatch">
		<cfloop list="#debugList#" index="i">
			<cftry>
				<cfset tmp = evaluate(i)>
				<div style="margin:5px;"><cfdump var="#tmp#" label="#i#"></div>
				<cfcatch>
					<div id="text">#i# does not exist</div>
				</cfcatch>
			</cftry>
		</cfloop>
	</cfoutput>
	<cfcatch>
		<cfif  isDefined('request.my.app.mode') and ListContains("1,2,3",request.my.app.mode)>
			<cfdump var="#cfcatch#" label="cfcatch">
		</cfif>
	</cfcatch>

</cftry>