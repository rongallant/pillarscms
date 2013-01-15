<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="flash">
		<cfset xfa.Settings = "#fusebox.thisCircuit#.FlashSettings" />
		<cfset xfa.Entries = "#fusebox.thisCircuit#.FlashEntries" />
		<cfinclude template="qry_Scroller.cfm" />
		<cfinclude template="dsp_FlashScroller.cfm" />
		<cfparam name="attributes.blocktitle" default="">
		<cfset my.page.heading = attributes.blocktitle />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="FlashSettings">
		<cfinclude template="qry_Scroller.cfm" />
		<cfinclude template="xml_FlashSettings.cfm" />
		<cfabort>
	</cfcase>

	<cfcase value="FlashEntries">
		<cfinclude template="qry_Scroller.cfm" />
		<cfinclude template="xml_FlashEntries.cfm" />
		<cfabort>
	</cfcase>

	<cfcase value="applet">
		<cfparam name="attributes.scrollerid" />
		<cfinclude template="qry_Scroller.cfm" />
		<cfinclude template="dsp_JavaScroller.cfm" />
		<cfparam name="attributes.blocktitle" default="">
		<cfset my.page.heading = attributes.blocktitle />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>