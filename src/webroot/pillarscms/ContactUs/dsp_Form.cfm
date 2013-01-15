<cfimport prefix="tag" taglib="../tags"/>
<cfoutput>
<form name="myForm" class="myForm" id="myForm" action="#self#" method="post">
	<input type="hidden" name="fuseaction" id="fuseaction" value="#xfa.Send#" />
	<input type="hidden" name="fieldlist" id="fieldlist" value="Contact Us,name,email,comments" />
	<table cellpadding="3" cellspacing="0" border="0">
		<tr>
			<td class="FieldHeading"><label for="name" class="standard">Name</label></td>
			<td><input type="text" name="name" id="name" size="30" maxlength="256" /> <span class="myNote">(required)</span></td>
		</tr>
		<tr>
			<td class="FieldHeading"><label for="email" class="standard">Email Address</label></td>
			<td>
				<input name="email" id="email" size="40" maxlength="256" /> <span class="myNote">(required)</span>
				<div class="myExample">yourname@rongallant.com</div>
			</td>
		</tr>
		<tr valign="top">
			<td class="FieldHeading"><label for="comments" class="standard">Comments</label></td>
			<td><tag:textarea fieldname="comments" maxlength="500"/>
			<span class="myNote">(required)</span></td>
		</tr>
		<tr>
			<td class="FieldHeading"><img src="assets/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>
			<td class="" align="center"><input type="button" name="submitButton" id="submitButton" value="Submit" class="myButton" /></td>
		</tr>
		<tr>
			<td width="100"><img src="assets/images/spacer.gif" width="100" height="1" alt="" border="0" /></td>
			<td width="100%"><img src="assets/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>
		</tr>
	</table>
</form>

<p>If you have difficulties using this form, <a href="mailto:#my.email.contactus.address#">email us</a>.</p>
</cfoutput>