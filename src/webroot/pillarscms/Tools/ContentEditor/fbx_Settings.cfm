<cfimport prefix="sec" taglib="../../">

<cfscript>
	my.layout.mainmenu = "ContentEditor.menu|none";
	my.site.name = "ContentManager";
	my.site.parent = "http://yourdomain.com/";
</cfscript>

<sec:security tableprefix="#my.db.tableprefix#" thisapp="#my.site.name#" rights="100" errorpage="#my.site.noauth#">