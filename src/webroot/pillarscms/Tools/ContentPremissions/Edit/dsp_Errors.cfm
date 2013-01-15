<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="dsp_Errors" language="ColdFusion">
	<responsibilities>
		I am the errors page.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" />
	</properties>
	<io>
		<in>
			<string name="xfa.ListUsers" />
			<string name="xfa.home" />
			<string scope="attributes" name="errormsg" />
			<string scope="attributes" name="appid" />
			<string name="self" />
		</in>
		<out>
			<string scope="formOrUrl" name="fuseaction" />
			<string scope="formOrUrl" name="appid" />
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.appid" default="">

<table cellpadding="3" cellspacing="0" border="0" width="100%" bgcolor="White">
	<tr>
		<td>

<cfoutput>
<cfswitch expression="#attributes.errormsg#">

	<cfcase value="Constraints">
		<p>You must have no users listed under this application.<br>
		<a href="#self#?fuseaction=#xfa.ListUsers#&appid=#attributes.appid#">Do you want to remove them now?</a></p>
	</cfcase>

	<cfdefaultcase>
		<cf_fuseaction fuseaction="">
	</cfdefaultcase>

</cfswitch>
</cfoutput>

		</td>
	</tr>
</table>