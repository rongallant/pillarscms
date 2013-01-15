<cfif isDefined('attributes.blocktitle') and len(attributes.blocktitle)>
	<cfset blocktitle = trim(attributes.blocktitle) />
<cfelse>
	<cfset blocktitle = qCat.title />
</cfif>

<cfif len(attributes.displaypageid)>
	<cfset displaymode = 0 />
<cfelse>
	<cfset displaymode = 1 />
	<cfset attributes.displaypageid = "1" />
</cfif>

<cfquery name="qAddBlock" datasource="#my.db.dsn#">
	INSERT INTO #my.db.tableprefix#_Blocks (
		blockid,
		fk_blocktypeid,
		fk_pageid,
		blocktitle,
		layout,
		layoutarea,
		blockidlist,
		blockfuseaction,
		displaymode
	)
	VALUES (
		'#CreateGUID()#',
		'#trim(qBlockTypes.blocktypeid)#',
		<cfif isDefined('attributes.displaypageid') and len(attributes.displaypageid)>
			'#trim(attributes.displaypageid)#',
		<cfelse>
			NULL,
		</cfif>
		'#blocktitle#',
		'#trim(attributes.blocklayout)#',
		'#trim(attributes.layoutarea)#',
		<cfif isDefined('attributes.blockidlist') and len(attributes.blockidlist)>
			'#trim(attributes.blockidlist)#',
		<cfelse>
			NULL,
		</cfif>
		'#trim(qBlockTypes.blockfuseaction)#',
		#displaymode#
	)
</cfquery>