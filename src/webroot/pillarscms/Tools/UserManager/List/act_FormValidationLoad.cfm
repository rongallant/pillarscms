<cfoutput>
<cfif not isDefined('request.qForm')>
	<cfsavecontent variable="request.qForm">
		<script src="#my.site.qform#qforms.js"></script>
		<script type="text/javascript">
			qFormAPI.setLibraryPath("#my.site.qform#");
			qFormAPI.include("*");
			qFormAPI.include("wddx");
			qFormAPI.include("ronsmods");
		</script>
	</cfsavecontent>
	<cfhtmlhead text="#request.qForm#">
</cfif>
</cfoutput>