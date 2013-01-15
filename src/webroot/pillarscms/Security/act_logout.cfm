<cflock timeout="20" scope="Session" type="Exclusive">
	<cfscript>
		StructClear(session);
	</cfscript> 
</cflock>