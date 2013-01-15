<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
</fusedoc>
--->

<cfparam name="attributes.errorcode" default="" />

<cfswitch expression="#attributes.errorcode#">

	<cfcase value="1">
		<p style="color:red;font-weight:bold;">- You cannot Delete this issue because it contains articles. Please delete the articles first.</p>
	</cfcase>

	<cfdefaultcase></cfdefaultcase>

</cfswitch>