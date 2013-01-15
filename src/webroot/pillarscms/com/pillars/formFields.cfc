<cfcomponent namespace="fieldTypes">

	<cfscript>
		instance = StructNew();
	</cfscript>

	<cffunction name="init">
		<cfargument name="dsn" required="yes"/>
		<cfargument name="tableprefix" required="yes"/>
		<cfset instance.dsn = arguments.dsn/>
		<cfset instance.tableprefix = arguments.tableprefix/>
		<cfset instance.data = selectData()/>
		<cfreturn this/>
	</cffunction>

	<cffunction name="getDSN">
		<cfreturn instance.dsn/>
	</cffunction>

	<cffunction name="selectData">
		<cfquery name="fielddata" datasource="#instance.dsn#">
			SELECT varID, varName, varValue, varFieldType
			FROM #instance.TablePrefix#_Settings
		</cfquery>
		<cfreturn fielddata/>
	</cffunction>

	<cffunction name="getData">
		<cfreturn instance.data/>
	</cffunction>

	<cffunction name="getField">
		<cfargument name="fieldID" hint="ID of field"/>
		<cfquery name="qField" dbtype="query">
			SELECT * FROM instance.data
			WHERE varID = '#arguments.fieldID#'
		</cfquery>
		<cfreturn qField/>
	</cffunction>

</cfcomponent>