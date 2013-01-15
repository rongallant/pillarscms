<script>
	function submitThisForm(formname) {
		document.forms[formname].submit();
	}
</script>

<cfoutput>
<!--- I output the styles and javascript needed to support the list functions. --->
#ListStyles()#
#ListScripts()#
<table cellpadding="2" cellspacing="2" width="100%">
	<tr>
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
			<tr onClick="submitThisForm('add#qCat.currentrow#Block');" #hoverCode# class="#thisClass#">
				<td>
					#qCat.title#
					<form name="add#qCat.currentrow#Block" action="#self#" method="post">
						#formToHidden("fuseaction,fieldnames,submitButton")#
						<input type="hidden" name="fuseaction" id="fuseaction" value="#xfa.SelectBlock#" />
						<input type="hidden" name="blockidlist" id="blockidlist" value="#qCat.catid#" />
						<input type="hidden" name="blocktitle" id="blocktitle" value="#qCat.title#" />
					</form>
				</td>
			</tr>
		</cfloop>
	<cfelse>
		<tr>
			<td><p>There are no Categories.</p></td>
		</tr>
	</cfif>
	<tr>
		<td class="myFieldTitle" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="1" height="1" /></td>
	</tr>
</table>

</cfoutput>