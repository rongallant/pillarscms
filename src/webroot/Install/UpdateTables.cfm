<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Update Pillars CMS Install Script</title>
</head>
<body>

<cffunction name="setColumnData">
	<cfargument name="data" required="true">
	<cfargument name="type" required="true">
	<cfset var quotedTypes = 'varchar,char,text,ntext,nvarchar,nchar'>
	<cfset var result = arguments.data>
	<cfif ListFind(quotedTypes,arguments.type)>
		<cfset result = "'" & ReplaceNoCase(HTMLEditFormat(arguments.data),"'","''","ALL") & "'">
	</cfif>
	<cfif arguments.type eq "datetime">
		<cfset result = "getdate() /*" & arguments.type & "*/">
	<cfelseif arguments.type eq "bit" and not( len(result) )>
		<cfset result = "NULL /*" & arguments.type & "*/">
	<cfelse>
		<cfset result = result & " /*" & arguments.type & "*/">
	</cfif>
	<cfreturn result>
</cffunction>

<!--- App Settings --->
<cfsetting requesttimeout="600" showdebugoutput="no">
<cfset dsn = "datacenter">
<cfset TablePrefix = "TEST">

<cfquery name="getTables" datasource="#dsn#">
	SELECT * FROM sysobjects
	WHERE type = 'U'
	AND name <> 'dtproperties'
</cfquery>

<cfoutput query="getTables">
<cfquery name="getTableStructure" datasource="#dsn#">
		SELECT 
			syscolumns.Name AS ColumnName,
			systypes.Name as ColumnType
		FROM syscolumns
		INNER JOIN systypes
			ON systypes.xtype = syscolumns.xtype
		WHERE syscolumns.id = '#getTables.id#'
	</cfquery>
	<cfset tablename = Replace(getTables.name,"pillarscms_",TablePrefix & "_","ALL")>

	<cfquery name="getTableData" datasource="#dsn#">
		SELECT *
		FROM #getTables.name#
	</cfquery>
	
	<cfif getTableData.recordcount gt 0><h2>/* #tablename# */</h2></cfif>

<pre>
<cfloop query="getTableData">
INSERT INTO #tablename# (
	#ValueList(getTableStructure.ColumnName)#
)
VALUES ( 
	<cfloop query="getTableStructure">
		#setColumnData(getTableData[getTableStructure.ColumnName][getTableData.CurrentRow],getTableStructure.ColumnType)#
		<cfif getTableStructure.CurrentRow LT getTableStructure.RecordCount>,</cfif>
	</cfloop>
);
</cfloop>
</pre>
</cfoutput>

</body>
</html>