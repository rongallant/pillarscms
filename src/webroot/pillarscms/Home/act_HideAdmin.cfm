<!--- I toggle the admin buttons --->
<cfparam name="attributes.hideadmin" />
<cflock scope="Session" timeout="10" type="exclusive">
	<cfset session.hideadmin = attributes.hideadmin />
</cflock>