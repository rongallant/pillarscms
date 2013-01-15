<cfset request.qforms = 1>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("changePassword");

	objForm.username.description = "User Name";
	objForm.username.required = true;

	objForm.password.description = "Password";
	objForm.password.required = true;
	objForm.password.validatePassword('password2', 4, 256);
	
	objForm.password2.description = "Password 2";
	objForm.password2.required = true;

// Buttons
	objForm.submitForm.addEvent("onClick", "objForm.submit();");
</script>