<cfoutput>
<div id="ToolsBody">
<form name="myForm" action="#self#" method="post">
	<input type="Hidden" name="fuseaction" />
	<fieldset>
		<legend>Create Folder</legend>
		<label for="folderparent">Parent</label>
		<select name="folderparent" id="folderparent" class="mySelect">
			<option value="">#my.folder.url#</option>
			<cfmodule template="#pathto('pgFileManager','cf')#directorytree.cfm"	
				rootdir="#my.folder.dir#"
				rooturl="#my.folder.url#" />
		</select>
		<br /><label for="foldername">Folder Name</label>
		<input type="Text" name="foldername" id="foldername" size="30" maxlength="256" class="myText" />
		<div class="buttonBox"><input type="Button" name="addButton" value="Create Folder" class="myButton" /></div>
	</fieldset>
</form>
</div>
</cfoutput>