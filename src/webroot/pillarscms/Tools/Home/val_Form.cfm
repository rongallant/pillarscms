<script language="JavaScript">
// initialize the qForm object
	objForm = new qForm("myForm");

// make these fields required
	objForm.required("Username, LastName, FirstName, Gender, Height");

// Define the field messages
	objForm.FirstName.description = "First Name";

/* START Completion Information Section */
// if the IsCompleted is selected, then you must fill in next 2 fields
	objForm.IsCompleted.createDependencyTo("DateCompleted", "CompletedBy", "FacilitiesComments");
	objForm.IsCompleted.description = "Is Completed";

	<cfif trim(myQuery.IsCompleted) eq "Y">
		objForm.DateCompleted.disabled(false);
		objForm.CompletedBy.disabled(false);
		objForm.FacilitiesComments.disabled(false);
	<cfelse>
		objForm.DateCompleted.disabled(true);
		objForm.CompletedBy.disabled(true);
		objForm.FacilitiesComments.disabled(true);
	</cfif>

// run the "GetIsCompleted()" function everytime an option is clicked
// the false option makes sure the GetIsCompleted() function is called immediately
	objForm.IsCompleted.addEvent("onclick", "GetIsCompleted();", false);

// if form value is 'y' enable Dependant fields
function GetIsCompleted() {
	var value = objForm.IsCompleted.getValue();
		// if the option "IsCompleted" is selected, then enable the OUworkmansClaimNumber
		// field, otherwise disable it
	if( value == "Y" ){
		// enable the OUworkmansClaimNumber field
		objForm.DateCompleted.disabled(false);
		objForm.CompletedBy.disabled(false);
		objForm.FacilitiesComments.disabled(false);
		} else {
		// disable the OUworkmansClaimNumber field
		objForm.DateCompleted.disabled(true);
		objForm.CompletedBy.disabled(true);
		objForm.FacilitiesComments.disabled(true);
		}
	}
</script>