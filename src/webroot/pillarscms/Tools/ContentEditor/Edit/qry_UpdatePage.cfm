<cfparam name="attributes.parentid" />
<cfparam name="attributes.pgTitle" />

<cfquery name="qUpdatePage" datasource="#my.db.dsn#">
	UPDATE #my.db.tablePrefix#_pgPages
	SET 
		<cfif isDefined('attributes.pagetype') and attributes.pagetype eq "block">
			parent_id = '2',
		<cfelse>
			parent_id = '#attributes.parentid#',
		</cfif>
		pg_link_name = <cfif isdefined('attributes.pgLinkName') and len(attributes.pgLinkName)>'#trim(attributes.pgLinkName)#'<cfelse>'#trim(attributes.pgTitle)#'</cfif>,
		<cfif isDefined('attributes.pgLinkUrl') and len(trim(attributes.pgLinkUrl))>
			pg_link_url = '#trim(attributes.pgLinkUrl)#',
			pg_LinkUrlTarget = '#trim(attributes.pgLinkUrlTarget)#',
		<cfelse>
			pg_link_url = NULL,
			pg_LinkUrlTarget = NULL,
		</cfif>
		fk_layoutid = <cfif isDefined('attributes.pgTheme') and len(trim(attributes.pgTheme)) and isDefined('attributes.pagetype') and attributes.pagetype neq "block">'#trim(attributes.pgTheme)#'<cfelse>NULL</cfif>,
		pg_type =  <cfif isDefined('attributes.pagetype') and len(trim(attributes.pagetype))>'#attributes.pagetype#'<cfelse>'page'</cfif>,
		pg_title = '#trim(attributes.pgTitle)#',
		pg_Content = <cfif isdefined('attributes.pgContent') and len(trim(attributes.pgContent))>'#trim(attributes.pgContent)#'<cfelse>NULL</cfif>,
		pg_DisplayMenu = <cfif isDefined('attributes.pgDisplayMenu') and attributes.pgDisplayMenu eq 1>1<cfelse>0</cfif>,
		pg_DisplayNav = <cfif isDefined('attributes.pgDisplayNav') and attributes.pgDisplayNav eq 1>1<cfelse>0</cfif>,
		pg_PublishDate = <cfif isdefined('attributes.pgPublishDate') and len(trim(attributes.pgPublishDate))>#parsedatetime(attributes.pgPublishDate)#<cfelse>#now()#</cfif>,
		pg_RemoveDate = <cfif isdefined('attributes.pgEndDate') and len(trim(attributes.pgEndDate))>#parsedatetime(attributes.pgEndDate)#<cfelse>NULL</cfif>,
		pg_Schedule = <cfif isdefined('attributes.pgSchedule') and attributes.pgSchedule eq 1>1<cfelse>0</cfif>,
		pg_Notes = <cfif isdefined('attributes.pgNotes') and len(trim(attributes.pgNotes))>'#trim(attributes.pgNotes)#'<cfelse>NULL</cfif>,
		pg_Enabled = <cfif isdefined('attributes.pgEnabled') and attributes.pgEnabled eq 1>1<cfelse>0</cfif>,
		lu_ts = #now()#,
		lu_id = '#cgi.auth_user#'
	WHERE pg_id = '#attributes.pageid#'
</cfquery>