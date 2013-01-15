<cfcomponent namespace="SearchEngine">

	<cfset this.dsn = "" />
	<cfset this.tablePrefix = "" />
	<cfset this.collectionPath = "#ListFirst(GetTemplatePath(),':')#:\JRun4\verity\collections" />

	<cffunction name="init" access="public">
		<cfargument name="dsn" type="string" required="true" />
		<cfargument name="tablePrefix" type="string" required="true" />
		<cfargument name="collectionPath" type="string" required="true" />
		<cfset this.dsn = arguments.dsn />
		<cfset this.tablePrefix = arguments.tablePrefix />
		<cfset this.collectionPath = arguments.collectionPath />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void">
		<cftry>
			<cflock name="SearchEngine" timeout="60">
				<cfcollection action="Create"
					collection="#lcase(application.applicationname)#"
					path="#this.collectionPath#"
				/>
			</cflock>
			<cfcatch>
				<cfif isDefined('request.my.app.mode') and request.my.app.mode gte 1>
					<cfrethrow />
				<cfelse>
					<cfthrow type="custom" message="Could not create '#lcase(application.applicationname)#'. Collection already exists." />
				</cfif>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="update" access="public" returntype="void">
		<cftry>
			<cfquery name="qCollection" datasource="#this.dsn#">		
				IF EXISTS (
					SELECT name
					FROM tempdb..sysobjects 
					WHERE name LIKE '#this.tablePrefix#_SearchIndex%'
				) DROP TABLE #this.tablePrefix#_SearchIndex

				CREATE TABLE #this.tablePrefix#_SearchIndex (
					startdate datetime,
					storyid varchar(36),
					title varchar(256),
					content text,
					issueid varchar(36),
					pageid varchar(10)
				)

				INSERT #this.tablePrefix#_SearchIndex
					SELECT 
						a.pg_PublishDate AS startdate,
						a.pg_id AS storyid,
						a.pg_title AS title,
						a.pg_Content AS content,
						'page' AS issueid,
						'page' AS pageid
					FROM #this.tablePrefix#_pgPages AS a
					WHERE a.pg_enabled = 1
					AND (
						a.pg_type = 'page'
						OR a.pg_type = 'nomenu'
					)

				INSERT #this.tablePrefix#_SearchIndex
					SELECT
						a.issue_startdate AS startdate,
						b.article_id AS storyid,
						b.article_title AS title,
						b.article_content AS content,
						a.issue_id AS issueid,
						'newsletter' AS pageid
					FROM #this.tablePrefix#_Issues AS a
					JOIN #this.tablePrefix#_Articles AS b
						ON b.fk_issue_id = a.issue_id
					WHERE a.issue_enabled = 1
					AND b.article_enabled = 1

				SELECT startdate, storyid, title, content, issueid, pageid
				FROM #this.tablePrefix#_SearchIndex

				DROP TABLE #this.tablePrefix#_SearchIndex
			</cfquery>
			<cfindex action="Refresh"
				collection="#application.applicationname#"
				type="Custom" query="qCollection"
				custom1="issueid"
				custom2="startdate"
				custom3="pageid"
				key="storyid" title="title"
				body="content,title,startdate"
			/>
			<cfcatch>
				<cfif isDefined('request.my.app.mode') and request.my.app.mode>
					<cfrethrow/>
				<cfelse>
					<cfthrow type="custom" message="Could not update the collection '#application.applicationname#'"/>
				</cfif>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="updateIssue" access="public" returntype="void">
		<cftry>
			<cfquery name="qCollection" datasource="#this.dsn#">
				SELECT
					a.issue_id AS issueid,
					a.issue_startdate AS startdate,
					b.article_id AS storyid,
					b.article_title AS title,
					b.article_content AS content
				FROM #this.tablePrefix#_Issues AS a
				JOIN #this.tablePrefix#_Articles AS b
					ON b.fk_issue_id = a.issue_id
				WHERE a.issue_enabled = 1
					AND b.article_enabled = 1
			</cfquery>
			<cfindex action="Refresh"
				collection="#application.applicationname#"
				query="qCollection"
				type="Custom"
				custom1="issueid"
				custom2="startdate"
				key="storyid"
				title="title"
				body="content,title,startdate"
			/>
			<cfcatch>
				<cfif isDefined('request.my.app.mode') and request.my.app.mode gte 1>
					<cfrethrow>
				<cfelse>
					<cfthrow type="custom" message="Could not update the collection '#application.applicationname#'"/>
				</cfif>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void">
		<cftry>
			<cflock name="verity" timeout="60">
				<cfcollection action="Delete" collection="#application.applicationname#" />
			</cflock>
			<cfcatch>
				<cfif isDefined('request.my.app.mode') and request.my.app.mode>
					<cfrethrow />
				<cfelse>
					<cfthrow type="custom" message="Could not delete '#application.applicationname#', the collection does not exist." />
				</cfif>
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="search" access="public" returntype="Struct">
		<cfargument name="criteria" default="" type="string" />
		<cfargument name="startrow" default="1" type="numeric" />
		<cfargument name="maxrows" default="10" type="numeric" />
		<cfset var search = StructNew() />
		<cfset var myCriteria = trim(arguments.criteria) />
		<cfif Right(myCriteria,1) eq "\">
			<cfset myCriteria = Left(myCriteria,Len(myCriteria)-1) />
		</cfif>
		<cfsearch name="qSearch"
			collection="#application.applicationname#"
			type="Internet"
			criteria="#myCriteria#*" 
			contextpassages="1"
			contexthighlightbegin="<strong class='searchhighlight'>"
			contexthighlightend="</strong>"
			status="searchStatus"
			startrow="#arguments.startrow#"
			maxrows="#arguments.maxrows#"
		/>
		<cfscript>
			search.results = qSearch;
			search.status = searchStatus;
			search.arguments = Duplicate(arguments);
			search.status.lastrow = search.results.rank[arguments.maxrows];
			if (not val(search.status.lastrow)) search.status.lastrow = search.status.found;
		</cfscript>
		<cfreturn search />
	</cffunction>

	<cffunction name="getDsn" returntype="string" access="public">
		<cfreturn this.dsn />
	</cffunction>

	<cffunction name="setDsn" returntype="void" access="public">
		<cfargument name="dsn" type="string" required="true" />
		<cfset this.dsn = arguments.dsn />
	</cffunction>

	<cffunction name="gettablePrefix" returntype="string" access="public">
		<cfreturn this.tablePrefix />
	</cffunction>

	<cffunction name="setTablePrefix" returntype="void" access="public">
		<cfargument name="tablePrefix" type="string" required="true" />
		<cfset this.tablePrefix = arguments.tablePrefix />
	</cffunction>

	<cffunction name="getCollectionPath" returntype="string" access="public">
		<cfreturn this.collectionPath />
	</cffunction>

	<cffunction name="setCollectionPath" returntype="void" access="public">
		<cfargument name="collectionPath" type="string" required="true" />
		<cfset this.collectionPath = arguments.collectionPath />
	</cffunction>

</cfcomponent>