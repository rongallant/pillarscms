<cfimport prefix="tag" taglib="../../../tags/">

<table cellpadding="3" cellspacing="3" border="0" width="100%">
<cfoutput>
<form name="myForm" action="#self#" method="POST">
	<input type="hidden" name="fuseaction" id="fuseaction" />
	<input type="hidden" name="entryid" id="entryid" value="#qEntry.entryid#" />
	<tr>
		<td class="myFieldTitle">Scroller</td>
		<td>
			<cfif fusebox.fuseaction eq "New">
				<input type="hidden" name="scrollerid" id="scrollerid" value="#attributes.scrollerid#" />
			<cfelseif fusebox.fuseaction eq "Edit">
				<input type="hidden" name="scrollerid" id="scrollerid" value="#qEntry.scrollerid#" />
			</cfif>
			<p style="font:bold 16px;">#qScroller.name#</p>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle">Link Text</td>
		<td><input type="text" name="linktext" id="linktext" value="#HTMLEditFormat(qEntry.linktext)#" size="60" maxlength="256" /></td>
	</tr>
	<tr>
		<td class="myFieldTitle">Link URL</td>
		<td><input type="text" name="linkurl" id="linkurl" value="#HTMLEditFormat(qEntry.linkurl)#" size="50" maxlength="256" /></td>
	</tr>
	<tr>
		<td class="myFieldTitle">Link Target</td>
		<td>
			<select name="linktarget" id="linktarget">
				<option value="_top" <cfif qEntry.linktarget eq "_top">selected="selected"</cfif>>This Window</option>
				<option value="_blank" <cfif qEntry.linktarget eq "_blank">selected="selected"</cfif>>New Window</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle">Font</td>
		<td>
			 font<select name="txtfont" id="txtfont">
				<option value="arial" <cfif qEntry.txtfont eq "arial">selected="selected"</cfif>>Arial</option>
				<option value="times new roman" <cfif qEntry.txtfont eq "times new roman">selected="selected"</cfif>>Times New Roman</option>
			</select>
			<img src="assets/images/spacer.gif" height="1" width="10" border="0" alt="" />
			 size<select name="txtsize" id="txtsize">
				<option value="11" <cfif qEntry.txtsize eq "11">selected="selected"</cfif>>11</option>
				<option value="12" <cfif qEntry.txtsize eq "12">selected="selected"</cfif>>12</option>
				<option value="13" <cfif qEntry.txtsize eq "13">selected="selected"</cfif>>13</option>
				<option value="14" <cfif qEntry.txtsize eq "14" or qEntry.txtsize eq "">selected="selected"</cfif>>14</option>
				<option value="15" <cfif qEntry.txtsize eq "15">selected="selected"</cfif>>15</option>
				<option value="16" <cfif qEntry.txtsize eq "16">selected="selected"</cfif>>16</option>
			</select>
			<img src="assets/images/spacer.gif" height="1" width="10" border="0" alt="" />
			color<select name="txtcolor" id="txtcolor">
				<option value="000000" <cfif qEntry.txtcolor eq "000000">selected="selected"</cfif>>Black</option>
				<option value="0090DD" <cfif qEntry.txtcolor eq "0090DD">selected="selected"</cfif>>Pillar Blue</option>
				<option value="000080" <cfif qEntry.txtcolor eq "000080">selected="selected"</cfif>>Navy Blue</option>
				<option value="808080" <cfif qEntry.txtcolor eq "808080">selected="selected"</cfif>>Gray</option>
				<option value="bdb76b" <cfif qEntry.txtcolor eq "bdb76b">selected="selected"</cfif>>Khaki</option>
				<option value="3cb371" <cfif qEntry.txtcolor eq "3cb371">selected="selected"</cfif>>Green</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle">Font Style</td>
		<td>
			bold<input type="checkbox" name="txtbold" id="txtbold" value="1" <cfif qEntry.txtbold eq 1>checked="checked"</cfif> />
			<img src="assets/images/spacer.gif" height="1" width="10" border="0" alt="" />
			italic<input type="checkbox" name="txtitalic" id="txtitalic" value="1" <cfif qEntry.txtitalic eq 1>checked="checked"</cfif> />
			<img src="assets/images/spacer.gif" height="1" width="10" border="0" alt="" />
			underline<input type="checkbox" name="txtunderline" id="txtunderline" value="1" <cfif qEntry.txtunderline eq 1>checked="checked"</cfif> />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<cfif fusebox.fuseaction eq "new">
				<input type="button" class="buttons" style="cursor:hand;" name="Add" id="Add" value="Add" />
			<cfelseif fusebox.fuseaction eq "Edit">
				<input type="button" class="buttons" style="cursor:hand;" name="Update" id="Update" value="Update" />
				<input type="button" class="buttons" style="cursor:hand;" name="Delete" id="Delete" value="Delete" />
			</cfif>
		</td>
	</tr>
	<tr>
		<td width="100"><img src="assets/images/spacer.gif" height="1" width="100" border="0" alt="" /></td>
		<td width="100%"><img src="assets/images/spacer.gif" height="1" width="100" border="0" alt="" /></td>
	</tr>
</cfoutput>
</form>
</table>