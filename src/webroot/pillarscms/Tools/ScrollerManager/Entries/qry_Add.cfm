<cfparam name="attributes.scrollerid" type="guid" />
<cfparam name="attributes.entryid" type="guid" />
<cfparam name="attributes.txtbold" type="boolean" default="0" />
<cfparam name="attributes.txtitalic" type="boolean" default="0" />
<cfparam name="attributes.txtunderline" type="boolean" default="0" />

<cfquery name="AddEntry" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_ScrollEntries (
		entryid,
		fk_scrollerid,
		linktext,
		linkurl,
		linktarget,
		txtfont,
		txtsize,
		txtcolor,
		txtbold,
		txtitalic,
		txtunderline,
		cr_ts,
		cr_id,
		lu_ts,
		lu_id
	)
	VALUES (
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.entryid)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.scrollerid)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.linktext)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.linkurl)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.linktarget)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.txtfont)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="2" value="#trim(attributes.txtsize)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="6" value="#trim(attributes.txtcolor)#" />,
		<cfqueryparam cfsqltype="cf_sql_tinyint" maxlength="4" value="#trim(attributes.txtbold)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="6" value="#trim(attributes.txtitalic)#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="6" value="#trim(attributes.txtunderline)#" />,
		<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />,
		<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		<cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />
	)
</cfquery>