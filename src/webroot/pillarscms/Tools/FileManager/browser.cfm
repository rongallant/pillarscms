<!--- 
	By: Ron Gallant
	Last Update: 2005-04-22
	Version: 1.1
	USAGE:
<cf_browser
	rootDir="#pathto('root','dir')#"
	fileRoot="#pathto('root','url')#"
	rootFolder="files\"
	filefolder="#attributes.filefolder#"
	viewerUrl="#myself##fusebox.thisCircuit#.home"
>
--->

<!--- I am the required attributes --->
<cfparam name="attributes.rootFolder" type="string"><!--- I am the image folder relative to the FileRoot eq(images\) --->
<cfparam name="attributes.FileRoot" type="string"><!--- I am the root url of the app --->
<cfparam name="attributes.rootDir" type="string"><!--- I am the root dir of the calling cfm file --->
<cfparam name="attributes.filefolder" type="string"><!--- I am the string for the new folder --->
<cfparam name="attributes.viewerUrl" type="string"><!--- I am the path to the viewing file / image viewer --->

<style type="text/css" media="all">
	#thumb { margin: 2px; }
	#small { font-size: 80%; font-weight:normal; }
</style>
<cfoutput>
<script language="JavaScript1.1" type="text/javascript">
// Set the horizontal and vertical position for the popup
PositionX = 10;
PositionY = 10;
defaultWidth  = 500;
defaultHeight = 500;
var AutoClose = true;

// Do not edit below this line...
// ================================
if (parseInt(navigator.appVersion.charAt(0))>=4){
	var isNN=(navigator.appName=="Netscape")?1:0;
	var isIE=(navigator.appName.indexOf("Microsoft")!=-1)?1:0;}
	var optNN='scrollbars=no,width='+defaultWidth+',height='+defaultHeight+',left='+PositionX+',top='+PositionY;
	var optIE='scrollbars=no,width=150,height=100,left='+PositionX+',top='+PositionY;
	function popImage(imageURL,imageTitle){
	if (isNN){imgWin=window.open('about:blank','',optNN);}
	if (isIE){imgWin=window.open('about:blank','',optIE);}
	with (imgWin.document){
		writeln('<html><head><title>Loading...</title><style>body{margin:0px;}</style>');writeln('<sc'+'ript>');
		writeln('var isNN,isIE;');writeln('if (parseInt(navigator.appVersion.charAt(0))>=4){');
		writeln('isNN=(navigator.appName=="Netscape")?1:0;');writeln('isIE=(navigator.appName.indexOf("Microsoft")!=-1)?1:0;}');
		writeln('function reSizeToImage(){');writeln('if (isIE){');writeln('window.resizeTo(100,100);');
		writeln('width=100-(document.body.clientWidth-document.images[0].width);');
		writeln('height=100-(document.body.clientHeight-document.images[0].height);');
		writeln('window.resizeTo(width,height);}');writeln('if (isNN){');       
		writeln('window.innerWidth=document.images["theimagename"].width;');writeln('window.innerHeight=document.images["theimagename"].height;}}');
		writeln('function doTitle(){document.title="'+imageTitle+'";}');writeln('</sc'+'ript>');
		if (!AutoClose) writeln('</head><body bgcolor=000000 scroll="no" onload="reSizeToImage();doTitle();self.focus()">')
		else writeln('</head><body bgcolor=000000 scroll="no" onload="reSizeToImage();doTitle();self.focus()" onblur="self.close()">');
		writeln('<img name="theimagename" src=' + imageURL + ' style="display:block"></body></html>');
		close();
	}
}
</script>
</cfoutput>

<cfscript>
	// I remove the last folder	
	function UpDir(directoryname) {
		var thedir = directoryname;
		if ( listlast(thedir,"/") eq ".." and ListLen(thedir,"/") gt 2 ) {
			thedir = ListDeleteAt(thedir, ListLen(thedir, "/"), "/");
			thedir = ListDeleteAt(thedir, ListLen(thedir, "/"), "/") & "/";
		} else if ( listlast(thedir,"/") eq ".." ) {
			thedir = "";
		}
		return theDir;
	}
	// I set up the app vars
	rootDir = attributes.rootDir;
	rootFolder = attributes.rootFolder;
	currentFolder = URLDecode(attributes.filefolder);
	currentFolder = Replace(currentFolder, "\", "/", "ALL");
	currentFolder = UpDir(currentFolder);
	galleryDir = rootDir & currentFolder;
</cfscript>

<!--- I return a record set of the contents of the folder --->
<cfdirectory action="LIST" name="qDir" directory="#galleryDir#">

<!--- I display the current folder --->
<cfsavecontent variable="request.subheading">
	<cfoutput><strong>Current Folder:</strong> #rootFolder##currentFolder#</cfoutput>
</cfsavecontent>
<cfoutput>
<ul id="FileList">
<cfif len(currentFolder)>
	<li id="folder"><a href="#attributes.viewerUrl#&filefolder=#URLEncodedFormat(currentFolder & "../")#">&##8593; (up level)</a></li>
</cfif>
<!--- I display the folders --->			
<cfloop query="qDir">
	<cfif qDir.type eq "Dir">
		<li id="folder">
			<a href="#attributes.viewerUrl#&filefolder=#URLEncodedFormat(currentFolder & qDir.name)#/">#qDir.name#</a>
			<a id="small" href="index.cfm?fuseaction=FolderTools.edit&folder=#URLEncodedFormat(currentFolder & qDir.name)#/" title="Rename">[edit]</a>
		</li>
	</cfif>
</cfloop>
<!--- I display the files --->
<cfloop query="qDir">
	<cfif qDir.type eq "File">
		<cfset FileLink = currentFolder & qDir.name>
		<cfset FileLink = replace(FileLink,"\","/","ALL")>
		<cfset GetFileLink = rootFolder & replace(FileLink,"\","/","ALL")>
		<cfswitch expression="#ListLast(qDir.name, ".")#">
			<cfcase value="jpg,gif,bmp,png">
					<li id="image"><a href="javascript:popImage('#GetFileLink#','#qDir.name#')">#qDir.name#</a>
					<a id="small" href="index.cfm?fuseaction=FileTools.edit&file=#URLEncodedFormat(FileLink)#" title="Rename">[edit]</a></li>
			</cfcase>
			<cfdefaultcase>
				<li id="file"><a href="#GetFileLink#" title="#qDir.name#" target="_blank">#qDir.name#</a>
					<a id="small" href="index.cfm?fuseaction=FileTools.edit&file=#URLEncodedFormat(FileLink)#" title="Rename">[edit]</a></li>
			</cfdefaultcase>
		</cfswitch>
	</cfif>
</cfloop>
</ul>
</cfoutput>