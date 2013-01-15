<cfset request.qforms = 1 />
<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

// StartDate
	objForm.StartDateTime.description = "Start Date";
	objForm.StartDateTime.required=true;

// editor
	objForm.editor.description = "editor";
	objForm.editor.required = true;

// credits
	objForm.credits.description = "Credits";
	objForm.credits.required = false;

// notes
	objForm.notes.description = "Notes";
	objForm.notes.required=false;

// enabled
	objForm.enabled.description = "Enabled";
	objForm.enabled.required=true;

// Buttons
	<cfif fusebox.fuseaction eq "edit">
		function ConfirmDelete() {
			if ( confirm("Are you sure you want to delete '#DateFormat(qIssue.StartDateTime,'mm/dd/yyyy')#'") ) {
				setfuseaction('#xfa.Delete#');
			}
		}
		objForm.UpdateButton.addEvent("onClick","setfuseaction('#xfa.Update#');");
		objForm.DeleteButton.addEvent("onClick","ConfirmDelete();");
	<cfelse>
		objForm.AddButton.addEvent("onClick","setfuseaction('#xfa.Add#');");
	</cfif>
</script>
</cfoutput>