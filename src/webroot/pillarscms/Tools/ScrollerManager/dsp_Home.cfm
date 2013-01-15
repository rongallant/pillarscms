<cfhtmlhead text="#ListScripts()#" />
<cfoutput>
	<table cellpadding="3" cellspacing="3" border="0" width="100%">
		<tr>
			<td class="myFieldTitle" width="200">Name</td>
			<td class="myFieldTitle">Description</td>
			<td class="myFieldTitle" width="50">Edit</td>
		</tr>
		<cfloop query="qScrollers">
			#ListFunctions(qScrollers.currentrow)#
			<tr #hoverCode#>
				<td><a href="#myself##xfa.SetPage#&scrollerid=#qScrollers.scrollerid#" title="Edit Entries">#qScrollers.name#</a></td>
				<td>#qScrollers.notes#</td>
				<td align="center">
					<a href="#myself##xfa.EditScroller#&scrollerid=#qScrollers.scrollerid#"><img src="#my.design.folder##my.theme.folder#icons/iconedit.gif" width="16" height="17" width="150" height="1" border="0" alt="Edit #qScrollers.name#" /></a>
				</td>
			</tr>
		</cfloop>
		<tr>
			<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="200" height="1" border="0" alt="" /></td>
			<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
			<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="50" height="1" border="0" alt="" /></td>
		</tr>
	</table>
</cfoutput>