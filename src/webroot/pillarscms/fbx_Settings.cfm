<cfscript>
	fusebox.suppresserrors = true;
	fusebox.useErrorCatch = true;

	// fusebox variables
	self = "index.cfm";											// what file acts as the fusebox
	myself = self & "?fuseaction=";
	if ( not isdefined('attributes.fuseaction') ) attributes.fuseaction = "pages.home"; // default fuseaction
	if ( not isDefined('request.topFuseaction') ) request.topFuseaction = attributes.fuseaction;

	// set current environment for external links
	if ( cgi.server_name contains "-unit" ) env="-unit"; else if ( cgi.server_name contains "-nav" ) env="-nav"; else env="";

	// my application API
	my = duplicate(application.settings.my);
	my.site.name = "pillarscms";								// no spaces, used for email return
	my.site.title = "Pillars CMS";
	my.site.qform = "assets/scripts/qForm/";					// qForm API folder
	my.site.noauth = "#myself#errors.noauth";					// page for no authorization page

	my.page = StructNew();
	my.page.title = "";											// title to be displayed in top bar
	my.page.heading = "";										// heading for individual page, used in layout
	my.page.subheading = "";									// subheading for individual page, used in layout
	my.page.formNumber = "";									// form number that displays in teh lower right corner of the page

	my.content = StructNew();									// all content variables

	my.block = StructNew();
	my.block.heading = "";										// heading for current block
	my.block.subheading = "";									// subheading for current block
	my.block.help = "";											// URL to current block help
	my.block.url = "";											// URL current block heading becomes

	my.email.webmaster = application.settings.my.email.webmaster;// webmasters email

	if ( request.refresh eq 1 ) my.db.querycacheshort = CreateTimeSpan(0,0,0,0);
	else my.db.querycacheshort = CreateTimeSpan(0,0,0,30);		// query cache for page hits

	my.layout = StructNew();
	my.layout.bodytag = "";										// For adding attributes to the body tag

	// set default design and theme
	if ( isdefined('attributes.theme') and ListLen(attributes.theme,'.') eq 2 )
		theme = setTheme(ListFirst(attributes.theme,'.'),ListLast(attributes.theme,'.'));
	else
		theme = setTheme( 'mainsite', 'main' );

	// set layout
	if ( isdefined('attributes.layout') )
		my.theme.layout = attributes.layout;
	else
		my.theme.layout = "main";
</cfscript>

<!--- Security Check --->	
<cflock scope="Session" timeout="10">
	<cfif not StructKeyExists(session, "my")>
		<cfparam name="session.userid" default="" />
		<cfset session.my = StructNew() />
		<cfset session.my.oUserInfo = createobject("component", "pillarscms.com.pillars.UserInfo").init(my.db.dsn, my.db.TablePrefix) />
	</cfif>
	<cfset my.user = StructNew() />
	<cfset StructAppend(my.user, session.my.oUserInfo.getUser()) />
</cflock>

<!--- set var for myAppMode --->
<!--- TODO: Validate functionality --->
<cfimport prefix="fb" taglib="./" />
<cfif isdefined('request.setappmode')>
	<fb:security rights="800" thisapp="admin">
		<cfif request.validated eq 1>
			<cflock scope="Session" timeout="10">
				<cfset session.myAppMode = attributes.myAppMode />
			</cflock>
			<cfset request.setappmode = 1 />
		<cfelse>
			<cflock scope="Session" timeout="10">
				<cfset tmp = StructDelete(session, 'myAppMode') />
			</cflock>
			<cfset request.setappmode = 0 />
		</cfif>
	</fb:security>
</cfif>

<cfset tmp = StructDelete(variables, 'tmp') />

<cfif isDefined('attributes.pageid') and (not isDefined('request.breadcrumbs'))>
	<cfimport prefix="menu" taglib="Pages/Menus/" />
	<menu:createarray 
		dsn="#my.db.dsn#" 
		tableprefix="#my.db.tablePrefix#" 
		page="#attributes.pageid#"
		userid="#session.userid#"
	/>
</cfif>
