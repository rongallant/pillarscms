<cfif wuMenu.recordcount eq 0>
	<p>You have no applications associated with you.</p>
<cfelse>
	<cfset request.count = arraylen(myApps) />
	<cfset request.secondrow = "#Round(request.Count / 2)#" />
	<cfset request.secondrow1 = "#Round(request.Count / 2 + 1)#" />
	<cfoutput>
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr valign="top">
			<td width="50%">
				<ul class="HomepageMenu">
					<cfloop from="1" to="#request.secondrow#" index="i">
						<li><a href="#myApps[i][2]#" title="Use #myApps[i][1]#">#myApps[i][1]#</a><span class="description"> - #myApps[i][3]#</span></li>
					</cfloop>
				</ul>
			</td>
			<cfif request.count gte 2>
				<td width="50%">
				<ul class="HomepageMenu">
					<cfloop from="#request.secondrow1#" to="#request.count#" index="i">
						<li><a href="#myApps[i][2]#" title="Use #myApps[i][1]#">#myApps[i][1]#</a><span class="description"> - #myApps[i][3]#</span></li>
					</cfloop>
				</ul>
				</td>
			</cfif>
		</tr>
	</table>
	</cfoutput>
</cfif>