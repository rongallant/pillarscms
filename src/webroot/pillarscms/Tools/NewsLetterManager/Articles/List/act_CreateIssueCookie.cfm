<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
</fusedoc>
--->

<cfif isDefined('attributes.issueid') and len(attributes.issueid)>
	<cflock scope="Session" timeout="10">
		<cfset session.issueid = attributes.issueid />
	</cflock>
</cfif>