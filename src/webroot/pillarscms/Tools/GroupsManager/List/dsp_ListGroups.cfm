<cfoutput>
#ListScripts()#
<table cellpadding="2" cellspacing="2" border="0" width="100%">
	<tr>
		<th class="myFieldTitle">Group</th>
	</tr>
		<cfif qGroups.recordcount>
			<cfloop query="qGroups">
				<cfscript>
					tmp = ListFunctions(qGroups.currentrow);
				</cfscript>
				<tr #hoverCode# onClick="window.location='#myself##xfa.Edit#&groupid=#qGroups.groupid#';" class="#thisClass#">
					<td style="cursor:hand;"><strong>#qGroups.groupname#</strong></td>
				</tr>
			</cfloop>
		<cfelse>
			<tr>
				<td><p>There are no entries.</p></td>
			</tr>
		</cfif>
	<tr>
		<td class="myFieldTitle" width="100%"><img src="assets/images/spacer.gif" width="150" height="1" alt="" /></td>
	</tr>
</table>
</cfoutput>