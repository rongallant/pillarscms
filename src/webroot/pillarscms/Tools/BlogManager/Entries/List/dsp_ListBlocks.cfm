<cfoutput>
<table cellpadding="2" cellspacing="2">
	<tr>
		<td class="myFieldTitle">Title</td>
		<td class="myFieldTitle" align="center">Select</td>
	</tr>
	<cfif qEntries.recordcount gt 0>
		<cfloop query="qEntries">
		<tr <cfif not qEntries.CurrentRow mod 2>class="myRow2"</cfif>>
			<td><a href="#myself##xfa.Edit#&entryid=#qEntries.entryid#" title="#qEntries.title#"><span <cfif qEntries.enabled eq 0>class="Disabled"</cfif>>#qEntries.title#</span></a></td>
			<td align="center">
				<cfset block = "#qEntries.title#|entryid=#qEntries.entryid#" />
				<cfset block = HTMLEncodedFormat(block) />
				<a href="#myself##xfa.SelectBlock#&block=#block#">Select</a>
			</td>
		</tr>
		</cfloop>
	<cfelse>
		<tr>
			<td colspan="3"><p>There are no entries.</p></td>
		</tr>
	</cfif>
	<tr>
		<td width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1"></td>
		<td width="50"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1"></td>
	</tr>
</table>
</cfoutput>