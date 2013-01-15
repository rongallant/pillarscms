<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
<!--//

// initialize the qForm object
	objForm = new qForm("myForm");

// title
	objForm.title.description = "Title";
	objForm.title.required=true;

// shorttext
	objForm.shorttext.description = "Description (Short)";
	//objForm.shorttext.required=true;


// longtext
	objForm.longtext.description = "Description (Long)";
	objForm.longtext.required=false;

// categories
	objForm.categories.description = "Categories";
	objForm.categories.required=true;

// Buttons
	<cfif fusebox.fuseaction eq "edit">
		function ConfirmDelete() {
			if ( confirm("Are you sure you want to delete '#JSStringFormat(qEntry.title)#'") ) {
				setfuseaction('#xfa.Delete#');
			}
		}
		objForm.UpdateButton.addEvent("onClick","setfuseaction('#xfa.Update#');");
		objForm.DeleteButton.addEvent("onClick","ConfirmDelete();");
	<cfelse>
		objForm.AddButton.addEvent("onClick","setfuseaction('#xfa.Add#');");
	</cfif>

//-->
</script>
</cfoutput>