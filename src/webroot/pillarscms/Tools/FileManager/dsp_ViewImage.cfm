<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
	<io>
		<in>
			<string name="" />
		</in>
		<out>
			<string name="" />
		</out>
	</io>
</fusedoc>
--->

<cfoutput>
<div align="center"><img src="#my.folder.url##qImage.name#" border="0"></div>
<div class="FileInfo"><b>FILE NAME:</b> #qImage.name#</div>
<div class="FileInfo"><b>LAST MODIFIED:</b> #qImage.DateLastModified#</div>
<div class="FileMenu" align="center"><a href="#myself##xfa.RenameFile#&file=#URLEncodedFormat(qImage.name)#">rename</a> - <a href="#myself##xfa.DeleteFile#&file=#URLEncodedFormat(qImage.name)#">delete</a></div>


<div align="right">
	<b><a href="javascript:window.close();">Close Window</a></b>
</div>

</cfoutput>