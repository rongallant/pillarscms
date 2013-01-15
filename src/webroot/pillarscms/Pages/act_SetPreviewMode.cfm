<cfimport prefix="sec" taglib="../">
<cfparam name="request.previewmode" default="0" />
<sec:security thisApp="ContentManager" rights="100">
	<cfif (request.validated eq 1) and (not isDefined('request.preview')) and ( isDefined('attributes.preview') and attributes.preview eq 1)>
		<cfset request.previewmode = 1 />
	</cfif>
</sec:security>