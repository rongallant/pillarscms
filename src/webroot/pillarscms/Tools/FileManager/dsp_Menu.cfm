<cfimport prefix="sec" taglib="../../">

<cfoutput>
<ul>
	<li><a href="#myself##xfa.Menu1#">Admin Home</a></li>
	<li><a href="#myself##xfa.Menu2#"<cfif caller.attributes.fuseaction eq xfa.Menu1> id="me"</cfif>>Browse Files</a></li>
	<sec:security rights="500">
		<li><a href="#myself##xfa.Menu3#"<cfif caller.attributes.fuseaction eq xfa.Menu2> id="me"</cfif>>Upload File</a></li>
		<li><a href="#myself##xfa.Menu4#"<cfif caller.attributes.fuseaction eq xfa.Menu3> id="me"</cfif>>Create Folder</a></li>
	</sec:security>
</ul>
</cfoutput>