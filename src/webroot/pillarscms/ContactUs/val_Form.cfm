<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

// name
	objForm.name.description = "Your Name";
	objForm.name.required=true;

// email
	objForm.email.description = "Your Email Address";
	objForm.email.validateEmail();
	objForm.email.required=true;

// comments
	objForm.comments.description = "Your Comments";
	objForm.comments.required=true;

// Buttons
	objForm.submitButton.addEvent("onClick","objForm.submit();");
</script>
</cfoutput>