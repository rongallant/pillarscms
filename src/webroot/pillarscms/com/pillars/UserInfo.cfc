<cfcomponent displayname="User Info" output="false">

	<cfset this.userid = "" />
	<cfset this.authuser = "" />
	<cfset this.email = "" />
	<cfset this.phone = "" />
	<cfset this.fname = "" />
	<cfset this.lname = "" />

	<cffunction name="init" access="public">
		<cfargument name="dsn" required="true" />
		<cfargument name="tableprefix" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfset variables.tableprefix = arguments.tableprefix />
		<cfreturn this />
	</cffunction>

	<cffunction name="getUser" access="public">
		<cfreturn this />
	</cffunction>

	<cffunction name="authenticateUser" returntype="boolean" access="public" description="Login script">
		<cfargument name="username" type="string" required="true" />
		<cfargument name="password" type="string" required="true" />
		<cfquery name="qUserLogin" datasource="#variables.dsn#">
			SELECT users.username
			FROM #variables.tableprefix#_users AS users
			WHERE users.username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" maxlength="8" />
				AND users.password = <cfqueryparam value="#hash(arguments.password)#" cfsqltype="cf_sql_varchar" maxlength="32" />
				AND users.enabled = 1
		</cfquery>
		<cfif qUserLogin.recordcount eq 1>
			<cfset tmp = this.getUserInfo(arguments.username) />
			<cfset isAuthenticated = true />
		<cfelse>
			<cfset isAuthenticated = false />
		</cfif>
		<cfreturn isAuthenticated />
	</cffunction>

	<cffunction name="getPermissions" returntype="Struct" access="public" description="Login script">
		<cfargument name="username" type="string" required="true" />
		<cfquery name="qUserPermissions" datasource="#variables.dsn#">
			SELECT
				a.identifier,
				b.permissions
			FROM #variables.tableprefix#_apps a
			LEFT OUTER JOIN #variables.tableprefix#_userapps b
				ON a.id = b.fk_app_id
			LEFT OUTER JOIN #variables.tableprefix#_users c
				ON b.fk_user_id = c.username
			WHERE c.username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" maxlength="8" />
		</cfquery>
		<cfreturn qUserPermissions />
	</cffunction>

	<cffunction name="changeUserPassword" access="public">
		<cfargument name="username" required="true" type="string" />
		<cfargument name="password" required="true" type="string" />
		<cfquery name="qUpdateUserPassword" datasource="#variables.dsn#">
			UPDATE #variables.tableprefix#_users
			SET
				#variables.tableprefix#_users.password = <cfqueryparam value="#hash(arguments.password)#" cfsqltype="cf_sql_varchar" maxlength="32" />,
				#variables.tableprefix#_users.lsup_ts = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" />,
				#variables.tableprefix#_users.lsup_id = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" maxlength="20" />
			WHERE #variables.tableprefix#_users.username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" maxlength="20" />
		</cfquery>
	</cffunction>

	<cffunction name="getUserInfo" access="public" returntype="void">
		<cfargument name="username" type="string" required="true" />
		<cfset var local = StructNew() />
		<!--- TODO: Fix login --->
		<cfquery name="qUserInfo" datasource="#variables.dsn#">
			SELECT
				a.username,
				a.firstname,
				a.lastname,
				a.email_work,
				a.phone_work
			FROM #variables.TablePrefix#_users AS a
			WHERE a.username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" maxlength="8" />
		</cfquery>
		<cfscript>
			this.userid = qUserInfo.username;
			this.authuser = qUserInfo.username;
			this.email = qUserInfo.email_work;
			this.phone = qUserInfo.phone_work;
			this.fname = qUserInfo.firstname;
			this.lname = qUserInfo.lastname;
		</cfscript>
	</cffunction>
	
	<cffunction name="getDsn" returntype="string">
		<cfreturn variables.dsn />
	</cffunction>

	<cffunction name="setDsn" returntype="void" access="public">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn false />
	</cffunction>

	<cffunction name="getTablePrefix" returntype="string">
		<cfreturn variables.tableprefix />
	</cffunction>

	<cffunction name="setTableprefix" returntype="void" access="public">
		<cfargument name="tableprefix" type="string" required="true" />
		<cfset variables.tableprefix = arguments.tableprefix />
		<cfreturn false />
	</cffunction>

	<cffunction name="getUserid" returntype="string" access="public">
		<cfreturn this.userid />
	</cffunction>

	<cffunction name="setUserid" returntype="void" access="public">
		<cfargument name="userid" type="string" required="true" />
		<cfset this.userid = arguments.userid />
		<cfreturn false />
	</cffunction>

	<cffunction name="getAuthuser" returntype="string" access="public">
		<cfreturn this.authuser />
	</cffunction>

	<cffunction name="setAuthuser" returntype="void" access="public">
		<cfargument name="authuser" type="string" required="true" />
		<cfset this.authuser = arguments.authuser />
		<cfreturn false />
	</cffunction>

	<cffunction name="getEmail" returntype="string" access="public">
		<cfreturn this.email />
	</cffunction>

	<cffunction name="setEmail" returntype="void" access="public">
		<cfargument name="email" type="string" required="true" />
		<cfset this.email = arguments.email />
		<cfreturn false />
	</cffunction>

	<cffunction name="getPhone" returntype="string" access="public">
		<cfreturn this.phone />
	</cffunction>

	<cffunction name="setPhone" returntype="void" access="public">
		<cfargument name="phone" type="string" required="true" />
		<cfset this.phone = arguments.phone />
		<cfreturn false />
	</cffunction>

	<cffunction name="getTablePrefix" returntype="string" access="public">
		<cfreturn variables.tableprefix />
	</cffunction>

	<cffunction name="setFname" returntype="void" access="public">
		<cfargument name="fname" type="string" required="true" />
		<cfset this.fname = arguments.fname />
		<cfreturn false />
	</cffunction>

	<cffunction name="getFname" returntype="string" access="public">
		<cfreturn this.fname />
	</cffunction>

	<cffunction name="setLname" returntype="void" access="public">
		<cfargument name="lname" type="string" required="true" />
		<cfset this.lname = arguments.lname />
		<cfreturn false />
	</cffunction>

	<cffunction name="getLname" returntype="string" access="public">
		<cfreturn this.lname />
	</cffunction>

</cfcomponent>