<cfimport prefix="menu" taglib="menus/">
<cfif qPage.recordcount eq 0>
	<cfthrow type="HTTP" errorcode="404" />
<cfelse>
	<cfset pagecontent = qPage.content>
	<cfoutput>
		<div class="EditableArea" id="ea#qPage.pageid#">#pagecontent#</div>
	</cfoutput>
</cfif>