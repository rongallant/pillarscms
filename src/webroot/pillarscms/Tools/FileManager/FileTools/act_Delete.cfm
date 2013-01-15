<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2004-03-16" />
	</properties>
</fusedoc>
--->

<!--- I build the file directory --->
<cfset filepath = my.folder.dir & attributes.filename>

<!--- I delete the file --->

<cflock scope="APPLICATION" timeout="#my.site.filelocktimout#">
	<cffile action="DELETE" file="#filepath#">
</cflock>