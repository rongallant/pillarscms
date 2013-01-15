<cfif ThisTag.ExecutionMode is "Start">
	<cfparam name="attributes.totalrows">
	<cfparam name="attributes.maxrows">
	<cfparam name="attributes.startrow">
	<cfparam name="attributes.baseuri">
	<cfparam name="attributes.searchstring">
	<cfset pages=attributes.totalRows/attributes.maxrows>
	<cfoutput>
		<cfif (attributes.startrow neq 1) or (attributes.startrow lt ((Ceiling(pages)-1)*attributes.maxrows))>
		<table cellpadding="0" cellspacing="0" border="0" width="100%" class="pagination">
			<tr>
				<cfif attributes.startrow NEQ 1>
					<td align="left">
						<a href="#attributes.baseuri#&startrow=#attributes.startrow-attributes.maxrows#&#attributes.searchstring#">&lt;&lt; previous</a>
					</td>
				</cfif>
				<cfif attributes.startrow LT ((Ceiling(pages)-1)*attributes.maxrows)>
					<td align="right">
						<a href="#attributes.baseuri#&startrow=#attributes.startrow+attributes.maxrows#&#attributes.searchstring#">next &gt;&gt;</a>
					</td>
				</cfif>
			</tr>
		</table>
		</cfif>
	</cfoutput>
</cfif>