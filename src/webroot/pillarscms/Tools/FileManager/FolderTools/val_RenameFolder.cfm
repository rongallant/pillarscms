<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
// fRename
	renameFolder = new qForm("fRename");
	renameFolder.newname.required = true;
	renameFolder.newname.validateReqEx(/^\w{1,}$/,"You must use only alpha numeric characters. Use underscores instead of spaces.");
</script>
</cfoutput>