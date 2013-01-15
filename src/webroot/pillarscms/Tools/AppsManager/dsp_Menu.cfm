<cfimport prefix="sec" taglib="../../">
<cfoutput>
<ul>
	<li><a href="#myself##xfa.Menu1#">Admin Home</a></li>
	<sec:security rights="200">
		<li><a href="#myself##xfa.Menu3#">List Groups</a></li>
	</sec:security>
	<sec:security rights="600">
		<li><a href="#myself##xfa.Menu4#">New Group</a></li>
	</sec:security>
</ul>
</cfoutput>