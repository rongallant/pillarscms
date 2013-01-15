<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
/*  RANAME FORM  */

	// initialize the qForm object
		renameFile = new qForm("renamefile");
	
	// newfilename
		renameFile.newfilename.required = true;
	//	renameFile.newfilename.validateReqEx(/^[a-zA-Z0-9_]{1,}.[a-zA-Z]{3}$/,"You must use only alpha numeric characters followed by a 3 letter extention. (Use underscores instead of spaces)");
	//	renameFile.newfilename.validateReqEx(/^[a-zA-Z0-9_]{1,}.(jpg|gif|png||fla|swf|doc|xsl|xls|ppt|doc|rtf|swf|txt){1}$/,"You have tried to upload a disallowed filetype.");

/*  MOVE FORM  */

	// initialize the qForm object
		moveFile = new qForm("movefile");
	
	// move
		moveFile.move.required = false;

/*  DELETE FORM  */

	// initialize the qForm object
		deleteFile = new qForm("deletefile");
	
	// SubmitButton
	function DeleteConfirm() {
		if ( confirm("Are you sure you want to delete this file?") )
			deleteFile.submit();
	}
	deleteFile.SubmitButton.addEvent("onClick", "DeleteConfirm();");

</script>
</cfoutput>