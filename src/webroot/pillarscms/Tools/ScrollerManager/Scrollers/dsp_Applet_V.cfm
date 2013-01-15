<!--- -->
<?xml version="1.0" encoding="UTF-8"?>
<fusedoc fuse="dsp_Applet_V" language="ColdFusion">
	<responsibilities>
		I display a virtical news type applet.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2002-02-22" />
		<note author="Ron Gallant" date="2002-02-21">
		<cfmodule template="#self#" fuseaction="editscroll.AppletV"
			height="20"
			width="300"
			appbgcolor="5"
			appcentertext="5"
			applrmargins="5"
			apphlcolor="5"
			appscrolldelay="5"
			contents="This is a big bunch of text.">
		</note>
	</properties>
	<io>
		<in>
			<structure scope="attributes" format="CFML">
				<string name="AppBgColor" comments="Use RGB format - 99,109,173" />
				<string name="AppCenterText" comments="Center applet tex - true/false" />
				<string name="AppLRMargins" comments="Set width for left and right margins" />
				<string name="AppHLColor" comments="Color for cursor hovering over a link" />
				<string name="AppScrollDelay" comments="Default scroller delay" />
				<string name="attributes.WhiteSpaces" comments="Number of blank entries after each entry" />
			</structure>
			<recordset name="GetMessages" format="CFML">
				<string name="Message" comments="user defined text" />
				<string name="delay" comments="2000" />
				<string name="Url" comments="http://www.yourdomain.com/" />
				<string name="target" comments="_top" />
				<string name="font" comments="verdana" />
				<string name="txtcolor" comments="white" />
				<string name="txtsize" comments="8" />
				<string name="txtstyle" comments="bold" />
			</recordset>
		</in>
	</io>
</fusedoc>
--->

<!--- Applet defaults --->
	<!--- Use RGB format - 99,109,173 --->
	<cfparam name="attributes.AppBgColor" default="99,109,173">
	<!--- Center applet tex - true/false --->
	<cfparam name="attributes.AppCenterText" default="false">
	<!--- Set width for left and right margins --->
	<cfparam name="attributes.AppLRMargins" default="5">
	<!--- Color for cursor hovering over a link --->
	<cfparam name="attributes.AppHLColor" default="##0099FF">
	<!--- Default scroller delay --->
	<cfparam name="attributes.AppScrollDelay" default="25">

<applet id="Java15" name="Java15" codebase="/assets/Scroller/assets/applets/" archive="OCVscroll.jar" code="OCVscroll.class" height="123" width="146" alt="What's New">

	<param name="Notice" value="Smooth Scroll Up II, (c) 1997, OpenCube Technologies, Registered 12866">
	<!--- DO NOT REMOVE - used because query CurrentRow starts at 1 and applet starts at 0 --->
	
	<!--- Default Applet Properties --->
	<cfoutput>
		<param name="bgcolor" value="#attributes.AppBgColor#">
		<param name="centertext" value="#attributes.AppCenterText#">
		<param name="lrmargins" value="#attributes.AppLRMargins#">
		<param name="hlcolor" value="#attributes.AppHLColor#">
		<param name="scrolldelay" value="#attributes.AppScrollDelay#">
	</cfoutput>
	
	<!--- The Messages --->
	<cfparam name="index" default="0">
	<cfoutput  query="GetMessage">
		<param name="delay#index#" value="#GetMessage.delay#">
		<param name="desturl#index#" value="#GetMessage.Url#">
		<param name="loadwhere#index#" value="#GetMessage.target#">
		<param name="fontface#index#" value="#GetMessage.font#">
		<param name="textcolor#index#" value="#GetMessage.txtcolor#">
		<param name="size#index#" value="#GetMessage.txtsize#">
		<param name="style#index#" value="#GetMessage.txtstyle#">
		<param name="desc#index#" value="#GetMessage.Message#">
		<cfloop index="test" from="1" to="#attributes.WhiteSpaces#">
		<cfset index = index+1>
		<param name="desc#index#" value="">
		</cfloop>
		<cfset index = index+1>
	</cfoutput>
</applet>