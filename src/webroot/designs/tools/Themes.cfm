<cflock scope="application" timeout="5" type="EXCLUSIVE">
	<cfscript>
		application.my.tools = StructNew();
		application.my.tools.design = StructNew();
		application.my.tools.design.folder = "designs/tools/";	// Theme name
		application.my.tools.main = StructNew();
		application.my.tools.main.name = "Webutils, Blue";				// Design / Theme Name (Design,Theme)
		application.my.tools.main.folder = "main/";						// Theme folder
	</cfscript>
</cflock>