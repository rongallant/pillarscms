<cfimport prefix="sec" taglib="../../../">

<table cellpadding="3" cellspacing="2" border="0" width="100%">
<cfoutput>
<form name="myForm" action="#self#" method="post">
	<input type="Hidden" name="fuseaction" value="#xfa.UpdateApp#">
	<input type="Hidden" name="usrid" value="#attributes.usrid#">
	<input type="Hidden" name="appid" value="#attributes.appid#">
	<tr id="FormHeader">
		<td><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="100"></td>
		<td width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="150"></td>
	</tr>
	<tr>
		<td id="FormHeader">Group</td>
		<td><b>#qGetApp.name#</b></td>
	</tr>
	<tr>
		<td id="FormHeader">Permissions</td>
		<td>
			<select name="Permissions" id="textsmall1">
				<option <cfif qGetApp.Permissions eq 0>selected</cfif> value="0">None</option>
				<option <cfif qGetApp.Permissions eq 100>selected</cfif> value="100">Overview</option>
				<option <cfif qGetApp.Permissions eq 200>selected</cfif> value="200">Read</option>
				<option <cfif qGetApp.Permissions eq 300>selected</cfif> value="300">Comment</option>
				<option <cfif qGetApp.Permissions eq 400>selected</cfif> value="400">Moderate</option>
				<option <cfif qGetApp.Permissions eq 500>selected</cfif> value="500">Edit</option>
				<sec:security rights="600">
					<option <cfif qGetApp.Permissions eq 600>selected</cfif> value="600">Add</option>
				</sec:security>
				<sec:security rights="700">
					<option <cfif qGetApp.Permissions eq 700>selected</cfif> value="700">Delete</option>
				</sec:security>
				<sec:security rights="800">
					<option <cfif qGetApp.Permissions eq 800>selected</cfif> value="800">Admin</option>
				</sec:security>
			</select>
		</td>
	</tr>
	<tr>
		<td id="FormHeader">Notes</td>
		<td>
			<cfmodule template="#pathto('tags','cf')#textarea.cfm" fieldname="notes" fieldvalue="#qGetApp.notes#" />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="Button" name="Update" value="Update" id="buttons" style="cursor:hand;">
		</td>
	</tr>
</form>
</cfoutput>
</table>