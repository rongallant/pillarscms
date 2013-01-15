<style type="text/css">
	.myColumns {
		font-size: 14px;
		color: #FFFFFF;
		background-color: #666666;
	}
</style>

<cfoutput>#ListScripts()#</cfoutput>
<table cellpadding="2" cellspacing="2" width="100%">
	<tr>
		<th class="myColumns">Order</th>
		<th class="myColumns">Layout Area</th>
		<th class="myColumns">Block Title</th>
		<th class="myColumns">Block Type</th>
		<th class="myColumns">Layout</th>
		<th class="myColumns"></th>
	</tr>
	<cfoutput>
	<tr>
		<td class="myFieldTitle" colspan="6">
			<cfif qBlocks.displaymode eq 0>#qBlocks.pagetitle#<cfelse>All Pages</cfif>
		</td>
	</tr>
	</cfoutput>
	<cfif qBlocks.recordcount gt 0>
		<cfoutput query="qBlocks" group="layoutarea">
			#ListFunctions(qBlocks.currentrow)#
			<cfset gCount = 0 />
			<cfoutput>
				<cfquery name="qGroup" dbtype="query">
					SELECT layoutarea
					FROM qBlocks
					WHERE layoutarea = '#qBlocks.layoutarea#'
				</cfquery>
				<cfset gCount = gCount + 1 />
				<tr #hoverCode#>
					<td>
						<cfif gCount gt 1>
							<a href="#myself##xfa.ChangeOrder#&blockid=#qBlocks.blockid#&go=up">
								<img src="#pathto('ContentEditor','url')#tree/iconup.gif" width="10" height="9" alt="Up" border="0" /></a>
						<cfelse>
							<img src="#pathto('ContentEditor','url')#tree/spacer.gif" width="10" height="9" border="0" />
						</cfif>
							<img src="#pathto('ContentEditor','url')#tree/spacer.gif" width="1" height="9" border="0" />
						<cfif gCount lt qGroup.recordcount>
							<a href="#myself##xfa.ChangeOrder#&blockid=#qBlocks.blockid#&go=down">
								<img src="#pathto('ContentEditor','url')#tree/icondown.gif" width="10" height="9" alt="Down" border="0" /></a>
						<cfelse>
							<img src="#pathto('ContentEditor','url')#tree/spacer.gif" width="10" height="9" border="0" />
						</cfif>
					</td>
					<td nowrap="nowrap">#qBlocks.layoutarea#</td>
					<td>#qBlocks.blocktitle#</td>
					<td>#qBlocks.displayname#</td>
					<td>#qBlocks.layout#</td>
					<td><a href="#myself##xfa.DeleteBlock#&blockid=#qBlocks.blockid#">Delete</a></td>
				</tr>
			</cfoutput>
		</cfoutput>
	<cfelse>
		<tr>
			<td colspan="6">
				<p>There are no blocks.</p>
			</td>
		</tr>
	</cfif>
	<tr>
		<td class="myFieldTitle" width="30"><img src="assets/images/spacer.gif" width="30" height="1" alt="" border="0" /></td>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="100" height="1" alt="" border="0" /></td>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>
	</tr>
</table>