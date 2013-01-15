<cfimport prefix="sec" taglib="../../">

<cfoutput>
<style media="all" type="text/css">
	.myMainMenu LI A {
		width: 25%;
	}
</style>

<ul class="myMainMenu">
	<li><a href="#myself##xfa.Menu1#">Admin Menu</a></li>

	<sec:security tableprefix="#my.db.tableprefix#" thisapp="#my.site.name#" rights="100">
	<li><a href="#myself##xfa.Menu2#">Site Menu</a></li>
	</sec:security>

	<sec:security tableprefix="#my.db.tableprefix#" thisapp="#my.site.name#" rights="600">
	<li><a href="#myself##xfa.Menu3#">New Page</a></li>
	</sec:security>

	<sec:security tableprefix="#my.db.tableprefix#" thisapp="#my.site.name#" rights="600">
	<li><a href="#myself##xfa.Menu4#">New Link</a></li>
	</sec:security>

</ul>
</cfoutput>