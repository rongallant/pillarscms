<table border="0" cellspacing="0" cellpadding="0">
<cfoutput>
<form name="myForm" action="#self#" method="post">
	<input type="Hidden" name="usrid" value="#attributes.usrid#"/>
	<input type="Hidden" name="fuseaction" value="#xfa.UpdateApps#"/>
</cfoutput>
	<tr>
		<td align="Left" valign="Top">
			<b>My Groups:</b><br>
			<select name="myapps" size="8" multiple style="width: 250px;">
				<cfoutput query="getMessages" group="usrid">
					<cfif len(trim(getMessages.name))>
						<cfoutput>
							<option value="#trim(getMessages.appid)#">#trim(getMessages.name)#</option>
						</cfoutput>
					</cfif>
				</cfoutput>
			</select>
		</td>
		<td width="50" align="Center" valign="Middle">
			<input type="Button" value="&lt;" name="transferTo" style="width:30px;"/><br/>
			<br/>
			<input type="Button" value="&gt;" name="transferFrom" style="width:30px;"/><br/>
		</td>
		<td align="Left" valign="Top">
			<b>Available Groups:</b><br/>
			<select name="appid" size="8" style="width:250px;">
				<cfoutput query="qApps">
					<cfif len(trim(qApps.name))>
						<option value="#trim(qApps.appid)#">#trim(qApps.name)#</option>
					</cfif>
				</cfoutput>
			</select>
		</td>
	</tr>
	<tr class="TDBackground">
		<td align="center" colspan="3" style="padding: 3px;">
			<input type="Button" name="Update" value="Update Groups" id="buttons" style="cursor:hand;"/>
		</td>
	</tr>
</form>
</table>