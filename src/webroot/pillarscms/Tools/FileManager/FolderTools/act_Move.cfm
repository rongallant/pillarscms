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

<!--- I format the filename field --->
<cfparam name="attributes.filename" type="string">
<cfset filename = replace(attributes.filename, "/", "\" , "ALL")>
<cfset filename = pathto('root','dir') & filename>
<cfset filename = replace(filename, "\\", "\" , "ALL")>

<!--- I format the newfilepath field --->
<cfparam name="attributes.move" type="string">
<cfset newfilepath = attributes.move>
<cfif right(newfilepath, len(newfilepath)-1) neq "\">
	<cfset newfilepath = newfilepath & "\">
</cfif>

<cflock scope="APPLICATION" timeout="#my.site.filelocktimout#">
	<cffile action="MOVE" source="#filename#" destination="#newfilepath#">
</cflock>