<cfparam name="attributes.filename" pattern="\w+\.\w{3}$" />
<cfparam name="attributes.newfilename" pattern="^\w+\.\w{3}$" />

<!--- I validate the new file name --->
<cfset reg1 = "^\w+\.\w{3}$">
<cfset reg2 = "\w+\.(jpg|gif|png||fla|swf|doc|xsl|xls|ppt|doc|rtf|swf|txt)$">

<cfif not REFindNoCase(reg1, trim(attributes.newfilename))>
	<cfset request.regerror = 1>
	<p>You must use only alpha numeric characters followed by a 3 letter extention. (Use underscores instead of spaces)</p>
	<p><a href="javascript:history.back(-1);">Return</a></p>
<cfelseif not REFindNoCase(reg2, trim(attributes.newfilename))>
	<cfset request.regerror = 1>
	<p>You have tried to upload a disallowed filetype.</p>
	<p><a href="javascript:history.back(-1);">Return</a></p>
<cfelse>

	<cfscript>
		function fixSlashes(thepath) {
			var pathtype = "dir";
			if(arrayLen(arguments) gt 1) pathtype = arguments[2];
			thepath = trim(thepath);
			if ( pathtype eq "url" )
				result = ReplaceNoCase(thepath, "\", "/", "ALL");
			else // dir
				result = ReplaceNoCase(thepath, "/", "\", "ALL");
			return result;
		}
		function getPathParts(thepath) {
			thepath = fixSlashes(thepath);
			tmpFileName = ListLast(thepath,"\");
			fileparts = StructNew();
			fileparts.path = ListDeleteAt(thepath,ListLen(thepath,"\"),"\") & "\";
			fileparts.name = ListFirst(tmpFileName,".");
			fileparts.extension = lcase( ListLast(tmpFileName,".") );
			fileparts.file = fileparts.name & "." & fileparts.extension;
			tmp = fileparts.path & "\" & fileparts.name & "." & fileparts.extension;
			tmp = ListToArray(tmp,"\");
			fileparts.fixedpath = ArrayToList(tmp,"\");
			return fileparts;
		}
	
		oldfilename = getPathParts(attributes.filename);
		oldfilename.Full = my.folder.dir & oldfilename.fixedpath;
	
		newfilename = getPathParts(attributes.newfilename);
		newfilename.Full = my.folder.dir & oldfilename.path & newfilename.fixedpath;
	
	</cfscript>

	<!--- I rename the file --->
	<cfif fileexists(newfilename.Full)>
		<cfthrow type="custom" errorcode="1">
	<cfelse>
		<cflock name="#oldfilename.Full#" timeout="#my.site.filelocktimout#" type="Exclusive">
			<cffile action="RENAME" source="#oldfilename.Full#" destination="#newfilename.Full#">
		</cflock>
	</cfif>
</cfif>