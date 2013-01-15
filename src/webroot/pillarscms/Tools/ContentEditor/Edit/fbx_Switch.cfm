<cfimport prefix="sec" taglib="../../../">
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="Menu">
		<cfset xfa.Menu1 = "home.home" />
		<cfset xfa.Menu2 = "" />
		<cfinclude template="dsp_Menu.cfm" />
	</cfcase>

	<cfcase value="newPage">
		<sec:security rights="600">
			<cfset xfa.Add = "#fusebox.thisCircuit#.add" />
			<cfset xfa.EditBlocks = "blockmanager.edit" />
			<cfinclude template="qry_GetPage.cfm" />
			<cfinclude template="qry_Themes.cfm" />
			<cfinclude template="dsp_PageForm.cfm" />
			<cfinclude template="val_PageForm.cfm" />
			<cfset my.page.heading = "New Page" />
			<cfset my.page.subheading = "Fill in the form and click &quot;Add Page&quot;" />
			<cfset my.page.title = "New Page" />
		</sec:security>
	</cfcase>

	<cfcase value="editPage">
		<sec:security rights="500">
			<cfset xfa.Update = "#fusebox.thisCircuit#.update" />
			<cfset xfa.Delete = "#fusebox.thisCircuit#.delete" />
			<cfset xfa.EditBlocks = "bmList.listPage" />
			<cfset xfa.pages = "pages.home" />
			<cfinclude template="qry_GetPage.cfm" />
			<cfinclude template="qry_Themes.cfm" />
			<cfinclude template="dsp_PageForm.cfm" />
			<cfinclude template="val_PageForm.cfm" />
			<cfset my.page.title = "Edit &quot;#qPage.pg_title#&quot;" />
			<cfset xfa.Preview = "pages.home" />
			<cfinclude template="dsp_UnsavedPreview.cfm" />
		</sec:security>
	</cfcase>

	<cfcase value="newLink">
		<sec:security rights="600">
			<cfset xfa.Add = "#fusebox.thisCircuit#.add" />
			<cfinclude template="qry_BlankPage.cfm" />
			<cfif isDefined('attributes.linktitle') and len(attributes.linktitle)>
				<cfinclude template="qry_CreateLinkQuery.cfm" />
			</cfif>
			<cfinclude template="dsp_LinkForm.cfm" />
			<cfinclude template="val_LinkForm.cfm" />
			<cfset my.page.title = "New Link" />
		</sec:security>
	</cfcase>

	<cfcase value="editLink">
		<sec:security rights="500">
			<cfset xfa.Update = "#fusebox.thisCircuit#.update" />
			<cfset xfa.Delete = "#fusebox.thisCircuit#.delete" />
			<cfinclude template="qry_GetPage.cfm" />
			<cfinclude template="dsp_LinkForm.cfm" />
			<cfinclude template="val_LinkForm.cfm" />
			<cfinclude template="dsp_UpdateCreate.cfm" />
			<cfset my.page.title = "Edit &quot;#qPage.pg_title#&quot; Link" />
		</sec:security>
	</cfcase>

	<cfcase value="add">
		<sec:security rights="600">
			<cfset xfa.ListPages = "pgList.home" />
			<cfset attributes.pageid = createGUID() />
			<cfinclude template="qry_AddPage.cfm" />
			<cfinclude template="qry_CreateSingleHomepage.cfm" />
			<cflocation url="#myself#pgList.home&searchwarning=1" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfcase value="update">
		<sec:security rights="500">
			<cfset xfa.ListPages = "pgList.home" />
			<cfinclude template="qry_UpdatePage.cfm" />
			<cfinclude template="qry_CreateSingleHomepage.cfm" />
			<cflocation url="#myself#pgList.home&searchwarning=1" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfcase value="delete">
		<sec:security rights="700">
			<cfinclude template="qry_CreateSingleHomepage.cfm" />
			<cfinclude template="qry_DeleteGroupPages.cfm" />
			<cfinclude template="qry_DeleteBlocks.cfm" />
			<cfinclude template="qry_DeletePage.cfm" />
			<cfinclude template="qry_ResetChildrenRoot.cfm" />
			<cflocation url="#myself#pgList.home" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfcase value="changeorder">
		<sec:security rights="500">
			<cfinclude template="act_ChangeOrder.cfm" />
			<cflocation url="#myself#pgList.home" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>