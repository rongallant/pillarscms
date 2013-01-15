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

<cfimport prefix="sec" taglib="../../../">

<cfsavecontent variable="request.TableRight">
	<cfoutput>

		<sec:security tableprefix="#my.db.tableprefix#" thisapp="#my.site.AreaTwo#" rights="600">
		<a href="#myself#pgEdit.new&parentid=#attributes.pageid#">Add Child Page</a><br>
		<a href="#myself#paEdit.new&pageid=#attributes.pageid#">Add Paragraph</a><br>
		</sec:security>

		<a href="index.cfm?fuseaction=pages.preview&pageid=#attributes.pageid#" target="_blank">Preview Page</a><br>

		<img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="5" width="1" border="0">
	</cfoutput>
</cfsavecontent>