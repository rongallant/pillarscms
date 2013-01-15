<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="dsp_Thumbs" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2004-04-05" />
	</properties>
</fusedoc>
--->

<cfsavecontent variable="toHead">
<style type="text/css">
	.FileInfo {
		font-family: Arial;
		font-size: 9px;
		color: #818181;
	}
	.FileMenu {
		font-family: Arial;
		font-size: 12px;
	}
</style>

<cfoutput>
	<script language="JavaScript1.2" type="text/javascript">
		function GetCodeImage(filename) {
			alignimage = document.Code.align.value;
			document.Code.CodeBox.value = "<img src=\"#JSStringFormat(PathToFiles)#"
				+ filename
				+ "\" align=\""
				+ alignimage
				+ "\" border=0>";
		}
		function GetCodeFile(filename) {
			document.Code.CodeBox.value = "<a href=\"#JSStringFormat(PathToFiles)#"
				+ filename
				+ "\" target=\"_blank\">YOUR TEXT</a>";
		}
		function DeleteConfirm(filename) {
			confirmed = confirm("Are you sure you want to delete this file?");
			if (confirmed) {
				window.location.href="#myself##xfa.DeleteFile#&file=" + filename;
			}
		}
		function insertImageFile(file) {
			var win= window.opener
			var fID= win.fID
			var edi= win.document.getElementById(fID).contentWindow
			var cmd= "#JSStringFormat(PathToFiles)#" + file
			win.insertImageSimple(edi, cmd)
		}
		function createLink(file) {
			var win= window.opener
			var fID= win.fID
			var edi= win.document.getElementById(fID).contentWindow
			win.insertLink('#JSStringFormat(PathToFiles)#'+file)
		}
	</script>
</cfsavecontent>
<cfhtmlhead text="#toHead#">

<cfset Columns = 3>
<cfset Rows = 6>
<cfset ColWidth = round( 100 / Rows )>

<cfif qFiles.recordcount eq 0>
	<p>There are no files.</p>
<cfelse>
	<table cellpadding="2" cellspacing="2" border="0" width="100%">
		<tr>
			<td colspan="#Rows#">
				<cfinclude template="dsp_ResultNav.cfm">
			</td>
		</tr>
		<tr>
			<cfset i = 0>
			<cfloop query="qFiles" startrow="#attributes.startrow#" endrow="#attributes.endrow#">
				<!--- Filter out unwanted files and directories --->
				<cfset FileExt = "#ListLast(qFiles.name,".")#">
				<cfif ( ListContains(attributes.filter, FileExt) or not len(attributes.filter) ) and ( qFiles.name neq "." and qFiles.name neq ".." )>
					<cfset i = i + 1>
					<td width="#ColWidth#%" bgcolor="##FFFFFF">
						<div align="center">
						<cfset ScriptName = "GetCodeFile">
						<cfif ListContains(".gif,.jpg,.bmp,.png", FileExt,",")>
							<a href="javascript:popupPage('#myself##xfa.ViewImage#&file=#URLEncodedFormat(qFiles.name)#','ImageWindow','yes',10,10,400,480);"><img src="#my.folder.url##qFiles.name#" title="View Image" width="100"/></a>
							<cfset ScriptName = "GetCodeImage">
						<cfelseif ListContains(".doc", FileExt,",")>
							<img src="#pathto(fusebox.thisCircuit,'url')#images/worddoc.gif" title="Word Document"/>
						<cfelseif ListContains(".txt", FileExt,",")>
							<img src="#pathto(fusebox.thisCircuit,'url')#images/icontext.gif" title="Text Document"/>
						<cfelseif ListContains(".xls", FileExt,",")>
							<img src="#pathto(fusebox.thisCircuit,'url')#images/iconxl.gif" title="Excel Document"/>
						<cfelseif ListContains(".ppt", FileExt,",")>
							<img src="#pathto(fusebox.thisCircuit,'url')#images/iconppt.gif" title="Power Point Document"/>
						<cfelseif ListContains(".pdf", FileExt,",")>
							<img src="#pathto(fusebox.thisCircuit,'url')#images/iconpdf.gif" title="PDF Document"/>
						<cfelseif ListContains(".zip", FileExt,",")>
							<img src="#pathto(fusebox.thisCircuit,'url')#images/iconzip.gif" title="ZIP File"/>
						<cfelseif ListContains(".vsd", FileExt,",")>
							<img src="#pathto(fusebox.thisCircuit,'url')#images/iconvisio.gif" title="Visio Document"/>
						<cfelse>
							<style type="text/css">
								.FileType SPAN {
									font-size: 14px;
									font-weight: bold;
									color: black;
									width: 20px;
									height: 32px;
									border: solid 1px gray;
									padding: 2px;
								}
								.Filetype {
									width: 20px;
									height: 32px;
									margin: 3px;
									border-right: solid 2px silver;
									border-bottom: solid 2px silver;
								}
							</style>
							<div class="FileType" align="center"><span>#ucase(FileExt)#</span></div>
						</cfif>
						</div>
						<div class="FileInfo"><b>NAME:</b> #qFiles.Name#</div>
						<div class="FileInfo"><b>SIZE:</b> #qFiles.Size#</div>
						<div class="FileInfo"><b>LAST MODIFIED:</b> #qFiles.DateLastModified#</div>
						<div class="FileMenu" align="center">
							<a href="javascript:DeleteConfirm('#URLEncodedFormat(qFiles.name)#');">Delete</a>
							- <a href="javascript:#ScriptName#('#URLEncodedFormat(qFiles.name)#');">Get Code</a>
							<cfif isDefined('attributes.fromEditor')>
								<cfif ListContains(".gif,.jpg,.bmp,.png", FileExt,",")>
									- <a href="javascript:insertImageFile('#URLEncodedFormat(qFiles.name)#');">Insert Image</a>
								<cfelse>
									- <a href="javascript:createLink('#URLEncodedFormat(qFiles.name)#');">Insert Link</a>
								</cfif>
							</cfif>
						</div>
					</td>
					<!--- Start Next Row --->
					<cfif i eq Columns>
						</tr><tr>
						<cfset i = 0>
					</cfif>
				</cfif>
			</cfloop>
		<tr>
			<td colspan="#Rows#">
				<cfinclude template="dsp_ResultNav.cfm">			
			</td>
		</tr>
		<tr>
			<form name="Code">
			<td colspan="#Rows#" align="center">
				Align Image:
				Left <input type="Radio" name="AlignButton" onclick="Code.align.value='left';" checked/>
				Right <input type="Radio" name="AlignButton" onclick="Code.align.value='right';"/><br>
				<input type="Hidden" name="align" value="left"/>
				<textarea name="CodeBox" class="myTextarea" style="width:100%; height:50px;"></textarea>
				<div style="font-size:11px;"><b>To use this code:</b> Click the text box - press CTRL+A - press CTRL+C.</div>
				<div style="font-size:11px;">Go to your page text above where you want the image to show up and press CTRL+V.</div>
				<div style="font-size:11px;">If it is a file you can now edit where it says 'YOUR TEXT'.</div>
			</td>
			</form>
		</tr>
	</table>
</cfif>

</cfoutput>