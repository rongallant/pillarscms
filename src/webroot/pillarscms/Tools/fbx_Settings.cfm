<cfscript>
	my.site.name = "SiteManager";										// no spaces, used by webutils security tag or similar applications
	my.site.heading = "Site Administration";							// Main site heading
	my.site.subheading = "Tools for administrating your website";		// Main site heading description
	my.site.title = my.site.heading;									// display name used in title tags

	oUtils = createObject("component", "pillarscms.com.pillars.Utils");

	// set default design and theme
	if ( isdefined('attributes.theme') and ListLen(attributes.theme,'.') eq 2 )
		theme = setTheme(ListFirst(attributes.theme,'.'), ListLast(attributes.theme,'.'));
	else
		theme = setTheme( 'tools', 'main' );
	// set layout
	if ( isdefined('attributes.layout') )
		my.theme.layout = attributes.layout;
	else
		my.theme.layout = "main";
</cfscript>

<cfimport prefix="sec" taglib="../"><!--- 
<sec:security rights="100" errorpage="#my.site.noauth#" /> --->