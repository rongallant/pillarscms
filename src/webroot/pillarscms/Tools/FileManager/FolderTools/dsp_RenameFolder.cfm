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
<!--- I display the current folder --->
<cfsavecontent variable="my.page.subheading">
	<strong>Current Folder:</strong> #attributes.folder#	
</cfsavecontent>

<!--- Rename --->
<div id="ToolsBody">
<form name="fRename" action="#self#" method="post">
<input type="Hidden" name="fuseaction" value="#xfa.Rename#" />
<input type="Hidden" name="folder" value="#attributes.folder#" />
	<fieldset>
		<legend>Rename Folder</legend>
		<label for="newname">New Name</label>
		<input type="Text" name="newname" id="newname" size="30" maxlength="256" class="myText" />
		<div class="buttonBox"><input type="Submit" name="submitbutton" value="Rename Folder" class="myButton" /></div>
	</fieldset>
</form>
</div>
</cfoutput>