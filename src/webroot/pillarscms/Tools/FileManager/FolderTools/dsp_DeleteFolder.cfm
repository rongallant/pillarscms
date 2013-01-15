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
<!--- Delete --->
<div id="ToolsBody">
<form name="fDelete" action="#self#" method="post">
<input type="Hidden" name="fuseaction" value="#xfa.Delete#" />
<input type="Hidden" name="folder" value="#attributes.folder#" />
	<fieldset>
		<legend>Delete Folder</legend>
		<div class="buttonBox" style="text-align:center;"><input type="button" name="submitbutton" value="Delete Folder" class="myButton" /></div>
	</fieldset>
</form>
</div>
</cfoutput>