<cfsavecontent variable="emailBody">
<style type="text/css" media="all">
	.itmtitle {
		font-weight: bold;
		text-transform: capitalize;
	}
</style>
<cfoutput>
	<cfloop list="#attributes.fieldlist#" index="i" delimiters="|">
		<h3>#ListFirst(i)#</h3>
		<ul>
			<cfloop list="#i#" index="j" delimiters=",">
				<cfparam name="attributes[j]" default=""/>
				<cfif j neq ListFirst(i)>
					<li><span class="itmtitle">#j#</span>: #attributes[j]#</li>
				</cfif>
			</cfloop>
		</ul>
	</cfloop>
</cfoutput>
</cfsavecontent>

<cfmail
	to="#attributes.email#"
	from="#attributes.return#"
	subject="#attributes.subject#"
	type="html">
	#emailBody#
</cfmail>