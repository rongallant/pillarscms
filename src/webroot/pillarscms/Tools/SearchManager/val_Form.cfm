<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

// CollectionName
	objForm.CollectionName.description = "Collection Namentent";
	objForm.CollectionName.required=true;

// fuseaction
	objForm.fuseaction.description = "Action";
	objForm.fuseaction.required=true;

// Buttons
	objForm.submitForm.addEvent("onClick","objForm.submit();");
</script>
</cfoutput>