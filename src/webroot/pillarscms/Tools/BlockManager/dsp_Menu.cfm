<cfimport prefix="sec" taglib="../../">
<cfoutput>
<ul>
	<li><a href="#myself##xfa.Menu1#">Admin Menu</a></li>

	<sec:security tableprefix="#my.db.tableprefix#" thisapp="#my.site.name#" rights="100">
	<li><a href="#myself##xfa.Menu2#">List Blocks</a></li>
	</sec:security>

	<sec:security tableprefix="#my.db.tableprefix#" thisapp="#my.site.name#" rights="600">
	<li><a href="#myself##xfa.Menu3#">New Block</a></li>
	</sec:security>
</ul>
</cfoutput>