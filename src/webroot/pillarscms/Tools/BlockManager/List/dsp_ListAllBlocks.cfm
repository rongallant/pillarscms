<style type="text/css">
	.myColumns {
		font-size: 14px;
		color: #FFFFFF;
		background-color: #666666;
	}
	.myFieldTitle A, .myFieldTitle A:visited {
		color: #333333;
		text-decoration: none;
	}
	.myFieldTitle A:hover {
		text-decoration: underline;
		color: #FFFFFF !important;
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
		<th class="myColumns">Delete</th>
	</tr>
<cfloop query="qBlockPages">
	<cfquery name="qBlocks" datasource="#my.db.dsn#">
		SELECT
			a.blockid,
			a.blockidlist,
			a.layout,
			a.layoutarea,
			a.orderby,
			a.blocktitle,
			a.displaymode,
			a.orderby,
			b.blocktypeid,
			b.displayname,
			c.pg_id AS pageid,
			c.pg_title AS pagetitle
		FROM #my.db.tableprefix#_Blocks AS a
		JOIN #my.db.tableprefix#_BlockTypes AS b
			ON a.fk_blocktypeid = b.blocktypeid
		LEFT OUTER JOIN #my.db.tableprefix#_pgPages AS c
			ON a.fk_pageid = c.pg_id
		WHERE c.pg_id = '#qBlockPages.pageid#'
		ORDER BY c.pg_title, a.layoutarea, a.orderby
	</cfquery>
	<cfoutput>
	<tr>
		<td class="myFieldTitle" colspan="6">
			<!--- This enables single page display
			<a href="#myself##xfa.PageBlocks#&pageid=#qBlocks.pageid#"></a>--->
			<cfif qBlocks.displaymode eq 0>#qBlocks.pagetitle#<cfelse>All Pages</cfif>
		</td>
	</tr>
	</cfoutput>
	<cfif qBlocks.recordcount gt 0>
		<cfoutput query="qBlocks" group="layoutarea">
			<cfset gCount = 0 />
			<cfoutput>
				<cfquery name="qGroup" dbtype="query">
					SELECT layoutarea
					FROM qBlocks
					WHERE layoutarea = '#qBlocks.layoutarea#'
				</cfquery>
				<cfset gCount = gCount + 1 />
				<cfscript>
					tmp = ListFunctions(qBlocks.currentrow);
					if(qBlocks.currentrow mod 2) thisClass="myRow1"; else thisClass="myRow2";
				</cfscript>
				<tr class="#thisClass#">
					<td>
						<cfif gCount gt 1>
							<a href="#myself##xfa.ChangeOrder#&blockid=#qBlocks.blockid#&go=up">
								<img src="#pathto('ContentEditor','url')#tree/iconup.gif" width="10" height="9" border="0" alt="Up" /></a>
						<cfelse>
							<img src="#pathto('ContentEditor','url')#tree/spacer.gif" width="10" height="9" border="0" alt="" />
						</cfif>
							<img src="#pathto('ContentEditor','url')#tree/spacer.gif" width="1" height="9" border="0" alt="" />
						<cfif gCount lt qGroup.recordcount>
							<a href="#myself##xfa.ChangeOrder#&blockid=#qBlocks.blockid#&go=down">
								<img src="#pathto('ContentEditor','url')#tree/icondown.gif" width="10" height="9" border="0" alt="Down" /></a>
						<cfelse>
							<img src="#pathto('ContentEditor','url')#tree/spacer.gif" width="10" height="9" border="0" alt="" />
						</cfif>
					</td>
					<td nowrap="nowrap">#qBlocks.layoutarea#</td>
					<td>#qBlocks.blocktitle#</td>
					<td>#qBlocks.displayname#</td>
					<td>#qBlocks.layout#</td>
					<td align="center">
					<a href="#myself##xfa.DeleteBlock#&blockid=#qBlocks.blockid#">
					<img src="designs/tools/main/icons/icondelete.gif" width="15" height="15" border="0" alt="Delete #qBlocks.blocktitle#" /></a></td>
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
</cfloop>
	<tr>
		<td class="myFieldTitle" width="30"><img src="assets/images/spacer.gif" width="30" height="1" alt="" border="0" /></td>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="100" height="1" alt="" border="0" /></td>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="1" height="1" alt="" border="0" /></td>
	</tr>
</table>