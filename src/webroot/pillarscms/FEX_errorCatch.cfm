<cfswitch expression="#fusebox.cfcatch.type#">

	<cfcase value="fusebox">
		<cfswitch expression="#fusebox.cfcatch.errorCode#">
			<cfcase value="8">
				<cfoutput>
					<p>We are sorry, there is no #cgi.server_name# page that matches your entry.</p>
					<p>#myself##fusebox.circuit#.<b>#fusebox.fuseaction#</b></p>
				</cfoutput>
			</cfcase>
			<cfcase value="9">
				<cfoutput>
					<p>We are sorry, there is no #cgi.server_name# page that matches your entry.</p>
					<p>#myself#<b>#fusebox.circuit#</b>.#fusebox.fuseaction#</p>
				</cfoutput>
			</cfcase>
			<cfdefaultcase>
				<cfinclude template="Errors/act_GenerateDetailedError.cfm" />
				<cfoutput>#ErrorMessageFull#</cfoutput>
			</cfdefaultcase>
		</cfswitch>
	</cfcase>

	<cfcase value="sec">
		<cfswitch expression="#fusebox.cfcatch.errorCode#">
			<cfcase value="1">
				<cflocation url="index.cfm?fuseaction=errors.noauth" addtoken="no" />
			</cfcase>
		</cfswitch>
	</cfcase>

	<cfcase value="HTTP">
		<cfswitch expression="#fusebox.cfcatch.errorCode#">
			<cfcase value="404">
				<cflocation url="index.cfm?fuseaction=errors.404" addtoken="no" />
			</cfcase>
		</cfswitch>
	</cfcase>

	<cfcase value="custom">
		<cfoutput>#fusebox.cfcatch.message#</cfoutput>
	</cfcase>

	<cfdefaultcase>
		<cfinclude template="Errors/act_GenerateDetailedError.cfm" />
		<cfoutput>#ErrorMessageFull#</cfoutput>
	</cfdefaultcase>

</cfswitch>