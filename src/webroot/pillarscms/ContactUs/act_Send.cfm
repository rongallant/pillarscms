<cfsavecontent variable="emailBody">
<style type="text/css" media="all">
	.itmtitle {
		font-weight: bold;
		text-transform: capitalize;
	}
</style>
<cfoutput>
	<cfloop list="#attributes.fieldlist#" index="i" delimiters="|">
		<cfloop list="#i#" index="j" delimiters=",">
			<cfif j eq ListFirst(i)>
				<h3>#j#</h3>
			</cfif>
			<ul>
			<cfif j neq ListFirst(i)>
				<li><span class="itmtitle">#j#</span>: #attributes[j]#</li>
			</cfif>
			</ul>
		</cfloop>
	</cfloop>
</cfoutput>
</cfsavecontent>

<cfmail
	to="#my.email.contactus.address#"
	from="#my.email.contactus.return#"
	subject="#my.email.contactus.subject#"
	type="html">
	#emailBody#
</cfmail>