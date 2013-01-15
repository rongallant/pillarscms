<cfif qNewsScroller.recordcount gt 0>
<cfparam name="attributes.WhiteSpaces" default="10" />
<!--- Use RGB format - 99,109,173 
<cfparam name="qNewsScroller.bgcolor" default="99,109,173">--->
<!--- Center applet tex - true/false --->
<cfparam name="attributes.AppCenterText" default="false">
<!--- Set width for left and right margins --->
<cfparam name="attributes.AppLRMargins" default="5">
<!--- Color for cursor hovering over a link --->
<cfparam name="attributes.AppHLColor" default="##0099FF">
<!--- Default scroller delay --->
<cfparam name="attributes.AppScrollDelay" default="25">
<cfoutput>
<applet id="Java15" name="Java15" codebase="assets/Applets/" archive="OCVscroll.jar" code="OCVscroll.class" height="#qNewsScroller.height#" width="#qNewsScroller.width#" alt="">

	<param name="Notice" value="Smooth Scroll Up II, (c) 1997, OpenCube Technologies, Registered 12866">
	<!--- DO NOT REMOVE - used because query CurrentRow starts at 1 and applet starts at 0 --->
	
	<!--- Default Applet Properties --->
	<param name="bgcolor" value="#qNewsScroller.bgcolor#">
	<param name="centertext" value="#attributes.AppCenterText#">
	<param name="lrmargins" value="#attributes.AppLRMargins#">
	<param name="hlcolor" value="#attributes.AppHLColor#">
	<param name="scrolldelay" value="#attributes.AppScrollDelay#">
	
	<!--- The Messages --->
	<cfparam name="index" default="0">
	<cfloop query="qNewsScroller">
		<param name="delay#index#" value="#qNewsScroller.delay#">
		<param name="desturl#index#" value="#qNewsScroller.Url#">
		<param name="loadwhere#index#" value="#qNewsScroller.target#">
		<param name="fontface#index#" value="#qNewsScroller.font#">
		<param name="textcolor#index#" value="#qNewsScroller.txtcolor#">
		<param name="size#index#" value="#qNewsScroller.txtsize#">
		<param name="style#index#" value="#qNewsScroller.txtstyle#">
		<param name="desc#index#" value="#qNewsScroller.Message#">
		<cfloop index="test" from="1" to="#attributes.WhiteSpaces#">
			<cfset index = index + 1>
			<param name="desc#index#" value="">
		</cfloop>
		<cfset index = index + 1>
	</cfloop>
</applet>
</cfoutput>
</cfif>