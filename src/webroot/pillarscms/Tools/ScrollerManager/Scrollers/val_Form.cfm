<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

// name
	objForm.name.description = "Name";
	objForm.name.required=true;

// bgcolor
	objForm.bgcolor.description = "Background Color";
	objForm.bgcolor.required=true;
	objForm.bgcolor.validateLength(6,"alphanumeric");

// height
	objForm.height.description = "Height";
	objForm.height.required=true;
	objForm.height.validateNumeric()

// width
	objForm.width.description = "Width";
	objForm.width.required=true;
	objForm.width.validateNumeric()

// scrolltime
	objForm.scrolltime.description = "Scroll Time";
	objForm.scrolltime.required=true;
	objForm.scrolltime.validateNumeric()

// stoptime
	objForm.stoptime.description = "Stop Time";
	objForm.stoptime.required=true;
	objForm.stoptime.validateNumeric()

// notes
	objForm.notes.description = "Notes";
	objForm.notes.required=false;

// buttons
	<cfif fusebox.fuseaction eq "new">
		objForm.addButton.addEvent("onClick","setfuseaction('#xfa.Add#')");
	<cfelse>
		objForm.updateButton.addEvent("onClick","setfuseaction('#xfa.update#')");
		objForm.deleteButton.addEvent("onClick","DeleteEntry()");
		function DeleteEntry() {
			if(confirm("Are you sure you want to delete this?\nThis operation cannot be undone.")) {
				setfuseaction('#xfa.Delete#')
			}
		}
	</cfif>
</script>
</cfoutput>