<cfimport prefix="sec" taglib="../../../" />
<cfset request.qforms = 1 />
<cfoutput>
<script type="text/javascript">
	// initialize the qForm object
	objForm = new qForm("myForm");

	// fuseaction
	objForm.password.description = "Password";
	objForm.password.required = false;
	objForm.password.validateSame('password2');
	
	objForm.password2.description = "Password Again";

	objForm.firstname.description = "First Name";
	objForm.firstname.required = true;
	
	objForm.lastname.description = "Last Name";
	objForm.lastname.required = true;
	
	objForm.email.description = "Email";
	objForm.email.required = false;
	objForm.email.validateEmail();
	
	objForm.phone.description = "Phone Number";
	objForm.phone.required = false;
	objForm.phone.validatePhoneNumber();

	// Functions
		// I enable NewApp if CreateApp is checked
		function GetAppName() {
			if(objForm.CreateApp.getValue()) {
				objForm.NewApp.disabled(false);
			} else {
				objForm.NewApp.disabled(true);
			}
		}

		// I prompt the user to delete an entry
		function deleteEntry() {
			var conf = confirm('Are you sure you want to delete (#JSStringFormat(getMessages.usrid)#)?');
			if(conf) {
				this.location.href = "#myself##xfa.DeleteUser#&usrid=#getMessages.usrid#";
			}
		}

	// Add events to the buttons
		<cfif fusebox.fuseaction eq "New">
			objForm.Add.addEvent("onclick", "setfuseaction('#xfa.AddUser#');");
		<cfelseif fusebox.fuseaction eq "EditUser">
			objForm.Update.addEvent("onclick", "setfuseaction('#xfa.UpdateUser#');");
			<sec:security rights="700">
				objForm.Delete.addEvent("onclick", "deleteEntry();");
			</sec:security>
		</cfif>
</script>
</cfoutput>