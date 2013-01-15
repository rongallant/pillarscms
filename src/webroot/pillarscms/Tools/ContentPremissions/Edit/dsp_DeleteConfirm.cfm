<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="dsp_Delete" language="ColdFusion">
	<responsibilities>
		I display a warning to the user saying there are constraints associated with this application.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="update" date="2003-07-09" comments="reverse order of yes or no choices" />
		<history email="ron@rongallant.com" type="create" />
	</properties>
	<io>
		<in>
			<string name="qApp.name" />
			<string name="self" />
			<string name="xfa.edit" />
			<string scope="attributes" name="appid" />
			<string name="xfa.delete" />
		</in>
		<out>
			<string name="fuseaction" />
			<string name="appid" />
		</out>
	</io>
</fusedoc>
--->

<cfoutput>
<table cellpadding="10" cellspacing="0" border="0" width="100%">
	<tr>
		<td bgcolor="white">
			<p align="center" style="font-size:18px;"><b>Are you sure you want to delete "#qApp.name#"?</b></p>
			
			<p>Deleting this entry will prevent access to the application. Also the application will not work simply by re-adding the application to this database.</p>

			<p align="center">
				<a href="#self#?fuseaction=#xfa.delete#&appid=#attributes.appid#" onclick="return confirm('Are you sure? You cannot undo this action.');"><span style="color:green;font-size:18px;">YES - Delete "#qApp.name#"</span></a>
				<span style="padding:0 20 0 20;font-weight:bold;">OR</span>
				<a href="#self#?fuseaction=#xfa.edit#&appid=#attributes.appid#"><span style="color:red;font-size:18px;">NO - Cancel and return</span></a>
			</p>
		</td>
	</tr>
</table>
</cfoutput>