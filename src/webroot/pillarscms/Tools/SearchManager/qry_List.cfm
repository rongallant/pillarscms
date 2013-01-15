<cfquery name="qoq" dbtype="query">
	SELECT *
	FROM myCollections 
	WHERE myCollections.name = '#lcase(application.applicationname)#'
</cfquery>