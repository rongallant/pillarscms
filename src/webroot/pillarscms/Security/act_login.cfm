<cflock scope="Session" timeout="10">
	<cfscript>
		variables.authenticated = session.my.oUserInfo.authenticateUser(attributes.username, attributes.password);
		if (variables.authenticated) {
			session.my.oUserInfo.getUserInfo(attributes.username);
			session.userid = attributes.username;
		} else if ( structKeyExists(session, 'userid') ) {
			StructDelete(session, 'userid');
		}
	</cfscript>
</cflock>