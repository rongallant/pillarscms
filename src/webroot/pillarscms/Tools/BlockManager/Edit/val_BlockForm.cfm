<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
	objForm = new qForm("newBlocks");

// blocktitle
	objForm.blocktitle.description = "Block Title";
	objForm.blocktitle.required = true;

// blocktypeid
	objForm.blocktypeid.description = "Block Type";
	objForm.blocktypeid.required = true;

// displaypageid
	objForm.displaypageid.description = "Display Block on";
	objForm.displaypageid.required = false;

// layoutarea
	objForm.layoutarea.description = "Page Area";
	objForm.layoutarea.required = true;

// blocklayout
	objForm.blocklayout.description = "Layout";
	objForm.blocklayout.required = false;
</script>
</cfoutput>