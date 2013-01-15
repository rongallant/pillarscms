<cfimport prefix="sec" taglib="../../../../">
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="new">
		<sec:security rights="600">
		<cfset xfa.add = "#fusebox.thisCircuit#.add">
		<cfinclude template="qry_NewArticle.cfm">
		<cfinclude template="dsp_Form.cfm">
		<cfinclude template="val_Form.cfm">
		<cfset my.page.heading = "New Article">
		<cfset my.page.subheading = "Fill in the fields and click 'Add Article'">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfcase value="edit">
		<sec:security rights="500">
		<cfset xfa.update = "#fusebox.thisCircuit#.update">
		<cfset xfa.delete = "#fusebox.thisCircuit#.delete">
		<cfset xfa.frontpage = "newsletter.home">
		<cfinclude template="qry_Article.cfm">
		<cfinclude template="dsp_Form.cfm">
		<cfinclude template="val_Form.cfm">
		<cfset my.page.heading = "Edit Article">
		<cfset my.page.subheading = "Fill in the fields and click 'Update Article'">
		<cfset my.page.title = my.page.heading>
		<cfsavecontent variable="request.TableRight">
			<cfoutput><a href="#myself#NewsLetter.preview&story=#attributes.articleid#" target="_blank">Preview</a></cfoutput>
		</cfsavecontent>
	</cfcase>

	<cfcase value="add">
		<sec:security rights="600">
		<cfinclude template="qry_GetIssueMaxArticle.cfm">
		<cfinclude template="qry_Add.cfm">		
		<cflocation url="#myself#listArticles.home&issueid=#attributes.issue#&searchwarning=1" addtoken="no">
	</cfcase>

	<cfcase value="update">
		<sec:security rights="500">
		<cfinclude template="qry_Update.cfm">
		<cflocation url="#myself#listArticles.home&issueid=#attributes.issue#&searchwarning=1" addtoken="no">
	</cfcase>

	<cfcase value="delete">
		<sec:security rights="700">
		<cfinclude template="qry_Delete.cfm">
		<cflocation url="#myself#listArticles.home&issueid=#attributes.issue#&searchwarning=1" addtoken="no">
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>