<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

// folderparent
	objForm.folderparent.required = false;

// foldername
	objForm.foldername.required = true;
	objForm.foldername.validateReqEx(/^\w{1,}$/,"You must use only alpha numeric characters. Use underscores instead of spaces.");

// SubmitButton
	objForm.addButton.addEvent("onClick","setfuseaction('#xfa.Add#');");
</script>
</cfoutput>