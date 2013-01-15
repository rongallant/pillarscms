<cfoutput>
#ListScripts()#
<table cellpadding="2" cellspacing="2" width="100%">
	<tr>
		<td class="myFieldTitle">Title</td>
		<td class="myFieldTitle" align="center">Add to Menu</td>
		<td class="myFieldTitle" align="center">Edit</td>
	</tr>
	<cfif qCat.recordcount gt 0>
		<cfloop query="qCat">
			#ListFunctions(qCat.currentrow)#
			<tr #hoverCode#>
				<td><a href="#myself##xfa.ListEntries#&catid=#qCat.id#">#qCat.title#</a></td>
				<cfset linkurl = "#myself##xfa.DisplayCat#&catid=#qCat.id#"/>
				<cfset linkurlenc = URLEncodedFormat(linkurl)/>
				<td align="center"><a href="#myself##xfa.AddMenuLink#&linktitle=#URLEncodedFormat(qCat.title)#&linkurl=#linkurlenc#">Add To Menu</a></td>
				<td align="center"><a href="#myself##xfa.Edit#&catid=#qCat.id#"><img src="#my.design.folder##my.theme.folder#icons/iconedit.gif" alt="Edit" /></a></td>
			</tr>
		</cfloop>
	<cfelse>
		<tr>
			<td colspan="3"><p>There are no Categories.</p></td>
		</tr>
	</cfif>
	<tr>
		<td class="myFieldTitle" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="1" height="1" alt="" /></td>
		<td class="myFieldTitle" width="100"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="100" height="1" alt="" /></td>
		<td class="myFieldTitle" width="50"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1" alt="" /></td>
	</tr>
</table>
</cfoutput>