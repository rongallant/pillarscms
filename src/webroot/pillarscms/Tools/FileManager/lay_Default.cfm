<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
</fusedoc>
--->

<cfsavecontent variable="toHead">
	<cfoutput><link rel="STYLESHEET" type="text/css" href="#pathto(fusebox.thisCircuit,'url')#styles/main.css"></cfoutput>
</cfsavecontent>
<cfhtmlhead text="#toHead#">

<cfoutput>
	<div id="toolsSubMenu">
		<cfmodule template="#fusebox.rootpath##self#" fuseaction="pgFileManager.menu" layout="none">
	</div>

	<!-- Heading -->
	<cfif len(my.page.heading)>
		<div id="ToolsHeading">#my.page.heading#</div>
	</cfif>
	<cfif len(my.page.subheading)>
		<div id="ToolsSubHeading">#my.page.subheading#</div>
	</cfif>

	<div id="ToolsBody">#fusebox.layout#</div>
</cfoutput>