<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="act_CheckAuth" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron.@rongallant.com" type="create" date="2002-12-20" />
	</properties>
	<io>
		<in>
			<recordset name="vul">
				<string name="application" />
			</recordset>
			<string name="xfa.NotAuth" />
			<string scope="attributes" name="userid" />
		</in>
		<out>
			<string name="applist" />
		</out>
	</io>
</fusedoc>
--->

<cfset applist = valuelist(vul.application)>

<cfif vul.recordcount eq 0>
	<cf_fa fuseaction="#xfa.NotAuth#" querystring="userid=#attributes.userid#">
</cfif>