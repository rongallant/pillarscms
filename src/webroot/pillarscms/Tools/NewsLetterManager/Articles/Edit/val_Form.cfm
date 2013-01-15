<cfset request.qforms = 1 />
<cfoutput>
<script type="text/javascript">
	// initialize the qForm object
	objForm = new qForm("myForm");

	// qForm settings
	qFormAPI.errorColor = "red";

	// issue
	objForm.issue.description = "issue";
	objForm.issue.required=true;

	// title
	objForm.title.description = "title";
	objForm.title.required=true;

	// content
	objForm.content.description = "content";
	objForm.content.required=false;

	// Buttons
	<cfif fusebox.fuseaction eq "edit">
		function ConfirmDelete() {
			if ( confirm("Are you sure you want to delete '#JSStringFormat(qArticle.title)#'") ) {
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