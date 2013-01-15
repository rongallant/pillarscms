<cfset tmp = URLDecode(attributes.block) />
<cfif ListLen(tmp,"|") gte 3>
	<cfset my.pageblock.title = ListGetAt(tmp,1,"|") />
	<cfset my.pageblock.area = ListGetAt(tmp,2,"|") />
	<cfset extrasList = ListGetAt(tmp,3,"|") />
	<cfif listlen(extrasList,"&") gt 0>
		<cfloop list="#extrasList#" delimiters="&" index="i">
			<cfscript>
				 SetVariable("my.pageblock.#ListFirst(i,'=')#",ListLast(i,'='));
			</cfscript>
		</cfloop>
	</cfif>
</cfif>
<cfquery name="qAddBlock" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_Blocks (
		blockid,
		pageid,
		blocktitle,
		layoutarea,
		orderby,
		blockidlist
	)
	VALUES (
		'#CreateGUID()#',
		'#trim(attributes.pageid)#',
		'#attributes.blocktitle#',
		'#attributes.layoutarea#',
		NULL,
		'#attributes.block#'
	)
</cfquery>