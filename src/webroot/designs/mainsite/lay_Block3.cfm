<!--- Block Three --->
<cfif len(my.page.heading)>
	<cfoutput>
		<div class="subcontent-unit-noborder-green">
			<div class="round-noborder-topleft"></div><div class="round-noborder-topright"></div>
			<h1 class="green">#my.page.heading#</h1>
			#fusebox.layout#
		</div>
	</cfoutput>
</cfif>