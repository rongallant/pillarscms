<cflock scope="application" timeout="10" type="exclusive">
	<cfscript>
		// Database Settings
			application.settings.my.db.dsn = AppDsn;
			application.settings.my.db.TablePrefix = AppTablePrefix;
		// Editor
			application.editorBasePath = "assets/Editor/";
			application.userFilesPath = "/content/";
			application.serverPath = GetDirectoryFromPath(GetCurrentTemplatePath());
		// Search Engine
			application.my.searchengine = createobject("component", "pillarscms.com.pillars.SearchEngine").init(
				dsn=AppDsn, 
				tablePrefix=AppTablePrefix,
				collectionPath="C:\Documents and Settings\rgallant\My Documents\CWA\railo\webroot\WEB-INF\railo\search"
			);
	</cfscript>

	<cfquery name="qSettings" datasource="#application.settings.my.db.dsn#">
		SELECT varScope, varName, varValue
		FROM #application.settings.my.db.tableprefix#_Settings
	</cfquery>

	<cfloop query="qSettings">
		<cfset SetVariable( "application.settings." & qSettings.varScope & "." & qSettings.varName, qSettings.varValue ) />
	</cfloop>

	<cfinclude template="designs/act_LoadAllThemes.cfm" />
</cflock>