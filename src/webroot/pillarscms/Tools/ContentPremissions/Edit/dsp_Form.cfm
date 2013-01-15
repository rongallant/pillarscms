<cfimport prefix="sec" taglib="../../../" />
<cfimport prefix="tag" taglib="../../../tags/" />

<cfoutput>
<form action="#self#" method="POST" name="myForm">
	<input type="hidden" name="fuseaction" id="fuseaction" />
<cfif len(trim(qApp.appid))>
	<input type="hidden" name="appid" id="appid" value="#trim(qApp.appid)#" />
</cfif>
<table cellpadding="3" cellspacing="1" border="0" width="100%" class="TableBorder">
	<tr>
		<td id="FormHeader"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="150" alt="" /></td>
		<td id="FormHeader" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="1" alt="" /></td>
	</tr>
	<tr>
		<td id="FormHeader">Application ID:</td>
		<td height="35">
			<input type="text" name="identifier" id="identifier" size="35" maxlength="50" value="#trim(qApp.identifier)#" />
			(No spaces)
		</td>
	</tr>
	<tr>
		<td id="FormHeader">Application Name:</td>
		<td><input type="text" name="name" id="name" size="35" maxlength="35" value="#trim(qApp.name)#" /></td>
	</tr>
	<tr>
		<td id="FormHeader">Application URL</td>
		<td>
			<input type="text" name="path" id="path" size="50" maxlength="200" value="#trim(qApp.path)#" />
		</td>
	</tr>
	<tr>
		<td id="FormHeader">Description:</td>
		<td>
			<tag:textarea fieldname="description" fieldvalue="#trim(qApp.description)#" maxlength="256" />
		</td>
	</tr>
	<tr>
		<td id="FormHeader">Display link on Webutils:</td>
		<td>
			Yes <input type="Radio" name="Enabled" id="EnabledOn" value="1" <cfif qApp.Enabled eq 1>checked="checked"</cfif> />&nbsp;&nbsp;
			No <input type="Radio" name="Enabled" id="EnabledOff" value="0" <cfif qApp.Enabled neq 1>checked="checked"</cfif> />
		</td>
	</tr>
	<tr class="TDBackground">
		<td align="center" colspan="2">
			<cfif fusebox.fuseaction eq "New">
				<input type="button" name="Add" value="Add Entry" id="Add" style="cursor:hand;" />
			<cfelseif fusebox.fuseaction eq "Edit">
				<input type="button" name="Update" value="Update" id="Update" style="cursor:hand;" />
				
				<sec:security rights="700">
				<input type="button" name="Delete" value="Delete" id="Delete" style="cursor:hand;" />
				</sec:security>
			</cfif>
		</td>
	</tr>
</table>
</form>
</cfoutput>