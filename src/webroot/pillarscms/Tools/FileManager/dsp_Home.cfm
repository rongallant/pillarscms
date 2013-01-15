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

<cfimport prefix="file" taglib="./">

<cfparam name="attributes.filefolder" default="" type="string">

<div id="ToolsBody">
<file:browser
	rootDir="#my.folder.dir#"
	fileRoot="#pathto('root','url')#"
	rootFolder="#my.folder.url#"
	filefolder="#attributes.filefolder#"
	viewerUrl="#myself##fusebox.thisCircuit#.home"
>
</div>