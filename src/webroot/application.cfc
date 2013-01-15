<cfcomponent>
	<cfset AppName = init() />
	<cfset this.name = "#AppName#_HOME" />
	<cfset this.ApplicationTimeOut = CreateTimeSpan(2, 0, 0, 0) />
	<cfset this.sessionmanagement = true />
	<cfset this.sessiontimeout = CreateTimeSpan(0, 0, 20, 0) />
	<cfset this.clientmanagement = false />
	<cfset this.setclientcookies = true />
	<cfset this.scriptprotect = false />

	<cffunction name="init" access="public">
		<cfset rootfolder = GetDirectoryFromPath(GetCurrentTemplatePath()) />
		<cfif fileExists('configuration.cfm')>
			<cfinclude template="configuration.cfm" />
		<cfelse>
			<cflocation url="install/index.cfm" addtoken="no" />
		</cfif>
		<cfreturn AppName />
	</cffunction>

	<cffunction name="onApplicationStart">
		<cfinclude template="application.init.cfm" />
	</cffunction>
	
	<cffunction name="onApplicationEnd">
	</cffunction>
	
	<cffunction name="onSessionStart">
	</cffunction>

	<cffunction name="onSessionEnd">
	</cffunction>

	<cffunction name="onRequestStart">
		<cfsetting showdebugoutput="false" />
		<!--- <cferror mailto="YourEmail" template="pillarscms/Errors/dsp_UserErrorMessage.cfm" type="exception" /> --->
		<cfparam name="request.refresh" default="0" />
		<cfparam name="request.my.app.mode" default="0" />
		<cfif isDefined('url.myAppMode') and len(url.myAppMode)>
			<cfswitch expression="#url.myAppMode#">
				<cfcase value="0,1,2">
					<cfset request.my.app.mode = url.myAppMode />
					<cflock scope="Session" timeout="10">
						<cfset session.myAppMode = url.myAppMode />
					</cflock>
				</cfcase>
				<cfcase value="3">
					<cfset request.my.app.mode = url.myAppMode />
					<cflock scope="Session" timeout="10">
						<cfset session.myAppMode = url.myAppMode />
					</cflock>
					<cfset request.refresh = 1 />
					<cfset onApplicationStart() />
				</cfcase>
				<cfcase value="4">
					<cflock scope="Session" timeout="10">
						<cfset structclear(session) />
					</cflock>
					<cflock type="exclusive" scope="Application" timeout="30">
	    				<cfset structclear(application) />
   					</cflock>
					<cfset request.refresh = 1 />
					<cfset onApplicationStart() />
				</cfcase>
				<cfdefaultcase></cfdefaultcase>
			</cfswitch>
		</cfif>
		<cfif StructKeyExists(session, 'myAppMode') and len(session.myAppMode)>
			<cfset request.my.app.mode = session.myAppMode />
		</cfif>
	</cffunction>

	<cffunction name="onRequestEnd">
		<cfinclude template="application.footer.cfm" />
	</cffunction>

</cfcomponent>