<cfswitch expression="#fusebox.cfcatch.type#">

	<cfcase value="custom">
		<cfoutput>
			<div style="margin:30px;">
				<p style="font:bold;color:red;">#fusebox.cfcatch.message#</p>
				<p><a href="javascript:history.back();">&lt;&lt;Back</a></p>
			</div>
		</cfoutput>
	</cfcase>

	<cfdefaultcase>
		<cfset fusebox.rethrowerror = 1>
	</cfdefaultcase>

</cfswitch>