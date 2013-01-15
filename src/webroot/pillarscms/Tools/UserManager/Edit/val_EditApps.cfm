<cfset request.qforms = 1 />
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

// fields
	// myapps Field
	objForm.myapps.description="My Applications";
	objForm.required("myapps");
	objForm.myapps.container="true";

	// transferTo Field
	objForm.transferTo.addEvent("onclick", "objForm.appid.transferTo('myapps');", false);
	
	// transferFrom Field
	objForm.transferFrom.addEvent("onclick", "objForm.appid.transferFrom('myapps');", false);

// Add events to the buttons
	objForm.Update.addEvent("onclick", "objForm.submit();");
</script>