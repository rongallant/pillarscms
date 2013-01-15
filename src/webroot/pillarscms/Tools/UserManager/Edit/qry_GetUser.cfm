
<!--- SQL Injection check for ORDER BY --->
<cfif not ListFindNoCase("username, lastname, status", trim(attributes.Order))>
	<cfset attributes.Order = "lastname" />
</cfif>

<cfquery name="getMessages" datasource="#my.db.dsn#">
	SELECT
		a.username AS usrid,
		a.username AS authuser,
		a.firstname,
		a.firstname AS fname,
		a.lastname,
		a.lastname AS lname,
		(a.firstname + ' ' + a.lastname) AS name,
		a.phone_work AS phone,
		a.email_work AS email,
		a.notes,
		a.enabled,
		c.id AS appid
	FROM #my.db.tableprefix#_users AS a
	LEFT OUTER JOIN #my.db.tableprefix#_userapps AS b
		ON b.fk_user_id = a.username
	LEFT OUTER JOIN #my.db.tableprefix#_apps AS c
		ON c.id = b.fk_app_id
	WHERE a.username = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="8" value="#trim(lcase(attributes.usrid))#" />
	ORDER BY #attributes.Order#
</cfquery>

<cfset my.user = getMessages />