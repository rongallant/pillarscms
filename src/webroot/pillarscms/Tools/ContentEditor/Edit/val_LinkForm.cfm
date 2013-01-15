<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
<!--//

// initialize the qForm object
	objForm = new qForm("myForm");

// qForm settings
	qFormAPI.errorColor = "red";

// parentid
	objForm.parentid.description = "Parent";
	objForm.parentid.required = true;

// pgTitle
	objForm.pgTitle.description = "Title";
	objForm.pgTitle.required = true;

// pgLinkUrl
	objForm.pgLinkUrl.description = "Link Url";
	objForm.pgLinkUrl.required = true;

// pgNotes
	objForm.pgNotes.description = "Notes";

// Buttons
<cfif fusebox.fuseaction eq "newLink">
		objForm.AddButton.addEvent("onClick","setfuseaction('#xfa.Add#');");
	<cfelse>
		function ConfirmDelete() {
			if ( confirm("Are you sure you want to delete '#qPage.pg_title#'") ) {
				setfuseaction('#xfa.Delete#');
			}
		}
		objForm.UpdateButton.addEvent("onClick","setfuseaction('#xfa.Update#');");
		objForm.DeleteButton.addEvent("onClick","ConfirmDelete();");
	</cfif>

//-->
</script>
</cfoutput>