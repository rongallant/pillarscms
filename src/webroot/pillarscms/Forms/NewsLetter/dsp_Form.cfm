<cfimport prefix="tag" taglib="../../tags"/>
<cfoutput>
<form name="AskAQuestion" id="myForm" action="#self#" method="post">
	<input type="hidden" name="email" value="#my.email.newsletter.address#"/>
	<input type="hidden" name="return" value="#my.email.newsletter.return#"/>
	<input type="hidden" name="subject" value="#my.email.newsletter.subject#"/>
	<input type="hidden" name="fuseaction" value="#xfa.Send#"/>
	<input type="hidden" name="fieldlist" value="#my.page.heading#,name,email,area"/>

	<div class="myField">
		<label for="name" class="standard">Name</label>
		<input name="name" id="name" size="30" maxlength="128"/> <span class="myNote">(required)</span>
	</div>

	<div class="myField">
		<label for="emailaddress" class="standard">Email Address</label>
		<input name="emailaddress" id="emailaddress" size="50" maxlength="256"/> <span class="myNote">(required)</span>
	</div>

	<div class="myField">
		<label for="area" class="standard">Area</label>
		<input name="area" id="area" size="14" maxlength="14"/> <span class="myNote">(required)</span>
	</div>

	<div class="myField" align="right">
		<input type="button" name="submitButton" value="Submit" class="myButton"/>
		<input type="button" name="resetButton" value="Reset" class="myButton"/>
	</div>

</form>
</cfoutput>