<style type="text/css">
	.lightrow {}
	.darkrow {
		background-color: WhiteSmoke;
	}
</style>
<cfoutput>#ListScripts()#</cfoutput>
<table cellpadding="3" cellspacing="3" border="0" width="100%">
<cfform name="List" action="#self#" method="POST">
<cfoutput query="qEntries">
	#ListFunctions(qEntries.currentrow)#
	<tr #hoverCode#>
		<td><a href="#myself##xfa.Edit#&entryid=#qEntries.entryid#&scrollerid=#attributes.scrollerid#" style="text-decoration:none;">#qEntries.linktext#</a></td>
	</tr>
</cfoutput>
<cfif qEntries.recordcount eq 0>
	<tr>
		<td>
			<p style="font-weight:bold;">There are no records</p>
		</td>
	</tr>
</cfif>
</cfform>
</table>