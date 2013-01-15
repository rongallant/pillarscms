<cfhtmlhead text=" #ListScripts()#">
<table cellpadding="2" cellspacing="2" border="0" width="100%">
	<tr>
		<td class="myFieldTitle">Name</td>
		<td class="myFieldTitle">Notes</td>
	</tr>
	<cfoutput query="qScrollers">
	#ListFunctions(qScrollers.currentrow)#
	<tr #hoverCode#>
		<td><a href="#myself##xfa.Edit#&scrollerid=#qScrollers.scrollerid#">#qScrollers.name#</a></td>
		<td>#qScrollers.notes#</td>
	</tr>
	</cfoutput>
	<cfif qScrollers.recordcount lt 1>
	<tr>
		<td colspan="2">
			<p style="font-weight:bold;">There are no qScrollers</p>
		</td>
	</tr>
	</cfif>
	<cfoutput>
	<tr>
		<td><img src="assets/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
		<td><img src="assets/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
	</tr>
	</cfoutput>
</table>