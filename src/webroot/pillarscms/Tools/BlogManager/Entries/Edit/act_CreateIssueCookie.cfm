<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="act_CreateIssueCookie" language="ColdFusion">
	<responsibilities>
		I set the issue id.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
		<history email="ron@rongallant.com" type="update" date="2009-07-09" />
	</properties>
</fusedoc>
--->

<cfif isDefined('attributes.issueid') and len(attributes.issueid)>
	<cflock scope="Session" timeout="10">
		<cfset session.issueid = attributes.issueid />
	</cflock>
</cfif>