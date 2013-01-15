<cflock scope="application" timeout="5" type="EXCLUSIVE">
	<cfscript>
		application.my.mainsite = StructNew();
		application.my.mainsite.design = StructNew();
		application.my.mainsite.design.folder = "designs/mainsite/";		// Theme name

		application.my.mainsite.main = StructNew();
		application.my.mainsite.main.name = "mainsite,main";				// Design / Theme Name (Design,Theme)
		application.my.mainsite.main.folder = "main/";						// Theme folder
		application.my.mainsite.main.layout = "main";						// Main Layout

		application.my.mainsite.themeone = StructNew();
		application.my.mainsite.themeone.name = "mainsite,themeone";		// Design / Theme Name (Design,Theme)
		application.my.mainsite.themeone.folder = "main/";					// Theme folder
		application.my.mainsite.themeone.layout = "themeone";				// Main Layout

		application.my.mainsite.themetwo = StructNew();
		application.my.mainsite.themetwo.name = "mainsite,themetwo";		// Design / Theme Name (Design,Theme)
		application.my.mainsite.themetwo.folder = "main/";					// Theme folder
		application.my.mainsite.themetwo.layout = "themetwo";				// Main Layout

		application.my.mainsite.themethree = StructNew();
		application.my.mainsite.themethree.name = "mainsite,themethree";	// Design / Theme Name (Design,Theme)
		application.my.mainsite.themethree.folder = "main/";				// Theme folder
		application.my.mainsite.themethree.layout = "themethree";			// Main Layout

		application.my.mainsite.themefour = StructNew();
		application.my.mainsite.themefour.name = "mainsite,themefour";		// Design / Theme Name (Design,Theme)
		application.my.mainsite.themefour.folder = "main/";					// Theme folder
		application.my.mainsite.themefour.layout = "themefour";				// Main Layout

		application.my.mainsite.homepage = StructNew();
		application.my.mainsite.homepage.name = "mainsite,homepage";		// Design / Theme Name (Design,Theme)
		application.my.mainsite.homepage.folder = "main/";					// Theme folder
		application.my.mainsite.homepage.layout = "homepage";				// Main Layout
	</cfscript>
</cflock>