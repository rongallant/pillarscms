<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

//  name
	objForm.name.description = "Name";
	objForm.name.required = true;

//  email
	objForm.emailaddress.description = "Email Address";
	objForm.emailaddress.required = true;
	objForm.emailaddress.validateEmail();

//  area
	objForm.area.description = "Area";
	objForm.area.required = true;

// Add events to the buttons
	objForm.submitButton.addEvent("onclick", "objForm.submit();", false);
	objForm.resetButton.addEvent("onclick", "objForm.reset();", false);
//-->
</script>
</cfoutput>