<cfimport prefix="sec" taglib="../../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="Menu">
		<cfset xfa.Menu1 = "tools.home" />
		<cfset xfa.Menu2 = "scrollers.new" />
		<cfinclude template="dsp_Menu.cfm" />
	</cfcase>

	<cfcase value="home">
		<sec:security rights="200">
		<cfset xfa.SetPage = "entries.list" />
		<cfset xfa.EditScroller = "scrollers.edit" />
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="qry_Scrollers.cfm" />
		<cfinclude template="dsp_Home.cfm" />
		<cfset my.page.title = "Scroller Maintenance" />
		<cfset my.page.heading = my.page.title />
		<cfset my.page.subheading = "What scroller do you want to edit?" />
		<cfset my.site.topmenu = "#fusebox.thisCircuit#.menu" />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>