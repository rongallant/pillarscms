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
	<strong>Current File:</strong> #replace(attributes.file,"\","/","ALL")#
</cfsavecontent>

<div id="ToolsBody">

<form name="renamefile" action="#self#" method="post">
	<input type="Hidden" name="filename" value="#attributes.file#" />
	<input type="Hidden" name="fuseaction" value="#xfa.Rename#" />
	<fieldset>
		<legend>Rename</legend>
		<label for="newfilename">New File Name</label>
		<input type="Text" name="newfilename" id="newfilename" size="30" maxlength="256" class="myText" />
		<dir id="fieldnote">Do not include extention.</dir>
		<div class="buttonBox"><input type="Submit" name="SubmitButton" value="Rename File" class="myButton" /></div>
	</fieldset>
</form>

<form name="movefile" action="#self#" method="post">
	<input type="Hidden" name="filename" value="#attributes.file#" />
	<input type="Hidden" name="fuseaction" value="#xfa.Move#" />
	<fieldset>
		<legend>Move</legend>
		<label for="move">New location</label>
		<select name="move" id="move" class="mySelect">
			<option value="">Select New Location</option>
			<option value="">#my.folder.url#</option>
			<cfmodule template="#pathto('pgFileManager','cf')#directorytree.cfm"	
				rootdir="#my.folder.dir#"
				rooturl="#my.folder.url#" />
		</select>
		<div class="buttonBox"><input type="Submit" name="SubmitButton" value="Move File" class="myButton" /></div>
	</fieldset>
</form>

<form name="deletefile" action="#self#" method="post">
	<input type="Hidden" name="filename" value="#attributes.file#" />
	<input type="Hidden" name="fuseaction" value="#xfa.Delete#" />
	<fieldset>
		<legend>Delete</legend>
		<div class="buttonBox" style="text-align: center;"><input type="button" name="SubmitButton" value="Delete File" class="myButton" /></div>
	</fieldset>
</form>
</div>
</cfoutput>