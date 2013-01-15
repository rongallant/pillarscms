<cfset request.qforms = 1 />
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");
// Add events to the buttons
	objForm.Update.addEvent("onclick", "objForm.submit();");
</script>