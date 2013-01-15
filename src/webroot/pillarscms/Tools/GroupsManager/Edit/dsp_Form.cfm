<cfimport prefix="sec" taglib="../../../" />
<cfimport prefix="tag" taglib="../../../tags/" />

<cfset request.groupid = qGroup.groupid />

<cfoutput>
<form action="#self#" method="POST" name="myForm">
	<input type="hidden" name="fuseaction" id="fuseaction" />
	<cfif len(trim(qGroup.groupid))>
		<input type="hidden" name="groupid" id="groupid" value="#trim(qGroup.groupid)#" />
	</cfif>
	<table cellpadding="3" cellspacing="1" border="0" width="100%" class="TableBorder">
		<tr>
			<td id="FormHeader"><img src="assets/images/spacer.gif" height="1" width="150" alt="" /></td>
			<td id="FormHeader" width="100%"><img src="assets/images/spacer.gif" height="1" width="1" alt="" /></td>
		</tr>
		<tr>
			<td id="FormHeader">Group Name:</td>
			<td><input type="text" name="name" id="name" size="35" maxlength="35" value="#trim(qGroup.name)#" /></td>
		</tr>
		<tr>
			<td id="FormHeader">Group Description:</td>
			<td>
				<cfimport prefix="tag" taglib="../../../tags" />
				<tag:textarea fieldname="description" fieldvalue="#trim(qGroup.description)#" maxlength="2000" />
			</td>
		</tr>
		<tr>
			<td class="FormHeader" colspan="2">Pages</td>
		</tr>
		<tr>
			<td colspan="2">
				<cfimport prefix="menu" taglib="./" />
				<table cellpadding="3" cellspacing="3" border="0">
					<tr>
						<td class="myFieldTitle">Name</td>
						<td class="myFieldTitle" align="center">Homepage</td>
						<td class="myFieldTitle" align="center">Page Type</td>
						<td class="myFieldTitle" align="center">Active</td>
					</tr>
					<menu:TableSelectList
						dsn="#my.db.dsn#"
						page="#myself#pgEdit.edit"
						startmenu="1"
						tableprefix="#my.db.tablePrefix#"
						submenu="yes"
						showdisabled="yes"
						currentvalue=""
					/>
					<tr>
						<td class="myFieldTitle" width="100%"><img src="assets/images/spacer.gif" width="1" height="1" alt="" /></td>
						<td class="myFieldTitle" width="100"><img src="assets/images/spacer.gif" width="100" height="1" alt="" /></td>
						<td class="myFieldTitle" width="100"><img src="assets/images/spacer.gif" width="100" height="1" alt="" /></td>
						<td class="myFieldTitle" width="100"><img src="assets/images/spacer.gif" width="100" height="1" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr class="TDBackground">
			<td align="right" colspan="2">
				<cfif fusebox.fuseaction eq "New">
					<input type="button" name="Add" value="Add Entry" id="Add" class="myButton" />
				<cfelseif fusebox.fuseaction eq "Edit">
					<input type="button" name="Update" value="Update" id="Update" class="myButton" />
					<sec:security rights="700">
						<input type="button" name="Delete" value="Delete" id="Delete" class="myButton" />
					</sec:security>
				</cfif>
			</td>
		</tr>
	</table>
</form>
</cfoutput>