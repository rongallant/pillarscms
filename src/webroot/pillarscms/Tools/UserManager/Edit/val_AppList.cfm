<cfimport prefix="sec" taglib="../../../" />
<cfset request.qforms = 1 />
<cfoutput>
<script type="text/javascript">
	// initialize the qForm object
		appForm = new qForm("AppForm");

	// Add events to the buttons
	<sec:security rights="600">
		appForm.addButton.addEvent("onclick", "popupPage('#myself##xfa.EditApp#&usrid=#attributes.usrid#','yes',10,10,640,300);");
	</sec:security>
</script>
</cfoutput>