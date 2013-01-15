<cfsetting showdebugoutput="false" />
<cfset rootfolder = replace(GetBaseTemplatePath(),"Install\index.cfm","")/>

<!--- User cgi.remote_user instead --->
<cfparam name="form.dsn" default="pillarscms"/>
<cfparam name="form.tableprefix" default="pillars"/>
<cfparam name="form.SiteName" default="pillarscms"/>
<cfparam name="form.SiteHeading" default="Pillars CMS"/>
<cfparam name="form.SiteEmail" default=""/>
<cfparam name="form.SiteURL" default="http://#cgi.server_name#/"/>
<cfparam name="form.DropTables" default=""/>
<cfif isDefined('form.dsn') and not isDefined('form.CreateTables')>
	<cfparam name="form.CreateTables" default="0"/>
<cfelse>
	<cfparam name="form.CreateTables" default="1"/>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Install</title>
	<style type="text/css" media="all">
		@import url(styles.css);
		.notdone { color: red; }
	</style>
	<script type="text/javascript" src="../assets/scripts/qForm/qforms.js"></script>
	<script type="text/javascript">
		qFormAPI.setLibraryPath("../assets/scripts/qForm/");
		qFormAPI.include("*");
	</script>
</head>
<body>

<cfoutput>
<div id="form">
	<form name="installForm" action="index.cfm" method="post">
		<div id="header">
			Your Site Installation
			<div id="subheader">Pillars CMS</div>
		</div>
		<div class="field"><label for="dsn">DSN</label> <input name="dsn" id="dsn" value="#form.dsn#" size="30" maxlength="128" /> Temporarily set to DBO</div>
		<div class="field"><label for="tableprefix">Table Prefix</label> <input name="tableprefix" id="tableprefix" value="#form.tableprefix#" size="15" maxlength="15" /> No Spaces, Unique</div>
		<div class="field"><label for="SiteName">Site Name</label> <input name="SiteName" id="SiteName" value="#form.SiteName#" size="30" maxlength="128" /> No Spaces, Used by applicationname</div>
		<div class="field"><label for="SiteName">Site Heading</label> <input name="SiteHeading" id="SiteHeading" value="#form.SiteHeading#" size="30" maxlength="128" /> Name to be displayed to the user.</div>
		<div class="field"><label for="SiteURL">Site URL</label> <input name="SiteURL" id="SiteURL" value="#form.SiteURL#" size="50" maxlength="256" /> Including "http://"</div>
		<div class="field"><label for="DropTables">Drop Tables?</label> <input name="DropTables" id="DropTables" type="checkbox" value="1" /> Delete existing tables.</div>
		<div class="field"><label for="CreateTables">Create Tables?</label> <input name="CreateTables" id="CreateTables" type="checkbox" value="1"<cfif form.CreateTables eq 1> checked="checked"</cfif> /> Create tables and add data.</div>

		<h3>Admin Login</h3>
		<div class="field"><label for="username">User Name</label> <input type="text" name="username" id="usernameID" size="30" maxlength="128" value="admin" /> User name for admin.</div>
		<div class="field"><label for="password">Password</label> <input type="password" name="password" id="passwordID" size="30" maxlength="128" /> Password for admin.</div>
		<div class="field"><label for="password2">Password Again</label> <input type="password" name="password2" id="password2ID" size="30" maxlength="128" /> Password for admin.</div>

		<h3>User Information</h3>
		<div class="field"><label for="firstname">First Name</label> <input type="text" name="firstname" id="firstname" size="50" maxlength="256" /></div>
		<div class="field"><label for="lastname">Last Name</label> <input type="text" name="lastname" id="lastname" size="50" maxlength="256" /></div>
		<div class="field"><label for="SiteEmail">Email</label> <input name="SiteEmail" id="SiteEmail" value="#form.SiteEmail#" size="50" maxlength="256" /> Site Contact Email</div>

		<div class="button"><input type="button" name="submitButton" value="Install" /></div>
	</form>
</div>
</cfoutput>
<script type="text/javascript">
	objForm = new qForm("installForm");
	objForm.dsn.description = "DSN";
	objForm.dsn.required = true;
	objForm.dsn.validateAlphaNumeric();
	objForm.tableprefix.description = "Table Prefix";
	objForm.tableprefix.required = true;
	objForm.tableprefix.validateAlphaNumeric();
	objForm.SiteName.description = "Site Name";
	objForm.SiteName.required = true;
	objForm.SiteName.validateAlphaNumeric();
	objForm.SiteEmail.description = "Site Email";
	objForm.SiteEmail.required = true;
	objForm.SiteURL.description = "Site URL";
	objForm.SiteURL.required = true;
	objForm.username.description = "User Name";
	objForm.username.required = true;
	objForm.password.description = "Password";
	objForm.password.required = true;
	objForm.password.validateSame('password2');

	objForm.submitButton.addEvent("onClick","objForm.submit();");
</script>

<!--- START Action --->
<cfif isDefined('form.dsn') and len(form.dsn) and len(form.tableprefix)>
	<cfflush interval="1" />
	<cfset dsn = trim(form.dsn) />
	<cfset tp = trim(form.tableprefix) />
	<cfset lb = "<" />
	<cfset rb = ">" />
	<cfset fs = "/" />
	<cfsavecontent variable="tmp">
		<cfoutput>
			#lb#cfif not ( ListContainsNoCase(CGI.SCRIPT_NAME, "index.cfm", "/\") or ListContainsNoCase(CGI.SCRIPT_NAME, "connector.cfm", "/\") )#rb#
				#lb#cflocation url="index.cfm" addtoken="no" #fs##rb#
			#lb#/cfif#rb#
			#lb#cfset AppName="#tp#" #fs##rb#
			#lb#cfset AppDsn="#dsn#" #fs##rb#
			#lb#cfset AppTablePrefix="#tp#" #fs##rb#
		</cfoutput>
	</cfsavecontent>
	<cflock timeout="10">
		<cfif fileExists('../configuration.cfm')>
			<cffile action="delete" file="../configuration.cfm" />
			<p class="notdone">configuration.cfm File Deleted</p>
		</cfif>
		<cffile action="write" file="../configuration.cfm" output="#tmp#" />
	</cflock>
	<p>configuration.cfm File Created</p>

	<cfinclude template="../pillarscms/tags/UDFs.cfm" />
	<cfset adminAppID = CreateGUID() />
	<cfset siteSettingsID = CreateGUID() />
	<cfset ContactUsID = CreateGUID() />
	<cfset IssueID = CreateGUID() />

	<cftry>
		<cfif isDefined('form.DropTables') and form.DropTables eq 1>
			<cfinclude template="qry_DeleteConstraints.cfm" />
			<p>Primary Keys and Constraints Deleted</p>
			<cfinclude template="qry_DeleteTables.cfm" />
			<p>Tables Deleted</p>
		<cfelse>
			<p class="notdone">Primary Keys and Constraints Not Deleted</p>
			<p class="notdone">Tables Not Deleted</p>
		</cfif>
		<cfif isDefined('form.CreateTables') and form.CreateTables eq 1>
			<cfinclude template="qry_CreateTables.cfm" />
			<p>Tables Created</p>
			<cfinclude template="act_UserInfo.cfm" />
			<cfinclude template="qry_AddDefaultData.cfm" />
			<p>Default Data Added</p>
			<cfinclude template="qry_CreateKeysConstraints.cfm" />
			<p>Primary Keys and Constraints Created</p>
		<cfelse>
			<p class="notdone">Tables Not Created</p>
			<p class="notdone">Default Data Not Added</p>
			<p class="notdone">Primary Keys and Constraints Not Created</p>
		</cfif>
		<cfcatch>
			<p style="font-weight:bold;color:red;text-align:center;">There was an error creating the tables.</p>
			<cfdump var="#cfcatch#" label="cfcatch" />
			<cfset request.error = 1 />
		</cfcatch>
	</cftry>
	<cfif not isDefined('request.error')>
		<h4 align="center"><a href="../index.cfm?myAppMode=4">Go to your site</a></h4>
		<h4 style="background-color:#FECBCC;border:1px solid red;">Don't forget to delete the "Install" folder</h4>
	</cfif>
</cfif>

</body>
</html>