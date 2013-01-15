<script type="text/javascript">
	function submitThisForm(formname) {
		document.forms[formname].submit();
	}
</script>

<cfoutput>
<!--- I output the styles and javascript needed to support the list functions. --->
#ListScripts()#
<form name="add#qCat.currentrow#Block" action="#self#" method="post">
	<input type="hidden" name="fuseaction" value="#xfa.SelectBlock#" />
	#formToHidden("fuseaction,fieldnames,submitButton")#
<table cellpadding="2" cellspacing="2" width="100%">
	<tr>
		<td class="myFieldTitle"></td>
		<td class="myFieldTitle">Title</td>
	</tr>
	<cfif qCat.recordcount gt 0>
		<cfloop query="qCat">
			<cfscript>
				tmp = ListFunctions(qCat.currentrow);
				if(qCat.currentrow mod 2) thisClass="myRow1"; else thisClass="myRow2";
				block = "#qCat.title#|bottom|fuseaction=#xfa.DisplayBlock#&catid=#qCat.catid#&layout=none";
				block = URLEncodedFormat(block);
			</cfscript>
			<tr class="#thisClass#">
				<td><input type="checkbox" name="blockidlist" value="#qCat.catid#" /></td>
				<td>#qCat.title#</td>
			</tr>
		</cfloop>
	<cfelse>
		<tr>
			<td colspan="2"><p>There are no Categories.</p></td>
		</tr>
	</cfif>
	<tr>
		<td class="myFieldTitle" width="30"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="1" height="1" /></td>
		<td class="myFieldTitle" align="right" width="100%">
			<input type="Submit" name="submitButton" value="Add Categories" />
		</td>
	</tr>
</table>
</form>
</cfoutput>