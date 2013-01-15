<cfif len(qPage.theme)>
	<cfset themeName = qPage.theme />
<cfelse>
	<cfset themeName = "main" />
</cfif>

<!--- I set the theme that was selected for the current page --->
<cfif not (isDefined('attributes.pagetype') and attributes.pagetype eq "block") and len(trim(qPage.theme)) and not ( isDefined('url.layout') or (isdefined('attributes.theme') and ListLen(attributes.theme,'.') eq 2) )>
	<cfset theme = setTheme( 'mainsite', themeName ) />
</cfif>