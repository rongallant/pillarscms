<!--- <cal:calendar inputField=""/> --->
<cfif thisTag.ExecutionMode eq "start">
<cfparam name="request.calcount" default="0" type="numeric"/>
<cfset request.calcount = request.calcount + 1>
<cfparam name="attributes.calpath" default="assets/jscalendar/" type="string"/>
<cfparam name="attributes.inputField" type="string"/>
<cfparam name="attributes.ifFormat" default="%m/%d/%Y" type="string"/>
<cfparam name="attributes.showsTime" default="false" type="boolean"/>
<cfparam name="attributes.singleClick" default="false" type="boolean"/>

<cfoutput>
<cfif request.calcount eq 1>
<cfsavecontent variable="toHead">
<link rel="stylesheet" type="text/css" media="all" href="#attributes.calpath#calendar-win2k-cold-1.css" title="win2k-cold-1" />
<script type="text/javascript" src="#attributes.calpath#calendar.js"></script>
<script type="text/javascript" src="#attributes.calpath#lang/calendar-en.js"></script>
<script type="text/javascript" src="#attributes.calpath#calendar-setup.js"></script>
</cfsavecontent>
<cfhtmlhead text="#toHead#">
</cfif>
<img src="#attributes.calpath#img.gif" id="calbutton_#request.calcount#" style="cursor: pointer;" title="Date selector" onmouseover="this.style.background='red';" onmouseout="this.style.background=''" />
<script type="text/javascript">
	Calendar.setup({
		inputField: "#attributes.inputField#",	// id of the input field
		ifFormat: "#attributes.ifFormat#",		// format of the input field
		showsTime: #attributes.showsTime#,		// will display a time selector
		button: "calbutton_#request.calcount#",	// trigger for the calendar (button ID)
		singleClick: #attributes.singleClick#,	// double-click mode
		step: 1									// show all years in drop-down boxes (instead of every other year as default)
	});
</script>
</cfoutput>
</cfif>