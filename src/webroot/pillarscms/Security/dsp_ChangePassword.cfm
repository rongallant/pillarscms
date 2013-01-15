<cfoutput>
	<form name="changePassword" id="changePasswordID" class="myForm" method="post" action="#self#">
		<input type="hidden" name="fuseaction" value="#xfa.UpdatePassword#" />
		<div class="myField">
			<label for="password">Username</label>
			<input type="text" name="username" id="usernameID" size="50" maxlength="256" />
		</div>
		<div class="myField">
			<label for="password">Password</label>
			<input type="password" name="password" id="passwordID" size="50" maxlength="256" />
		</div>
		<div class="myField">
			<label for="password">Again</label>
			<input type="password" name="password2" id="password2ID" size="50" maxlength="256" />
		</div>
		<div class="myButton">
			<input type="button" name="submitForm" id="submitFormID" value="Change Password" />
		</div>
	</form>
</cfoutput>