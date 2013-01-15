<cfparam name="attributes.entryid" />
<cfparam name="attributes.txtbold" type="boolean" default="0" />
<cfparam name="attributes.txtitalic" type="boolean" default="0" />
<cfparam name="attributes.txtunderline" type="boolean" default="0" />

<cfquery name="qUpdate" datasource="#my.db.dsn#">
	UPDATE #my.db.tableprefix#_ScrollEntries
	SET
		fk_scrollerid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.scrollerid)#" />,
		linktext = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.linktext)#" />,
		linkurl = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="256" value="#trim(attributes.linkurl)#" />,
		linktarget = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.linktarget)#" />,
		txtfont = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#trim(attributes.txtfont)#" />,
		txtsize = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="2" value="#trim(attributes.txtsize)#" />,
		txtcolor = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="6" value="#trim(attributes.txtcolor)#" />,
		txtbold = <cfqueryparam cfsqltype="cf_sql_tinyint" maxlength="4" value="#trim(attributes.txtbold)#" />,
		txtitalic = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="6" value="#trim(attributes.txtitalic)#" />,
		txtunderline = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="6" value="#trim(attributes.txtunderline)#" />,
		lu_ts = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#" />,
		lu_id = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="50" value="#cgi.auth_user#" />
	WHERE entryid = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="37" value="#trim(attributes.entryid)#" />
</cfquery>