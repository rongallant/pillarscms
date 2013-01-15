<cfoutput>
#ListScripts()#
<table cellpadding="2" cellspacing="2">
	<tr>
		<td class="myFieldTitle">Title</td>
		<td class="myFieldTitle" align="center">Date</td>
		<td class="myFieldTitle" align="center">Edit</td>
		<td class="myFieldTitle" align="center">Enabled</td>
	</tr>
	<cfif qEntries.recordcount gt 0>
		<cfloop query="qEntries">
			#ListFunctions(qEntries.currentrow)#
			<tr #hoverCode#>
				<td><a href="#myself##xfa.Edit#&entryid=#qEntries.entryid#" title="#qEntries.title#"><span <cfif qEntries.enabled eq 0>class="Disabled"</cfif>>#qEntries.title#</span></a></td>
				<td align="center">
					<cfif len(qEntries.lu_ts)>
						#DateFormat(qEntries.lu_ts,"mm/dd/yyyy")#
						#TimeFormat(qEntries.lu_ts,"HH:mm:ss tt")#
					<cfelse>
						#DateFormat(qEntries.cr_ts,"mm/dd/yyyy")#
						#TimeFormat(qEntries.cr_ts,"HH:mm:ss tt")#
					</cfif>
				</td>
				<td align="center"><a href="#myself##xfa.Edit#&entryid=#qEntries.entryid#"><img src="#my.design.folder##my.theme.folder#icons/iconedit.gif" alt="Edit" /></a></td>
				<td align="center">
					<cfif qEntries.enabled eq 1>
						<img src="#my.design.folder##my.theme.folder#icons/iconcheckmark.gif" alt="Enabled" />
					<cfelse>
						<img src="#my.design.folder##my.theme.folder#icons/icondelete.gif" alt="Disabled" />
					</cfif>
				</td>
			</tr>
		</cfloop>
	<cfelse>
		<tr>
			<td colspan="3"><p>There are no entries.</p></td>
		</tr>
	</cfif>
	<tr>
		<td width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1" alt="" /></td>
		<td width="170"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="170" height="1" alt="" /></td>
		<td width="50"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1" alt="" /></td>
		<td width="50"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1" alt="" /></td>
	</tr>
</table>
</cfoutput>