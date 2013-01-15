<cfimport prefix="sec" taglib="../../../">
<cfimport prefix="tag" taglib="../../../tags/">

<cfoutput>
<form name="myForm" action="#self#" method="post">
	<input type="hidden" name="fuseaction" id="fuseaction" />
	
	<table cellpadding="3" cellspacing="1" border="0" width="100%" class="TableBorder">
		<tr>
			<td id="FormHeader"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="150" alt="" /></td>
			<td id="FormHeader" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="1" alt="" /></td>
		</tr>
		<tr>
			<td id="FormHeader">User Name:</td>
			<td><input type="text" name="usrid" id="usrid" maxlength="8" value="#trim(attributes.usrid)#" readonly="true" /></td>
		</tr>
		<tr>
			<td id="FormHeader">Password:</td>
			<td><input type="text" name="password" id="password" size="32" maxlength="32" /> Only to add or change password</td>
		</tr>
		<tr>
			<td id="FormHeader">Password Again:</td>
			<td><input type="text" name="password2" id="password2" size="32" maxlength="32" /></td>
		</tr>
		<tr>
			<td id="FormHeader">First Name:</td>
			<td><input type="text" name="firstname" id="firstname" value="#my.user.firstname#" size="50" maxlength="256" /></td>
		</tr>
		<tr>
			<td id="FormHeader">Last Name:</td>
			<td><input type="text" name="lastname" id="lastname" value="#my.user.lastname#" size="50" maxlength="256" /></td>
		</tr>
		<tr>
			<td id="FormHeader">Phone Number:</td>
			<td><input type="text" name="phone" id="phone" value="#oUtils.formatPhoneNumber(my.user.phone, 'dashes')#" size="14" maxlength="14" /></td>
		</tr>
		<tr>
			<td id="FormHeader">Email:</td>
			<td><input type="text" name="email" id="email" value="#my.user.email#" size="50" maxlength="256" /></td>
		</tr>
		<tr>
			<td id="FormHeader">Notes:</td>
			<td><tag:textarea fieldname="Notes" fieldvalue="#trim(getMessages.notes)#" maxlength="2000" /></td>
		</tr>
		<tr>
			<td id="FormHeader">Enabled:</td>
			<td><input type="checkbox" name="Enabled" id="Enabled" value="1" <cfif getMessages.enabled eq 1>checked="checked"</cfif>/></td>
		</tr>
		<tr>
			<td id="FormHeader"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="150" /></td>
			<td width="100%" align="right">
				<cfif fusebox.fuseaction eq "New">
					<input type="button" name="Add" value="Add Entry" id="buttons" style="cursor:hand;" />
				<cfelseif fusebox.fuseaction eq "EditUser">
					<input type="button" name="Update" value="Update" id="buttons" style="cursor:hand;" />
					<sec:security rights="700">
					<input type="button" name="Delete" value="Delete" id="buttons" style="cursor:hand;" />
					</sec:security>
				</cfif>
			</td>
		</tr>
	</table>
</form>
</cfoutput>