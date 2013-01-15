<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
// fDelete
	deleteFolder= new qForm("fDelete");
	function confirmDelete() {
		if ( confirm("Are you sure you want to delete this folder?") )
			deleteFolder.submit();
	}
	deleteFolder.submitbutton.addEvent("onClick","confirmDelete()");
</script>
</cfoutput>