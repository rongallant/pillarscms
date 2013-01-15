<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
	<io>
		<in>
			<string name="" />
		</in>
		<out>
			<string name="" />
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.filetype" default="all">

<cfswitch expression="#attributes.filetype#">

	<cfcase value="wordproccessor">
		<cfset attributes.filter = ".doc,.xls,.txt,.rtf,.ppt">
	</cfcase>

	<cfcase value="images">
		<cfset attributes.filter = ".gif,.jpg,.png,.bmp">
	</cfcase>

	<cfcase value="pdfs">
		<cfset attributes.filter = ".pdf">
	</cfcase>

	<cfcase value="zips">
		<cfset attributes.filter = ".zip">
	</cfcase>

	<cfdefaultcase>
		<cfset attributes.filter = "">
	</cfdefaultcase>

</cfswitch>