<cfsavecontent variable="toHead">
	<script type="text/javascript">
		function VerifyDelete(id,Order) {
			ErrorMsg = "Are you sure you want to report this entry?";
			if(confirm("Are you sure you want to delete the entry " + id + "?")) {
				location.replace("#myself##xfa.delete#&Order=" + Order + "&appid=" + id);
			}
		}
	</script>
</cfsavecontent>
<cfhtmlhead text="#toHead#" />

<!--- URL Management --->
<cfscript>
	function removeQS(qstring,qsentry) {
		var a = listToArray(qstring,"&");
		var i = 0;
		for (i = 1; i lte arrayLen(a); i = i + 1) {
			if ( a[i] contains qsentry ) {
				ArrayDeleteAt(a,i);
			}
		}
		return ArrayToList(a,"&");		
	}
</cfscript>

<cfset currentQS = "" />
<cfif isDefined('attributes.fuseaction')><cfset currentQS = currentQS & "&fuseaction=#attributes.fuseaction#" /></cfif>
<cfif isDefined('attributes.pageid')><cfset currentQS = currentQS & "&pageid=#attributes.pageid#" /></cfif>
<cfif isDefined('attributes.order')><cfset currentQS = currentQS & "&order=#attributes.order#" /></cfif>

<cfparam name="attributes.currentpage" default="1"/>
<cfimport prefix="tag" taglib="../../../tags/" />
<tag:pagethru
	totalrecords="#qApps.recordcount#"
	currentpage="#attributes.currentpage#"
	displaycount="20"
	addedpath="#currentQS#"
	templateurl="#self#"
	usetablehtml=true
	imagepath="NONE"
	HiLiteColor="##FF7300"
>

<cfoutput>
#ListScripts()#
<table cellpadding="2" cellspacing="2" border="0">
	<tr>
		<th class="myFieldTitle"><a href="#self#?#removeQS(currentQS,'order')#&order=enabled">Display</a></th>
		<th class="myFieldTitle"><a href="#self#?#removeQS(currentQS,'order')#&order=name">App</a></th>
		<th class="myFieldTitle"><a href="#self#?#removeQS(currentQS,'order')#&order=description">Description</a></th>
	</tr>
		<cfif qApps.recordcount gt 0>
			<cfloop query="qApps" startrow="#PT_StartRow#" endrow="#PT_EndRow#">
				<cfscript>
					tmp = ListFunctions(qApps.currentrow);
					if(qApps.currentrow mod 2) thisClass="myRow1"; else thisClass="myRow2";
				</cfscript>
				<tr #hoverCode# onclick="window.location='#myself##xfa.Edit#&appid=#qApps.appid#';" class="#thisClass#">
					<td style="cursor:hand;" align="center">
						<cfif qApps.enabled eq 1>
							<img src="#my.design.folder##my.theme.folder#icons/iconcheckmark.gif" width="15" height="14" alt="yes" border="0" />
						<cfelse>
							<img src="#my.design.folder##my.theme.folder#icons/icondelete.gif" width="15" height="15" alt="no" border="0" />
						</cfif>
					</td>
					<td style="cursor:hand;">#qApps.name#</td>
					<td style="cursor:hand;">
						<cfif len(qApps.description) lt 60>
							#qApps.description#
						<cfelse>
							#left(qApps.description,57)#...
						</cfif>
					</td>
				</tr>
			</cfloop>
		<cfelse>
			<tr>
				<td colspan="3"><p>There are no entries.</p></td>
			</tr>
		</cfif>
	<tr>
		<td class="myFieldTitle" width="50"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1" alt="" /></td>
		<td class="myFieldTitle" width="200"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="200" height="1" alt="" /></td>
		<td class="myFieldTitle" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="150" height="1" alt="" /></td>
	</tr>
	<tr>
		<td align="left" colspan="2">#PT_PageThru#</td>
		<td align="right"><div>There are <strong>#qApps.RecordCount#</strong> entries</div></td>
	</tr>
</table>
</cfoutput>