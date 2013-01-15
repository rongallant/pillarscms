<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="act_CheckForUser" language="ColdFusion">
	<responsibilities>
		I send the user to the edit or new user page based on whether they exist in the DB.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2002-12-19" />
	</properties>
</fusedoc>
--->

<cfif getMessages.recordcount lt 1>
	<cflocation url="#myself##xfa.NewUser#&usrid=#attributes.usrid#" addtoken="no">
<cfelse>
	<cflocation url="#myself##xfa.EditUser#&usrid=#attributes.usrid#" addtoken="no">
</cfif>