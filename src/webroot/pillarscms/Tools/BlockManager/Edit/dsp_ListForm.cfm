<cfquery name="qBlockType" datasource="#my.db.dsn#">
	SELECT blockselectfuseaction, blockfuseaction
	FROM #my.db.tableprefix#_BlockTypes
	WHERE blocktypeid = '#attributes.blocktypeid#'
</cfquery>

<cfoutput>
	<form name="myForm" action="#self#" method="post">
		#formToHidden("fuseaction,fieldnames,submitButton")#
		<input type="hidden" name="fuseaction" id="fuseaction" value="#qBlockType.blockselectfuseaction#" />
		<input type="hidden" name="blockfuseaction" id="blockfuseaction" value="#qBlockType.blockfuseaction#" />
	</form>
	<script type="text/javascript">
		document.forms['myForm'].submit();
	</script>
</cfoutput>