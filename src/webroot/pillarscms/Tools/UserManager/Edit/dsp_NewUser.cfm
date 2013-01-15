<cfoutput>
<form name="myForm" action="#self#" method="POST">
<input type="Hidden" name="fuseaction" value="#xfa.Submit#"/>
<table cellpadding="3" cellspacing="1" border="0" width="100%" class="TableBorder">
	<tr>
		<td id="FormHeader"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="150"/></td>
		<td id="FormHeader" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="1"/></td>
	</tr>
	<tr>
		<td id="FormHeader">User Name</td>
		<td>
			<input type="Text" name="usrid" size="30" maxlength="8" />
			<div>Please enter the User Name of the new user. I will then<br /> check to see if the user exists in the database.</div>
		</td>
	</tr>
	<tr class="TDBackground">
		<td align="center" colspan="2">
			<input type="submit" name="checkusername" value="Submit" id="buttons" style="cursor:hand;"/>
		</td>
	</tr>
</table>
</form>
</cfoutput>