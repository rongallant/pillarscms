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

<cfset fileDir = my.folder.dir & attributes.folderparent>
<cfset filename = attributes.filename>

<!--- I validate the input --->
<cfset tmp = ListLast(filename,"\")>
<cfset reg = "[^[:alnum:].[:alpha:]{3}]">
<cfif REFindNoCase(reg, tmp)>
	<cfset request.regerror = 1>
	<p>You must use only alpha numeric characters. Use underscores instead of spaces.</p>
	<p><a href="javascript:history.back(-1);">Return</a></p>
<cfelse>
	<!--- I upload the file --->
	<cflock scope="APPLICATION" timeout="#my.site.filelocktimout#">
		<cffile action="UPLOAD" filefield="filename" destination="#fileDir#" nameconflict="MAKEUNIQUE">
	</cflock>
</cfif>