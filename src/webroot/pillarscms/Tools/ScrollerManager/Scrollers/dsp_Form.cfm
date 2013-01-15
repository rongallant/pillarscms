<cfimport prefix="tag" taglib="../../../tags/" />

<table cellpadding="2" cellspacing="3" border="0" width="100%">
<cfoutput>
<form name="myForm" action="#self#" method="POST">
	<input type="hidden" name="fuseaction" id="fuseaction" />
	<cfif fusebox.fuseaction eq "edit">
		<input type="hidden" name="scrollerid" id="scrollerid" value="#qScroller.scrollerid#" />
	</cfif>
	<tr>
		<td class="myFieldTitle" width="150"><img src="assets/images/spacer.gif" height="1" width="150" border="0" alt="" /></td>
		<td class="myFieldTitle" width="100%"><img src="assets/images/spacer.gif" height="1" width="100" border="0" alt="" /></td>
	</tr>
	<tr>
		<td class="myFieldTitle">Name</td>
		<td><input type="Text" name="name" id="name" value="#HTMLEditFormat(qScroller.name)#" maxlength="100" /></td>
	</tr>
	<tr>
		<td class="myFieldTitle">Size</td>
		<td>
			Height <input type="Text" name="height" id="height" value="#my.form.height#" maxlength="3" size="5" />
			<img src="assets/images/spacer.gif" height="1" width="10" border="0" alt="" />
			Width <input type="Text" name="width" id="width" value="#my.form.width#" maxlength="3" size="5" />
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle">Scroll Time (seconds) - time from bottom to top</td>
		<td><input type="Text" name="scrolltime" id="scrolltime" value="#my.form.scrolltime#" maxlength="2" size="5" /></td>
	</tr>
	<tr>
		<td class="myFieldTitle">Stop Time (seconds) - pause to read</td>
		<td><input type="Text" name="stoptime" id="stoptime" value="#my.form.stoptime#" maxlength="2" size="5" /></td>
	</tr>
	<tr>
		<td class="myFieldTitle">Background Color (Hexidecimal - no pound)</td>
		<td>
		<input type="Text" name="bgcolor" id="bgcolor" value="#my.form.bgcolor#" maxlength="6" /></td>
	</tr>
	<tr>
		<td class="myFieldTitle">Notes - not shown on site</td>
		<td><tag:textarea fieldname="notes" fieldvalue="#qScroller.notes#" maxlength="256" /></td>
	</tr>
	<tr>
		<td width="100"><img src="assets/images/spacer.gif" height="1" width="100" border="0" alt="" /></td>
		<td width="100%" align="right">
			<cfif fusebox.fuseaction eq "new">
				<input type="Button" name="addButton" id="addButton" value="Add Scroller" class="myButton" />
			<cfelse>
				<input type="Button" name="updateButton" id="updateButton" value="Update Scroller" class="myButton" />
				<input type="Button" name="deleteButton" id="deleteButton" value="Delete Scroller" class="myButton" />
			</cfif>
		</td>
	</tr>
</form>
</cfoutput>
</table>