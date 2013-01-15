<cfinclude template="../../../tags/ListFunctions.cfm" />
<cfparam name="attributes.startrow" default="1" />
<cfparam name="attributes.maxrows" default="30" />

<cfsavecontent variable="toHead">
	<cfoutput>
	<script type="text/javascript">
		function VerifyDelete(id,Order) {
			ErrorMsg = "Are you sure you want to report this entry?";
			if(confirm("Are you sure you want to delete the entry " + id + "?")) {
				location.replace("#myself##xfa.delete#&Order=" + Order + "&usrid=" + id);
			}
		}
	</script>
	</cfoutput>
	<script src="assets/scripts/RowHighlighter.js" type="text/javascript"></script>
	<cfoutput>#ListScripts()#</cfoutput>
</cfsavecontent>
<cfhtmlhead text="#toHead#">

<table cellpadding="0" cellspacing="0" border="0" bgcolor="white" width="100%">
	<tr>
		<td>
			<table cellpadding="3" cellspacing="1" border="0" class="TableBorder" width="100%">

			<cfoutput>
				<tr>
					<td colspan="3">
					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<td align="left">
							<cfif isDefined('attributes.order')><cfset attString = "&order=#attributes.order#" /><cfelse><cfset attOrder="" /></cfif>
							<cfif isDefined('attributes.appid')><cfset attString = "#attString#&appid=#attributes.appid#" /></cfif>					
							<cfif isDefined('attributes.usrid')><cfset attString = "#attString#&usrid=#attributes.usrid#" /></cfif>	
							<cfif attributes.startrow gt 1>
								<cfset attributes.back = attributes.startrow-attributes.maxrows>
								<a href="#myself##attributes.fuseaction#&startrow=#attributes.back##attString#">&lt;&lt; Last #attributes.maxrows#</a>
							</cfif>
							<cfset attributes.next = attributes.startrow+attributes.maxrows>
							<cfif (attributes.startrow gt 1) and (attributes.startrow+attributes.maxrows lte getMessages.recordcount)>-</cfif>
							<cfif attributes.startrow+attributes.maxrows lte getMessages.recordcount>
								<a href="#myself##attributes.fuseaction#&startrow=#attributes.next##attString#">Next #attributes.maxrows# &gt;&gt;</a>
							</cfif>
						</td>
						<td align="right" colspan="2">
							<div style="color:##006CDE;">There are <b>#getMessages.RecordCount#</b> entries</div>
						</td>
					</table>
					</td>
				</tr>
				<tr class="ListHeader">
					<th align="center"><a href="#self#?#cgi.query_string#&order=username"><div class="ListHeader">User Name</div></a></th>
					<th><a href="#self#?#cgi.query_string#&order=lastname"><div class="ListHeader">Name</div></a></th>
					<th><div class="ListHeader">Status</div></th>
				</tr>
			</cfoutput>
			
			<cfif not getMessages.recordcount>			
				<tr>
					<td colspan="2">
						<cfoutput><p>There are no users listed under '#qAppInfo.name#'.</p></cfoutput>
					</td>
				</tr>
			<cfelse>

			<cfparam name="request.trbgcolor" default="1">
			<cfoutput query="getMessages" startrow="#attributes.startrow#" maxrows="#attributes.maxrows#">
				#ListFunctions(getMessages.currentrow)#
				<tr #hoverCode#>
					<td align="center"><a href="#myself##xfa.Edit#&usrid=#getMessages.usrid#" title="Edit #trim(getMessages.FirstName)# #trim(getMessages.LastName)#">#getMessages.usrid#</a></td>
					<td><a href="#myself##xfa.Edit#&usrid=#getMessages.usrid#" title="Edit #trim(getMessages.FirstName)# #trim(getMessages.LastName)#">#trim(getMessages.LastName)#<cfif trim(getmessages.lastname) neq "">, </cfif>#trim(getMessages.FirstName)#</a></td>
					<td align="center"><a href="#myself##xfa.Edit#&usrid=#getMessages.usrid#" title="Edit #trim(getMessages.FirstName)# #trim(getMessages.LastName)#">
						<cfif trim(getMessages.Enabled) eq 1><span style="font-weight:bold;color:Green;">Yes</span><cfelse><span style="font-weight:bold;color:Red;">No</span></cfif>			
					</a></td>
				</tr>
			</cfoutput>
			</cfif>
			
			<cfoutput>
				<tr id="FormHeader">
					<td><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1"></td>
					<td width="100%"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3">
					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<td align="left">
							<cfif isDefined('attributes.order')><cfset attString = "&order=#attributes.order#"><cfelse><cfset attOrder=""></cfif>
							<cfif isDefined('attributes.appid')><cfset attString = "#attString#&appid=#attributes.appid#"></cfif>					
							<cfif isDefined('attributes.usrid')><cfset attString = "#attString#&usrid=#attributes.usrid#"></cfif>	
		
							<cfif attributes.startrow gt 1>
								<cfset attributes.back = attributes.startrow-attributes.maxrows>
								<a href="#myself##attributes.fuseaction#&startrow=#attributes.back##attString#">&lt;&lt; Last #attributes.maxrows#</a>
							</cfif>
							<cfset attributes.next = attributes.startrow+attributes.maxrows>
							<cfif (attributes.startrow gt 1) and (attributes.startrow+attributes.maxrows lte getMessages.recordcount)>-</cfif>
							<cfif attributes.startrow+attributes.maxrows lte getMessages.recordcount>
								<a href="#myself##attributes.fuseaction#&startrow=#attributes.next##attString#">Next #attributes.maxrows# &gt;&gt;</a>
							</cfif>
						</td>
						<td align="right" colspan="3">
							<div style="color:##006CDE;">There are <b>#getMessages.RecordCount#</b> entries</div>
						</td>
					</table>
					</td>
				</tr>
			</cfoutput>
			</table>
		</td>
	</tr>
</table>