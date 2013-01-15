<cfimport prefix="sec" taglib="../../../">
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="menu">
		<cfset xfa.Menu1 = "tools.home">
		<cfset xfa.Menu2 = "scroll.home">
		<cfset xfa.Menu3 = "#fusebox.thisCircuit#.new">
		<cfinclude template="dsp_Menu.cfm">
	</cfcase>

	<cfcase value="new">
		<sec:security rights="600">
		<cfset xfa.add = "#fusebox.thisCircuit#.add">
		<cfinclude template="qry_Edit.cfm">
		<cfinclude template="act_FormDefaults.cfm">
		<cfinclude template="dsp_Form.cfm">
		<cfinclude template="val_Load.cfm">
		<cfinclude template="val_Form.cfm">
		<cfset my.page.heading = "New Scroller">
		<cfset my.page.subheading = "Fill in the fields and press add to create a new scroller.">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfcase value="edit">
		<sec:security rights="500">
		<cfset xfa.add = "#fusebox.thisCircuit#.add">
		<cfset xfa.update = "#fusebox.thisCircuit#.update">
		<cfset xfa.delete = "#fusebox.thisCircuit#.delete">
		<cfinclude template="qry_ScrollerName.cfm">
		<cfinclude template="qry_Edit.cfm">
		<cfinclude template="act_FormDefaults.cfm">
		<cfinclude template="dsp_Form.cfm">
		<cfinclude template="val_Load.cfm">
		<cfinclude template="val_Form.cfm">
		<cfset my.page.heading = "Edit - #scroller.name#">
		<cfset my.page.subheading = "Modify the fields below and press update.">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfcase value="view">
		<sec:security rights="200">
		<cfinclude template="qry_ScrollerName.cfm">
		<cfinclude template="dsp_Scroller.cfm">
		<cfset my.page.heading = "View Scroller">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfcase value="AppletV">
		<cfinclude template="qry_Scroll.cfm">
		<cfinclude template="dsp_Applet_V.cfm">
		<cfset attributes.security = "no">
	</cfcase>

	<cfcase value="MarqueeH">
		<cfinclude template="qry_Scroll.cfm">
		<cfinclude template="dsp_Marquee_H.cfm">
		<cfset attributes.security = "no">
	</cfcase>

	<cfcase value="add">
		<sec:security rights="600">
		<cfset attributes.scrollerid = CreateGUID() />
		<cfinclude template="qry_Add.cfm" />
		<cflocation url="#myself#entries.list&scrollerid=#attributes.scrollerid#" addtoken="no" />
	</cfcase>

	<cfcase value="addBlock">
		<sec:security rights="600">
		<cfdump var="#attributes#" label="after tag">
		<cfinclude template="qry_Add.cfm">
	</cfcase>

	<cfcase value="update">
		<sec:security rights="500">
		<cfinclude template="qry_Update.cfm">
		<cflocation url="#myself#scroll.home" addtoken="no">
	</cfcase>

	<cfcase value="delete">
		<sec:security rights="700">
		<cfinclude template="qry_DeleteEntries.cfm">
		<cfinclude template="qry_Delete.cfm">
		<cflocation url="#myself#scroll.home" addtoken="no">
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>