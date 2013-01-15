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

<cfparam name="request.stop" default="1">

<cfif (comparenocase(thistag.executionmode, "start") eq 0) and (request.stop lt 50)>

	<!--- Required attributes --->
	<cfset request.stop = request.stop + 1>
	<cfparam name="attributes.rootdir" type="string">
	<cfparam name="attributes.rooturl" type="string">
	<cfparam name="attributes.currentpath" default="" type="string">
	<cfparam name="attributes.parent" default="#attributes.currentpath#" type="string">
	<cfset dir = attributes.rootdir & attributes.parent>
	
	<cfdirectory action="LIST" name="qDir" directory="#dir#">
	
	<cfoutput query="qDir">
		<cfif not ListContains(".,..",qDir.name) and qDir.type eq "DIR">
			<option value="#attributes.parent##qDir.name#/">#attributes.rooturl##attributes.parent##qDir.name#/</option>
			<cf_directorytree
				rootdir="#attributes.rootdir#"
				rooturl="#attributes.rooturl#"
				currentpath="#qDir.name#"
				parent="#attributes.parent##qDir.name#/" />
		</cfif>
	</cfoutput>

</cfif>