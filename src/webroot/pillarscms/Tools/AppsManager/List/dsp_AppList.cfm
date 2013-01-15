<cfset request.count = "#Applications.RecordCount#" />
<cfset request.secondrow = "#Round(request.Count / 2)#" />
<cfset request.secondrow1 = "#Round(request.Count / 2 + 1)#" />

<table cellpadding="3" cellspacing="1" border="0" width="100%">
<cfoutput>
	<tr valign="top" align="center">
		<td width="50%" bgcolor="white">
		<cfloop query="Applications" startrow="1" endrow="#request.SecondRow#">
		<b><a href="#myself##xfa.GetApp#&Application=#Applications.Application#"><div class="StartMenu">#Applications.Application#</div></a></b>
		</cfloop></td>
		<td width="50%" bgcolor="white">
		<cfloop query="Applications" startrow="#request.SecondRow1#" endrow="#request.Count#">
		<b><a href="#myself##xfa.GetApp#&Application=#Applications.Application#"><div class="StartMenu">#Applications.Application#</div></a></b>
		</cfloop></td>
	</tr>
</cfoutput>
</table>