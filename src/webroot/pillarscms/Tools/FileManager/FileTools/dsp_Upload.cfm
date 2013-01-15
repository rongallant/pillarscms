<!--- Directory Tree --->
<cfimport prefix="tree" taglib="../">

<cfoutput>
<div id="ToolsBody">
<form name="myForm" action="#self#" method="post" enctype="multipart/form-data">
	<input type="hidden" name="fuseaction" id="fuseaction" value="#xfa.Upload#" />
	<fieldset>
		<legend>Upload New File</legend>
		<label for="folderparent">Parent</label>
		<select name="folderparent" id="folderparent" class="mySelect">
			<option value="">#my.folder.url#</option>
			<tree:directorytree rootdir="#my.folder.dir#" rooturl="#my.folder.url#" />
		</select>
		<br /><label for="filename">File</label>
		<input type="file" name="filename" id="filename" class="myText" />
		<div id="fieldnote">(browse file to upload)</div>
		<div class="buttonBox"><input type="Button" name="SubmitButton" id="SubmitButton" value="Upload File" class="myButton" /></div>
	</fieldset>
</form>
</div>
</cfoutput>