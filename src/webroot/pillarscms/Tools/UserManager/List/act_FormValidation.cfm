<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="act_FormValidation" language="ColdFusion">
	<history author="Ron Gallant" role="FuseCoder" email="ron@rongallant.com" type="create" date="2001-11-12"/>
	<responsibilities>
		I set up the validation for the form using the qForm API.
	</responsibilities>
	<io>
		<in>
			<recordset name="myQuery" format="CFML">
		</in>
	</io>
</fusedoc>
--->

<script type="text/javascript">
<!--//

// initialize the qForm object
	objForm = new qForm("myForm");

// qForm settings
	qFormAPI.errorColor = "red";
	
// make these fields required
	objForm.required("Username, LastName, FirstName, Gender, Height");

// Define the field messages
	objForm.FirstName.description = "First Name";

// Validate fields
	//objForm.DateCompleted.validate = true;
	//objForm.DateCompleted.validateDate("dd/mm/yyyy");
	//objForm.DateCompleted.description = "Date Completed By";


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
/* END Completion Information Section */

//-->
</script>

