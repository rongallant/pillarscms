<cfimport prefix="sec" taglib="../../../">

<cfoutput>
<form name="AppForm" action="#self#" method="post">
	<input type="Hidden" name="fuseaction" id="fuseaction" value="#xfa.UpdateApps#" />
	<input type="Hidden" name="usrid" id="usrid" value="#attributes.usrid#" />
</cfoutput>
<table cellpadding="3" cellspacing="2" border="0" width="100%">
	<tr>
		<td id="FormHeader">Group</td>
		<td id="FormHeader">Permission</td>
		<td id="FormHeader">Notes</td>
	</tr>
	<cfif qAppList.recordcount lt 1>
		<tr>
			<td colspan="3">There are no results.</td>
		</tr>
	<cfelse>
		<cfparam name="count" default="0">
		<cfoutput query="qAppList">
			<cfset count = count+1>	
			<input type="Hidden" name="appid" id="appid" value="#qAppList.id#" />
			<tr>
				<td>
					<sec:security rights="500">
					<cfif request.validated>
						<a href="#myself##xfa.ModifyApp#&usrid=#attributes.usrid#&appid=#qAppList.id#">#qAppList.name#</a>
					<cfelse>
						#qAppList.name#
					</cfif>
					</sec:security>
				</td>
				<td>
					<cfswitch expression="#qAppList.Permissions#">
						<cfcase value="0">None (0)</cfcase>
						<cfcase value="100">Overview (100)</cfcase>
						<cfcase value="200">Read (200)</cfcase>
						<cfcase value="300">Comment (300)</cfcase>
						<cfcase value="400">Moderate (400)</cfcase>
						<cfcase value="500">Edit (500)</cfcase>
						<cfcase value="600">Add (600)</cfcase>
						<cfcase value="700">Delete (700)</cfcase>
						<cfcase value="800">Admin (800)</cfcase>
					</cfswitch>
				</td>
				<td>#qAppList.notes#</td>
			</tr>
		</cfoutput>
		</cfif>
	<cfoutput>
		<tr id="FormHeader">
			<td><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="150" alt="" /></td>
			<td><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="150" alt="" /></td>
			<td><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="150" alt="" /></td>
		</tr>
		<sec:security rights="600">
		<tr>
			<td colspan="3" align="center">
				<input type="Button" name="addButton" id="addButton" value="Add/Remove Groups" class="button" style="cursor:hand;" />
			</td>
		</tr>
		</sec:security>
	</cfoutput>
</table>
</form>