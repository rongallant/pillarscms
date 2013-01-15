<cfset request.qforms = 1 />
<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

// usrid Field
	objForm.usrid.description="User Name";
	objForm.required("usrid");

// fuseaction
	objForm.password.description = "Password";
	objForm.password.required = true;
	objForm.password.validateSame('password2');
	
	objForm.password2.description = "Password Again";
	objForm.password2.required = true;
	
	objForm.firstname.description = "First Name";
	objForm.firstname.required = true;
	
	objForm.lastname.description = "Last Name";
	objForm.lastname.required = true;
	
	objForm.email.description = "Email";
	objForm.email.required = false;
	objForm.email.validateEmail();
	
	objForm.phone.description = "Phone Number";
	objForm.phone.required = false;
	objForm.phone.validatePhoneNumber();

// Buttons
	objForm.submitForm.addEvent("onClick","objForm.submit();");	
</script>
</cfoutput>