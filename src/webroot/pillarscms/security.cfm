<!--- 
	Security Tag v2.0
	Author - Ron Gallant
	File - security.cfm
 --->
<cfif thistag.executionmode eq "start">
	<!--- I make sure the tag has all required attributes --->
	<cfif structKeyExists(session, 'userid') and len(trim(session.userid))>
		<cfparam name="attributes.userid" default="#session.userid#" />
	<cfelse>
		<cfparam name="attributes.userid" default="noaccess" />
	</cfif>	
	<cfparam name="attributes.rights" type="numeric" />
	<cfparam name="attributes.thisapp" default="#caller.my.site.name#" type="string" />
	<cfparam name="attributes.dsn" default="#caller.my.db.dsn#" type="string" />
	<cfparam name="attributes.tableprefix" default="#caller.my.db.tableprefix#" type="string" />
	<cfparam name="attributes.errorpage" default="#caller.my.site.noauth#" type="string" />
	<cfset request.validated = 0 />
	<!--- I return a list of the users apps --->
	<cfif not structKeyExists(request, 'qUser')>
		<cfquery name="request.qUser" datasource="#attributes.dsn#">
			SELECT a.identifier, b.permissions
			FROM #attributes.tableprefix#_apps AS a
			LEFT OUTER JOIN #attributes.tableprefix#_userapps AS b
				ON a.id = b.fk_app_id
			LEFT OUTER JOIN #attributes.tableprefix#_users AS c
				ON b.fk_user_id = c.username
			WHERE c.username = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#attributes.userid#" />
			AND c.enabled = 1
		</cfquery>
	</cfif>
	<cfif request.qUser.recordcount>
		<!--- I check to see if the user is an admin. --->
		<cfquery name="qAdmPerm" dbtype="query">
			SELECT identifier
			FROM request.qUser
			WHERE identifier = 'admin'
			AND permissions >= #attributes.rights#
		</cfquery>
		<cfif qAdmPerm.recordcount>
			<cfset request.validated = 1 />
		<cfelse>
			<!--- I query the users list (wVul) for the current application and return their permissions --->
			<cfquery name="qPerm" dbtype="query">
				SELECT identifier
				FROM request.qUser
				WHERE identifier = '#attributes.thisapp#'
				AND permissions >= #attributes.rights#
			</cfquery>
			<cfif qPerm.recordcount>
				<cfset request.validated = 1 />
			</cfif>
		</cfif>
	<cfelse>
		<!--- I set the users access to 0 if they are not in the database or are disabled --->
		<cfset request.validated = 0 />
	</cfif>
</cfif>

<!--- I do some action if the user is not validated --->
<cfif thistag.HasEndTag>
	<cfif request.validated eq 0>
		<cfset thistag.generatedcontent = "" />
	</cfif>
<cfelse>
	<cfif request.validated eq 0>
		<cfif len(attributes.errorpage)>
			<cflocation url="#attributes.errorpage#" addtoken="No" />
		<cfelse>
			<cfset thistag.generatedcontent = "" />
			<cfthrow type="sec" errorcode="1" message="Security Error" detail="You are not authorized to see this page" />
		</cfif>
	</cfif>
</cfif>