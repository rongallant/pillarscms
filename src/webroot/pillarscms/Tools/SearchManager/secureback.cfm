<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="security.cfm" language="ColdFusion">
	<responsibilities>
		I am the security tag for webutils. I allow or deny access to sections or entire pages on a site. I can also send a user to a admin defined location if a user has been denied access to a page.
	</responsibilities>
	<properties>
		<property name="Version" value="3.1" />
		<history email="ron@rongallant.com" type="update" date="2010-02-23" comments="Removed my email from functionality." />
		<history email="ron@rongallant.com" type="update" date="2003-07-13" comments="3.1 - no doesn't desearialize client var if not in database" />
		<history email="ron@rongallant.com" type="update" date="2003-07-13" comments="streamlined if statements.  Now passes request.validated outside app." />
		<history email="ron@rongallant.com" type="update" date="2003-04-16" comments="use wddx to store app list" />
		<history email="ron@rongallant.com" type="update" date="2003-04-15" comments="now loops apps." />
		<history email="ron@rongallant.com" type="create" date="2003-03-12" />
		<note>
			To access this tag use;
			<sec:security rights="800">
				0 None
				100 Overview
				200 Read
				300 Comment
				400 Moderate
				500 Edit
				600 Add
				700 Delete
				800 Admin
			Code wrapped in this tag also has access to the request.validated variable set to 1 if the user has permission to access page.
		</note>
	</properties>
	<io>
		<in>
			<string scope="cgi" name="auth_user" />
			<structure scope="attributes">
				<string name="ThisApp" />
				<string name="rights" />
				<string name="errorpage" />
			</structure>
		</in>
		<out>
			<boolean scope="request" name="validated" comments="true if user has rights" />
		</out>
	</io>
</fusedoc>
--->

<!--- I am the start tag for this custom tag --->
<cfif thistag.executionmode eq "start">
	
	<!--- I make sure the tag has all required attributes --->
	<cfparam name="attributes.thisapp" default="#caller.my.site.name#" type="string" />
	<cfparam name="attributes.dsn" default="#caller.my.db.dsn#" type="string" />
	<cfparam name="attributes.tableprefix" default="#caller.my.db.tableprefix#" type="string" />
	<cfparam name="attributes.errorpage" default="" type="string" />

	<!--- I make sure the server variable cgi.auth_user exists --->
	<cfif isDefined('cgi.auth_user')>
		<cfset attributes.userid = listlast(cgi.auth_user,"\") />
	<cfelse>
		<cfoutput><p>You must have anonymous access turned off on the server to use this tag.</p></cfoutput>
		<cfabort />
	</cfif>

<!--- Verify User Login --->
	
	<!--- I check for the client variables --->
	<cfif not isdefined('session.user') or not isdefined('cookie.login')>
		<cfcookie name="login" expires="NOW" />
		<!--- I return a list of the users apps if they are not an admin --->
		<cftry>
			<cfquery name="qUser" datasource="#attributes.dsn#">
				SELECT
					a.identifier,
					b.permissions
				FROM #attributes.tableprefix#_apps AS a
				LEFT OUTER JOIN #attributes.tableprefix#_userapps AS b
					ON a.id = b.fk_app_id
				LEFT OUTER JOIN #attributes.tableprefix#_users AS c
					ON b.fk_user_id = c.username
				WHERE c.username = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(attributes.UserID)#" />
				AND c.enabled = 1
			</cfquery>
			<cfcatch>
				<cfoutput>
					<p>Please try again in a few minutes. <cfif isDefined('my.email.webmaster')>If this problem persists please contact an <a href="MAILTO:#my.email.webmaster#">administrator</a>.</cfif></p>
				</cfoutput>
				<cfabort />
			</cfcatch>
		</cftry>

		<cfif qUser.recordcount>
			<!--- If the user is not an admin I set session.user to the list of apps for the user --->
			<cfwddx action="CFML2WDDX" input="#qUser#" output="session.user" />
		<cfelse>
			<cfset session.user = "" />
		</cfif>

	</cfif>
	
	<!--- I check that the user has an entry before trying to deserialize the client variable --->
	<cfif len(trim(session.user))>
	
		<!--- I deserialize session.user to a structure called wVul --->
		<cfwddx action="WDDX2CFML" input="#session.user#" output="wVul" />
	
		<!--- I set if the user has passed validation or not --->
		<cfparam name="attributes.rights" default="0" />
		<cfset request.validated = 0 />
	
		<!--- I query the users list (wVul) for the current application and return their permissions --->
		<cfquery name="qPerm" dbtype="query">
			SELECT
				identifier,
				permissions
			FROM wVul
			WHERE identifier = '#attributes.thisapp#'
		</cfquery>

		<!--- I set user rights --->
		<cfif qPerm.permissions gte attributes.rights and qPerm.permissions neq 0>
			<cfset request.validated = 1 />
		</cfif>
	
		<cfif not qPerm.recordcount>
	
			<!--- If the user is not associated directly with this app I then check to see if they are an admin. --->
			<cfquery name="qAdmPerm" dbtype="query">
				SELECT
					identifier,
					permissions
				FROM wVul
				WHERE identifier = 'admin'
			</cfquery>

			<!--- I set admin rights --->
			<cfif qAdmPerm.permissions gte attributes.rights and qAdmPerm.permissions neq 0>
				<cfset request.validated = 1>
			</cfif>
	
		</cfif>
	
	<!--- I set the user as not validated if they are not in the database or are disabled --->
	<cfelse>
		<cfset request.validated = 0 />
	</cfif>

</cfif>

<!--- I do some action if the user is not validated --->
<cfif thistag.HasEndTag>

	<!--- I tell the tag what to do when the validation is complete --->
	<cfif not request.validated>
		<cfset thistag.generatedcontent = "" />
		<cfif len(attributes.errorpage)>
			<cflocation url="#attributes.errorpage#" addtoken="No" />
		</cfif>
	</cfif>

<cfelse>

	<!--- I tell the tag what to do when the validation is complete --->
	<cfif not request.validated>
		<cfset thistag.generatedcontent = "" />
		<cfif len(attributes.errorpage)>
			<cflocation url="#attributes.errorpage#" addtoken="No" />
		<cfelse>
			<cfoutput><p>You do not have access to this page.</p></cfoutput>
			<cfabort />
		</cfif>
	</cfif>

</cfif>