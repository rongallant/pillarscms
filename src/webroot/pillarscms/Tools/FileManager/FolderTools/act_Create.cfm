<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I rename the selected folder
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
</fusedoc>
--->

<cfset folderparent = trim(attributes.folderparent)>
<cfset foldername = trim(attributes.foldername)>

<!--- I validate the input --->
<cfset reg = "[^[:alnum:]]">
<cfif REFindNoCase(reg, foldername)>

	<cfset request.regerror = 1>
	<p>You must use only alpha numeric characters. Use underscores instead of spaces.</p>
	<p><a href="javascript:history.back(-1);">Return</a></p>

<cfelse>

	<cfset folder = my.folder.dir & folderparent & foldername>
	<cfset folder = replace(folder, "/", "\" , "ALL")>
	<cflock scope="APPLICATION" timeout="#my.site.filelocktimout#">
		<cfdirectory action="CREATE" directory="#folder#">
	</cflock>

</cfif>