<cfscript>
	my = StructNew();
	my.user = StructNew();
	username = form.username;

	// TODO: Fix login
	my.user.userid = form.username;
	my.user.email = form.SiteEmail;
	my.user.fname = form.firstname;
	my.user.lname = form.lastname;
	my.user.password = hash(form.Password);
</cfscript>