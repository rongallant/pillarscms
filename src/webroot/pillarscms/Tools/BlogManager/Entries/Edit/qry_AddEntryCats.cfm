<cfloop list="#attributes.categories#" index="i">
	<cfquery name="qAddEntryCats" datasource="#my.db.dsn#">
		INSERT INTO #my.db.tableprefix#_BlogCategoriesEntries (
			fk_be_entryid,
			fk_catid,
			cr_id,
			cr_ts
		)
		VALUES (
			'#attributes.entryid#',
			'#i#',
			'#cgi.auth_user#',
			#now()#
		)
	</cfquery>
</cfloop>