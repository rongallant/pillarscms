<cfif ThisTag.ExecutionMode eq "Start">
	<!--- include UDFs --->
	<cfinclude template="tags/PathTo.cfm" />
	<cfinclude template="tags/UDFs.cfm" />

	<!--- include the FuseBox core - Using FEX Core for Error handling --->
	<cfinclude template="fbx_fusebox_FEX_CF50.cfm" />
</cfif>