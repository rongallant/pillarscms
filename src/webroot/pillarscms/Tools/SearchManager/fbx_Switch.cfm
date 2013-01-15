<cfimport prefix="sec" taglib="../../">
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="menu">
		<cfset xfa.Menu1 = "tools.home" />
		<cfset xfa.Menu2 = "#fusebox.thisCircuit#.home" />
		<cfinclude template="dsp_Menu.cfm" />
	</cfcase>

	<cfcase value="home">
		<cfset xfa.Tools = "#fusebox.thisCircuit#.CollectionTool" />
		<cfset xfa.List = "#fusebox.thisCircuit#.List" />
		<cfset xfa.Create = "#fusebox.thisCircuit#.Create" />
		<cfset xfa.Update = "#fusebox.thisCircuit#.Update" />
		<cfset xfa.Repair = "#fusebox.thisCircuit#.Repair" />
		<cfset xfa.Optimize = "#fusebox.thisCircuit#.Optimize" />
		<cfset xfa.Delete = "#fusebox.thisCircuit#.Delete" />
		<cfinclude template="dsp_Form.cfm" />
		<cfinclude template="val_Form.cfm" />
		<cfinclude template="dsp_Message.cfm" />
		<cfset my.page.heading = "Search Maintenance Form" />
		<cfset my.page.subheading = "Please enter the name of the collection and select what task you want to accomplish." />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="List">
		<sec:security rights="200" errorpage="#my.site.noauth#">
			<cfinclude template="act_List.cfm" />
			<cfinclude template="qry_List.cfm" />
			<cfinclude template="dsp_List.cfm" />
			<cfset my.page.heading = "Collection information for #application.applicationname#" />
			<cfset my.page.subheading = "" />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

	<cfcase value="AskToUpdateSearch">
		<sec:security rights="500" errorpage="#my.site.noauth#">
			<cfset xfa.Update = "#fusebox.thisCircuit#.Update" />
			<cfinclude template="dsp_AskAboutUpdate.cfm" />
		</sec:security>
	</cfcase>

	<cfcase value="Create">
		<sec:security rights="800" errorpage="#my.site.noauth#">
			<cfset create = application.my.searchengine.create() />
			<cfset update = application.my.searchengine.update() />
			<cflocation url="#myself##fusebox.thisCircuit#.home&message=Create" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfcase value="Delete">
		<sec:security rights="700" errorpage="#my.site.noauth#">
			<cfset search = application.my.searchengine.delete() />
			<cflocation url="#myself##fusebox.thisCircuit#.home&message=Delete" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfcase value="Update">
		<sec:security rights="600" errorpage="#my.site.noauth#">
			<cfset search = application.my.searchengine.update() />
			<cflocation url="#myself##fusebox.thisCircuit#.home&message=Update" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>