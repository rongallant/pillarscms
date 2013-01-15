<!--- changeUserPassword --->
<cfif len(trim(attributes.password))>
	<cfscript>
		application.my.userinfo.changeUserPassword(trim(lcase(attributes.usrid)), trim(attributes.password));
	</cfscript>
</cfif>