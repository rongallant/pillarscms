<!--- Block Two --->
<cfif len(my.page.heading)>
	<cfoutput>
		<div class="subcontent-unit-border-blue">
			<div class="round-border-topleft"></div><div class="round-border-topright"></div>
			<h1 class="blue">#my.page.heading#</h1>
			#fusebox.layout#
		</div>
	</cfoutput>
</cfif>

