<cfimport prefix="menu" taglib="./" />
<cfparam name="attributes.tabs" default="" />
<cfparam name="attributes.path" default="" />
<cfparam name="attributes.currentpage" />
<cfparam name="attributes.dsn" />
<cfparam name="attributes.tableprefix" />
<cfparam name="attributes.page" default="index.cfm?fuseaction=pgEdit.edit" />
<cfparam name="attributes.parent" default="1" />
<cfparam name="attributes.start" default="1" />

<cfif not isDefined('attributes.root')>
	<cfset attributes.root = StructNew() />
	<cfset attributes.root.pageid = attributes.start />
	<cfset attributes.root.children = ArrayNew(1) />
</cfif>

<cfquery name="qSelect" datasource="#attributes.dsn#">
	SELECT
		parent_id AS parentid,
		pg_id AS pageid,
		pg_link_name AS linkname,
		pg_link AS link
	FROM #attributes.tableprefix#_pgPages
	WHERE parent_id = '#attributes.root.pageid#'
	ORDER BY pg_order, linkname
</cfquery>

<cfif qSelect.Recordcount gt 0>

	<cfloop query="qSelect">
		<cfset attributes.root.children[qSelect.CurrentRow] = StructNew() />
		<cfset attributes.root.children[qSelect.CurrentRow].parentid = qSelect.parentid />
		<cfset attributes.root.children[qSelect.CurrentRow].pageid = qSelect.pageid />
		<cfset attributes.root.children[qSelect.CurrentRow].linkname = qSelect.linkname />
		<cfset attributes.root.children[qSelect.CurrentRow].link = qSelect.link />
		<cfset attributes.root.children[qSelect.CurrentRow].children = ArrayNew(1) />
		<cfif attributes.parent eq qSelect.pageid>
			<cfset atts = 'selected="selected"' />
		<cfelse>
			<cfset atts = "">
		</cfif>
		<cfif attributes.currentpage neq qSelect.pageid>
			<cfoutput>
				<option value="#qSelect.pageid#" #atts#>#attributes.path##qSelect.linkname#</option>
			</cfoutput>
		</cfif>
		<menu:select
			start="#attributes.start#"
			currentpage="#attributes.currentpage#"
			parent="#attributes.parent#"
			dsn="#attributes.dsn#"
			tableprefix="#attributes.tableprefix#"
			root="#attributes.root.children[qSelect.CurrentRow]#"
			path="#attributes.path##attributes.root.children[qSelect.CurrentRow].linkname# / "
		>
	</cfloop>

</cfif>
<cftry>

<cfcatch><cfoutput>Error</cfoutput></cfcatch>
</cftry>