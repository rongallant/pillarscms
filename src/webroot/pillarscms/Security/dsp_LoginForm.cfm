<cfoutput>
<form name="userinfoForm" id="userinfoID" method="POST" action="#myself##xfa.login#" class="myForm">
	<div class="myFormheader">
		Please Select a username and password
		<div id="subheader">Pillars CMS</div>
	</div>
	<div class="myField"><label for="username">User Name</label> <input type="text" name="username" id="usernameID" /></div>
	<div class="myField"><label for="password">Password</label> <input type="password" name="password" id="passwordID" /></div>
	<div class="myButton"><input type="submit" name="submitButton" id="submitButtonID" value="OK" /></div>
</form>
</cfoutput>