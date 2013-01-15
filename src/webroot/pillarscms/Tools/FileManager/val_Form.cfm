<cfoutput>
<script type="text/javascript">
<!--//

// initialize the qForm object
	MenuForm = new qForm("myForm");

// qForm settings
	qFormAPI.errorColor = "red";

// parentid
	MenuForm.filetype.adddEvent('onChange','MenuForm.submit();');
	MenuForm.filetype.required = true;

//-->
</script>

<cfsavecontent variable="toHead">
	<script src="#my.site.qform#qforms.js"></script>
	<script type="text/javascript">
		<!--
		// set the path to the qForms directory
			qFormAPI.setLibraryPath("#my.site.qform#");
		// this loads all the default libraries
			qFormAPI.include("*");
		// this loads Ron's custom libraries
			qFormAPI.include("ronsmods");
		// -->
	</script>
</cfsavecontent>
<cfhtmlhead text="#toHead#">
</cfoutput>