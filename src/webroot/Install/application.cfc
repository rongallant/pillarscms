<cfcomponent>
	<cfset this.name = "tmp" />
	<cfset this.Sessionmanagement = true />
	<cfset this.clientManagement = false />
	<cfset this.ApplicationTimeOut = "#CreateTimeSpan(0,0,30,0)#" />
	<cfset this.scriptprotect = "false" />
	
	<cffunction name="onRequestStart">
		<cfsetting showdebugoutput="false" />
	</cffunction>

</cfcomponent>