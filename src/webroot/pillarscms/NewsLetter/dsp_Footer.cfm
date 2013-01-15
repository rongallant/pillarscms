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

<cfoutput>
	<cfif ListLen(request.qIssue.editor,"|") eq 1>
		<div id="editor">Editor: <cfloop list="#request.qIssue.editor#" delimiters="|" index="i">#trim(i)#</cfloop></div>
	<cfelseif ListLen(request.qIssue.editor,"|") gt 1>
		<div id="editor">Editors: <cfloop list="#request.qIssue.editor#" delimiters="|" index="i">#trim(i)#</cfloop></div>
	</cfif>
</cfoutput>