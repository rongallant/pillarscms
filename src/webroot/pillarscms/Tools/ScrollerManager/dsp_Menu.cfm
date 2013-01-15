<cfimport prefix="sec" taglib="../../">
<cfoutput>
<ul>
	<li><a href="#myself##xfa.Menu1#">Admin Home</a></li>
	<sec:security rights="800">
		<li><a href="#myself##xfa.Menu2#">New Scroller</a></li>
	</sec:security>
</ul>
</cfoutput>