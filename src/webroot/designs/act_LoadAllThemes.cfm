<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="act_LoadAllThemes.cfm" language="ColdFusion">
	<responsibilities>
		I load all the themes into memory.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2003-08-15" />
	</properties>
</fusedoc>
--->

<cflock scope="application" timeout="10" type="EXCLUSIVE">
	<cfinclude template="mainsite/Themes.cfm">
	<cfinclude template="tools/Themes.cfm">
</cflock>
