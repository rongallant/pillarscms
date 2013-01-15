<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="dsp_MinimizeButton" language="ColdFusion">
	<responsibilities>
		I am a custom tag that displays the action button on the top of each form section.
		Use this code to access the tag. <cf_dsp_minimizebutton formname="YourName" status="closed">
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="update" date="2002-10-02" comments="added images and icons attributes" />
		<history email="ron@rongallant.com" type="create" date="2001-11-15" />
		<note date="2002-10-02">
			Use this around your text;
			<div id="formBusinessData" class="hiddentext"></div>
		</note>
	</properties>
	<io>
		<in>
			<structure scope="attributes">
				<string name="formName" />
				<string name="status" />
				<string name="images" />
				<string name="icons" />
			</structure>
		</in>
		<out>
			<structure scope="attributes">
				<string name="formName" />
				<string name="status" />
				<string name="images" />
				<string name="icons" />
			</structure>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.formName" default="">
<cfparam name="attributes.status" default="closed">
<cfparam name="attributes.images" default="">
<cfparam name="attributes.icons" default="">

<cfoutput>
<cfif attributes.status eq "open">
<img src="#attributes.images#pixel.gif"
	onload="expandIt(form#attributes.formName#,icon#attributes.formName#); return false"
	height="1" width="1" border="0" alt="" />
</cfif>
<img src="#attributes.icons#iconRestore.gif"
	width="18" height="16" border="0"
	name="icon#attributes.formName#" class="outline"
	onclick="expandIt(form#attributes.formName#,icon#attributes.formName#); return false"
	alt="#attributes.formName#" />
</cfoutput>