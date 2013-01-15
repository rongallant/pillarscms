<cfoutput>
	<form name="myForm" action="#self#" method="post">
		<input type="hidden" name="fuseaction" id="fuseaction" value="#xfa.SelectBlock#" />
		<input type="hidden" name="blockfuseaction" id="blockfuseaction" value="#xfa.DisplayBlock#" />
		#formToHidden("fuseaction,fieldnames,submitButton,blockfuseaction")#
		<table cellpadding="3" cellspacing="3" border="0">
			<tr>
				<td width="100" id="FormHeader"><img src="assets/images/spacer.gif" width="100" height="1" border="0" alt="" /></td>
				<td width="100%" id="FormHeader"><img src="assets/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
			</tr>
			<tr>
				<td id="FormHeader"><label for="blockidlist">Page</label></td>
				<td>
					<cfimport prefix="menu" taglib="../../ContentEditor/menus/">
					<select name="blockidlist" id="blockidlist">
						<menu:select start="2" currentpage="1" dsn="#my.db.dsn#" tableprefix="#my.db.tablePrefix#">
					</select>
				</td>
			</tr>
			<tr>
				<td id="FormHeader"><img src="assets/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
				<td id="FormHeader" align="right"><input type="submit" name="submitButton" id="submitButton" value="Add Block" class="myButton" /></td>
			</tr>
		</table>
	</form>
</cfoutput>