<cfscript>
	my.site.name = "FileManager";							// Site name with no spaces
	my.site.title = "File Manager";							// Site display name
	my.site.subheading = "Manage the file assets on your site.";// Site description
	my.site.heading = my.site.title;						// Site description
	my.layout.mainmenu = "pgFileManager.menu";

	my.site.filelocktimout = 5;								// timout (in seconds) for cffile proccessin

	my.folder.url = application.userFilesPath; // web path to files
	my.folder.path = application.userFilesPath; // web path to files
	my.folder.dir = application.serverPath & ListFirst(application.userFilesPath,"/") & "\"; //server path to files

	webutils = "";
	attributes.fromEditor = 1;
	request.regerror = 0;
</cfscript>

<cfif not isDefined('request.stylesheet')>
	<cfsavecontent variable="request.stylesheet">
		<cfoutput>
			<style media="all" type="text/css">
				@import "#pathto(fusebox.thisCircuit,'url')#styles/main.css";
			</style>
		</cfoutput>
	</cfsavecontent>
	<cfhtmlhead text="#request.stylesheet#">
</cfif>