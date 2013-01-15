<cfoutput>
<form name="newBlocks" action="#self#" method="post">
	<input type="hidden" name="fuseaction" id="fuseaction" value="#xfa.Submit#" />
<table cellpadding="2" cellspacing="2" border="0">
	<tr>
		<td class="myFieldTitle" width="150"><img src="assets/images/spacer.gif" height="1" width="150" border="0" alt="" /></td>
		<td class="myFieldTitle" width="100%"><img src="assets/images/spacer.gif" height="1" width="1" border="0" alt="" /></td>
	</tr>
	<tr>
		<td class="myFieldTitle" align="right"><label for="blocktype">Block Title</label></td>
		<td><input type="text" name="blocktitle" id="blocktitle" size="50" maxlength="128" /></td>
	</tr>
	<tr>
		<td class="myFieldTitle" align="right"><label for="blocktype">Block Type</label></td>
		<td>
			<select name="blocktypeid" id="blocktype">
				<option value=""></option>
				<cfloop query="qBlockTypes">
					<option value="#qBlockTypes.blocktypeid#">#qBlockTypes.displayname#</option></cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle" align="right"><label for="blocklayout">Display Block on</label></td>
		<td>
			<cfimport prefix="menu" taglib="../../ContentEditor/menus/">
			<select name="displaypageid" id="displaypageid">
				<option value="">All Pages</option>
				<menu:select parent="1" currentpage="1" dsn="#my.db.dsn#" tableprefix="#my.db.tablePrefix#">
			</select>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle" align="right"><label for="layoutarea">Page Area</label></td>
		<td>
			<select name="layoutarea" id="layoutarea">
				<option value=""></option>
				<cfloop query="qBlockLayoutAreas">
					<option value="#qBlockLayoutAreas.name#">#qBlockLayoutAreas.displayname#</option></cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle" align="right"><label for="blocklayout">Layout</label></td>
		<td>
			<select name="blocklayout" id="blocklayout">
				<option value="none">none (no layout)</option>
				<cfloop query="qBlockLayouts">
					<option value="#qBlockLayouts.name#">#qBlockLayouts.displayname#</option></cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle" colspan="2" align="right">
			<input type="submit" name="submitButton" id="submitButton" class="myButton" value="Add Block" /></td>
	</tr>
</table>
</form>
</cfoutput>