<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

// filename
	objForm.filename.required = true;

// SubmitButton
	objForm.SubmitButton.addEvent('onClick','objForm.submit();');
</script>
</cfoutput>