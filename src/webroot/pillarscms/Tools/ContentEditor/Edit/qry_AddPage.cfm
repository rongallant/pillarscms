<cfparam name="attributes.pgTitle">

<cfif not ( isDefined('attributes.pgOrder') and len(trim(attributes.pgOrder)) )>
	<cfquery name="qMaxPage" datasource="#my.db.dsn#">
		SELECT MAX(pg_Order) AS maxorder
		FROM #my.db.tablePrefix#_pgPages
	</cfquery>
	<cfif qMaxPage.recordcount and IsNumeric(qMaxPage.maxorder)>
		<cfset NewPage = qMaxPage.maxorder + 1>
	<cfelse>
		<cfset NewPage = 1>
	</cfif>
</cfif>

<cfquery name="qAddPage" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tablePrefix#_pgPages (
		pg_id,
		parent_id,
		fk_layoutid,
		pg_link_name,
		pg_link_url,
		pg_LinkUrlTarget,
		pg_type,
		pg_title,
		pg_Content,
		pg_DisplayMenu,
		pg_DisplayNav,
		pg_order,
		pg_PublishDate,
		pg_RemoveDate,
		pg_Schedule,
		pg_Notes,
		pg_Enabled,
		lu_ts,
		lu_id,
		cr_ts,
		cr_id
	)
	VALUES (
		'#attributes.pageid#',
		<cfif attributes.pagetype eq "block">'2'<cfelse>'#attributes.parentid#'</cfif>,
		<cfif isDefined('attributes.pgTheme') and len(trim(attributes.pgTheme)) and isDefined('attributes.pagetype') and attributes.pagetype neq "block">'#trim(attributes.pgTheme)#'<cfelse>NULL</cfif>,
		<cfif isDefined('attributes.pgLinkName') and len(trim(attributes.pgLinkName))>'#trim(attributes.pgLinkName)#'<cfelse>'#trim(attributes.pgTitle)#'</cfif>,
		<cfif isDefined('attributes.pgLinkUrl') and len(trim(attributes.pgLinkUrl))>'#trim(attributes.pgLinkUrl)#'<cfelse>NULL</cfif>,
		<cfif isDefined('attributes.pgLinkUrlTarget') and len(trim(attributes.pgLinkUrlTarget))>'#trim(attributes.pgLinkUrlTarget)#'<cfelse>NULL</cfif>,
		<cfif isDefined('attributes.pagetype') and len(trim(attributes.pagetype))>'#attributes.pagetype#'<cfelse>'page'</cfif>,
		'#trim(attributes.pgTitle)#',
		<cfif isDefined('attributes.pgContent') and len(trim(attributes.pgContent))>'#trim(attributes.pgContent)#'<cfelse>NULL</cfif>,
		<cfif isdefined('attributes.pgDisplayMenu') and attributes.pgDisplayMenu eq 1>1<cfelse>0</cfif>,
		<cfif isdefined('attributes.pgDisplayNav') and attributes.pgDisplayNav eq 1>1<cfelse>0</cfif>,
		#NewPage#,
		<cfif isDefined('attributes.pgPublishDate') and len(trim(attributes.pgPublishDate))>'#attributes.pgPublishDate#'<cfelse>#now()#</cfif>,
		<cfif isDefined('attributes.pgEndDate') and len(trim(attributes.pgEndDate))>'#attributes.pgEndDate#'<cfelse>NULL</cfif>,
		<cfif isdefined('attributes.pgSchedule') and attributes.pgSchedule eq 1>1<cfelse>0</cfif>,
		<cfif isdefined('attributes.pgNotes') and attributes.pgNotes eq 1>'#trim(attributes.pgNotes)#'<cfelse>NULL</cfif>,
		<cfif isdefined('attributes.pgEnabled') and attributes.pgEnabled eq 1>1<cfelse>0</cfif>,
		#now()#,
		'#cgi.auth_user#',
		#now()#,
		'#cgi.auth_user#'
	)
</cfquery>