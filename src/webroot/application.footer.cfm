<cfoutput>
<cfif ListContains("1,2,3", request.my.app.mode)>
	<cfsetting showdebugoutput="yes" />
	<cfset pagelink = "#cgi.script_name#" />
	<style type="text/css" media="all">
		##appmode {
			list-style-image: none;
			list-style-type: circle;
		}
	</style>
	<div style="background-color:white;text-align:left;">
		<ul>
			<li><a href="#pagelink#?myAppMode=0">myAppMode 0</a> - Turn off app mode</li>
			<li <cfif request.my.app.mode eq 1>id="appmode"</cfif>><a href="#pagelink#?myAppMode=1">myAppMode 1</a> - Shows debug output in UNIT</li>
			<li <cfif request.my.app.mode eq 2>id="appmode"</cfif>><a href="#pagelink#?myAppMode=2">myAppMode 2</a> - Dumps all structures (proccess intensive)<br/>
				<ul>set scopelist to choose what scopes dump.</ul>
			</li>
			<li <cfif request.my.app.mode eq 3>id="appmode"</cfif>><a href="#pagelink#?myAppMode=3">myAppMode 3</a> - Sets site to flush all clients, queries etc...</li>
			<li><a href="#pagelink#?myAppMode=4">myAppMode 4</a> - (one time) Sets site to flush all clients, queries etc...</li>
			<li>refresh = #request.refresh#</li>
		</ul>
		<cfscript>
			function CreateGUID() {
				GUID = Insert("-",CreateUUID(),23);
				return GUID;
			}
		</cfscript>
		<ul>
			<li>#CreateGUID()#</li>
			<li>#CreateODBCDateTime(now())#</li>
		</ul>
	</div>
</cfif>
<cfif isdefined('request.my.app.mode') and request.my.app.mode eq 2>
	<cfparam name="url.scopelist" default="form,cookie,client,session,application," />
	<cfloop list="#url.scopelist#" index="i">
		<cftry>
			<cfset tmp = evaluate(i)>
			<div style="margin:5px;"><cfdump var="#tmp#" label="#i#" /></div>
			<cfcatch>
				<div id="text">#i# does not exist</div>
			</cfcatch>
		</cftry>
	</cfloop>
</cfif>
</cfoutput>