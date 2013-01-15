<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

// 
	objForm..description = "";
	objForm..required=true;

// Buttons
	<cfif fusebox.fuseaction eq "edit">
		function ConfirmDelete() {
			if ( confirm("Are you sure you want to delete '#JSStringFormat(qPage.pg_title)#'") ) {
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