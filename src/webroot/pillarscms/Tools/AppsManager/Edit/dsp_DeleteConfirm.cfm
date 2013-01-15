<cfoutput>
<table cellpadding="10" cellspacing="0" border="0" width="100%">
	<tr>
		<td bgcolor="white">
			<p align="center" style="font-size:18px;"><b>Are you sure you want to delete "#qApp.name#"?</b></p>
			
			<p>Deleting this entry will prevent access to the group.</p>

			<p align="center">
				<a href="#self#?fuseaction=#xfa.delete#&appid=#attributes.appid#" onclick="return confirm('Are you sure? You cannot undo this action.');"><span style="color:green;font-size:18px;">YES - Delete "#qApp.name#"</span></a>
				<span style="padding:0 20 0 20;font-weight:bold;">OR</span>
				<a href="#self#?fuseaction=#xfa.edit#&appid=#attributes.appid#"><span style="color:red;font-size:18px;">NO - Cancel and return</span></a>
			</p>
		</td>
	</tr>
</table>
</cfoutput>