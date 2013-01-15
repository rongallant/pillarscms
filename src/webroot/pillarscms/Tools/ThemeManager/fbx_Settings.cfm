<cfscript>
	my.site.name = "ThemeManager";										// no spaces, used by webutils security tag or similar applications
	my.site.heading = "Theme Administration";							// Main site heading
	my.site.subheading = "Tools for the administration your website look and feel";	// Main site heading description
	my.site.title = my.site.heading;									// display name used in title tags
	my.layout = StructNew();

	// set default design and theme
	if (isdefined('attributes.theme')) { 
		setTheme(listFirst(attributes.theme,'.'),ListLast(attributes.theme,'.')); 
	} else {
		setTheme('tools','main');
	}
</cfscript>

<cfimport prefix="sec" taglib="../">
<sec:security rights="100" errorpage="#my.site.noauth#">