<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2004-04-05" />
	</properties>
	<io>
		<in>
			<string scope="attributes" name="filetype" />
			<string name="" />
		</in>
		<out>
			<string name="qFiles" />
		</out>
	</io>
</fusedoc>
--->

<cfdirectory action="LIST" name="qGetFiles" directory="#my.folder.dir#">

<cfquery name="qFiles" dbtype="query">
	SELECT
		datelastmodified,
		name,
		size,
		type
	FROM qGetFiles
	WHERE type = 'File'
	<cfif isDefined('attributes.filter') and len(attributes.filter)>
		AND ( 1 = 0
			<cfloop list="#attributes.filter#" index="i">
			OR name LIKE '%#i#'
			</cfloop>
		)
	</cfif>
	ORDER BY datelastmodified DESC
</cfquery>