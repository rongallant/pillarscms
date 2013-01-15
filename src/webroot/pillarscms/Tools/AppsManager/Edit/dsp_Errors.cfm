<cfparam name="attributes.appid" default="">
<table cellpadding="3" cellspacing="0" border="0" width="100%" bgcolor="White">
	<tr>
		<td>
			<cfswitch expression="#attributes.errormsg#">
			
				<cfcase value="Constraints">
					<cfoutput>
						<p>You must have no users listed under this group.<br>
						<a href="#myself##xfa.ListUsers#&appid=#attributes.appid#">Do you want to remove them now?</a></p>
					</cfoutput>
				</cfcase>
			
				<cfdefaultcase>
					<p>Error</p>
				</cfdefaultcase>
			
			</cfswitch>
		</td>
	</tr>
</table>