<cfimport prefix="fb" taglib="../" />
<cfimport prefix="sec" taglib="../" />
<cfimport prefix="menu" taglib="./Menus/" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home,NoTitle">
		<cfinclude template="act_SetPreviewMode.cfm" />
		<cfinclude template="qry_GetPage.cfm" />
		<cfparam name="attributes.pageid" default="#qPage.pageid#" />
		<cfinclude template="act_PreviewUnsaved.cfm" />
		<cfinclude template="dsp_Home.cfm" />
		<cfinclude template="act_SetTheme.cfm" />
		<cfif request.previewmode eq 0>
			<fb:fusebox fuseaction="#fusebox.thisCircuit#.editoricon" pageid="#qPage.pageid#" pagename="#my.page.heading#" layout="none" />
		</cfif>
		<cfif not isDefined('request.breadcrumbs')>
			<menu:createarray dsn="#my.db.dsn#" tableprefix="#my.db.tablePrefix#" page="#qPage.pageid#" />
		</cfif>
		<cfset xfa.EditPage = "pgEdit.editPage" />
		<cfset xfa.PrintStory = attributes.fuseaction />
		<cfinclude template="dsp_Nav.cfm" />
		<cfset my.page.heading = qPage.title />
		<cfif isdefined('attributes.blocktitle')>
			<cfset my.page.heading = attributes.blocktitle />
		</cfif>
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="menu">
		<cfset xfa.Page = fusebox.thisCircuit & ".home" />
		<cfinclude template="dsp_Menu.cfm" />
	</cfcase>

	<cfcase value="submenu">
		<cfset xfa.Page = fusebox.thisCircuit & ".home" />
		<cfinclude template="dsp_SubMenu.cfm" />
	</cfcase>

	<cfcase value="breadcrumbs">
		<cfset xfa.Page = fusebox.thisCircuit & ".home" />
		<cfinclude template="dsp_Breadcrumbs.cfm" />
	</cfcase>

	<cfcase value="ToggleAdmin">
		<cfset xfa.ToggleAdmin = "home.hideadmin" />
		<cfset xfa.Admin = "tools.home" />
		<cfinclude template="dsp_ToggleAdmin.cfm" />
	</cfcase>

	<cfcase value="editoricon">
		<sec:security thisApp="SiteManager" rights="100">
			<cfif request.validated eq 1>
				<cfparam name="attributes.pageid" />
				<cfparam name="attributes.pagename" />
				<cfset xfa.edit = "pgEdit.editPage" />
				<cfinclude template="dsp_EditorIcon.cfm" />
			</cfif>
		</sec:security>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>