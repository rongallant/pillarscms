<cfoutput>
<div class="myForm">
	<form name="myForm" action="#self#" method="post">
		<input type="hidden" name="fuseaction" value="#xfa.update#"/>
		<cfoutput query="qSettings" group="groupid">
			<fieldset id="database">
				<legend>#qSettings.groupName#</legend>
				<div id="groupDescription">#qSettings.groupDescription#</div>
				<table cellpadding="2" cellspacing="2" border="0" width="100%">
				<cfoutput>
					<tr>
						<td class="field" width="20%" align="right" nowrap="nowrap"><label for="#qSettings.varID#">#qSettings.varTitle#</label></td>
						<td class="field" width="30%"><input type="text" name="settings_#qSettings.varID#" id="#qSettings.varID#" value="#qSettings.varValue#" class="#qSettings.VarFieldType#" size="60" /></td>
						<td class="field" width="50%"><cfif len(qSettings.varDescription)><div id="varDescription">#qSettings.varDescription#</div></cfif></td>
					</tr>
				</cfoutput>
				</table>
			</fieldset>
		</cfoutput>
		<div class="field" align="right">
			<input type="submit" name="buttonSubmit" value="Update Settings" id="buttonSubmit" class="myButton"/>
		</div>
	</form>
</div>
</cfoutput>