<cfscript>
	my.site.name = "PagePermissions";
	my.layout.mainmenu = "#fusebox.thisCircuit#.menu";
</cfscript>

<cfimport prefix="sec" taglib="../../" />
<sec:security rights="800" errorpage="#my.site.noauth#">