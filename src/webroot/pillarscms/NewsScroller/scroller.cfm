<cfif thisTag.executionMode eq "start">
	<cfparam name="attributes.scrollerid" type="string" />
	<cfparam name="attributes.dsn" type="string" />
	<cfparam name="attributes.tableprefix" type="string" />
	<cfparam name="attributes.appletpath" default="/NewsScroller/Applets/" type="string" />
	<cfparam name="attributes.WhiteSpaces" default="20" type="numeric" />
	<cfparam name="attributes.Height" default="123" type="numeric" />
	<cfparam name="attributes.Width" default="139" type="numeric" />
	<cfparam name="attributes.AppBgColor" default="0,0,0" />
	<cfparam name="attributes.AppCenterText" default="false" />
	<cfparam name="attributes.AppLRMargins" default="5" />
	<cfparam name="attributes.AppHLColor" default="##0099FF" />
	<cfparam name="attributes.AppScrollDelay" default="25" />

	<cfquery name="qNewsScroller" datasource="#attributes.dsn#">
		SELECT
			a.bgcolor,
			b.entryid,
			b.message,
			b.delay,
			b.url,
			b.target,
			b.font,
			b.txtcolor,
			b.txtsize,
			b.txtstyle,
			b.scrolltype
		FROM #attributes.tableprefix#_Scrollers AS a
		LEFT JOIN #attributes.tableprefix#_ScrollEntries AS b
			ON b.fk_scrollerid = a.scrollerid
		WHERE a.scrollerid = <cfqueryparam value="#attributes.scrollerid#" cfsqltype="cf_sql_varchar" maxlength="37" />
	</cfquery>

	<cfif qNewsScroller.recordcount>
		<cfoutput>
		<applet id="#attributes.scrollerid#" name="#attributes.scrollerid#" codebase="#attributes.appletpath#" archive="OCVscroll.jar" code="OCVscroll.class" height="#attributes.Height#" width="#attributes.Width#" alt="News &amp; Notes">
			<param name="Notice" value="Smooth Scroll Up II, (c) 1997, OpenCube Technologies, Registered 12866">
			<param name="bgcolor" value="#qNewsScroller.bgcolor#">
			<param name="centertext" value="#attributes.AppCenterText#">
			<param name="lrmargins" value="#attributes.AppLRMargins#">
			<param name="hlcolor" value="#attributes.AppHLColor#">
			<param name="scrolldelay" value="#attributes.AppScrollDelay#">
			<cfparam name="index" default="0" />
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
					<cfset index = index + 1 />
					<param name="desc#index#" value="">
				</cfloop>
				<cfset index = index + 1 />
			</cfloop>
		</applet>
		</cfoutput>
	</cfif>
</cfif>