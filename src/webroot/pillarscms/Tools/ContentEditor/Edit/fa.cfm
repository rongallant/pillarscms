<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="fa" language="ColdFusion">
	<responsibilities>
		I send the user to the specified fuseaction along with the specified querystring.
	</responsibilities>
	<properties>
		<property name="Version" value="2.5" />
		<history email="ron@rongallant.com" type="update" date="2003-06-02" comments="converted to cfscript, changes 1 from txt to booleen" />
		<history email="ron@rongallant.com" type="update" date="2003-01-02" comments="changed file name from fuseaction to fa" />
		<history email="ron@rongallant.com" type="update" date="2003-01-02" comments="added addtoken=No" />
		<history email="ron@rongallant.com" type="update" date="2002-11-07" comments="All scopes attributes" />
		<history email="ron@rongallant.com" type="update" date="2002-11-07" comments="now 3 ways to turn javascript on" />
		<history email="ron@rongallant.com" type="update" date="2002-10-18" comments="converted to custom tag" />
		<history email="ron@rongallant.com" type="create" date="2002-04-16" />
		<note author="Ron Gallant" date="2002-10-28">
			<cf_fa fuseaction="home.main" querystring="stringname=string&string2=string" javascript="no">
		</note>
	</properties>
	<io>
		<in>
			<structure scope="attributes" format="CFML">
				<string name="self" optional="Yes" default="index.cfm" comments="allows user to set fusebox page" />
				<string name="fuseaction" optional="Yes" comments="circuit.fuseaction" />
				<string name="querystring" optional="Yes" comments="queryname=queryvalue" />
				<string name="javascript" optional="Yes" default="no" comments="enable javascript forwarding after setting cookies or using cffile" />
			</structure>
		</in>
		<out>
			<structure scope="formOrUrl" format="CFML">
				<string name="fuseaction" />
				<string name="~attributes.querystring~" />
				<string name="self" />
			</structure>
		</out>
	</io>
</fusedoc>
--->

<cfscript>
	// I set the default variables
	if (not isdefined('attributes.fuseaction')) { attributes.fuseaction = "";}
	if (not isdefined('attributes.querystring')) { attributes.querystring = "";}
	if (not isdefined('attributes.javascript')) { attributes.javascript = "no";}
	if (not isdefined('attributes.self')) { attributes.self = "index.cfm";}

	// I build the url string
	if (attributes.fuseaction neq "" and attributes.querystring neq "") {
		attributes.querystring = "?fuseaction=#attributes.fuseaction#&#attributes.querystring#";
	} else if (attributes.fuseaction neq "" and attributes.queryString eq "") {
		attributes.querystring = "?fuseaction=#attributes.fuseaction#";
	} else if (attributes.fuseaction eq "" and attributes.queryString neq "") {
		attributes.querystring = "?#attributes.querystring#";
	}
</cfscript>

<!--- I send the user to the appropriate fuseaction --->
<cfif attributes.javascript eq "yes" or attributes.javascript eq 1 or attributes.javascript eq "on">
	<cfoutput>
		<script type="text/javascript">
			window.location.href="#attributes.self##attributes.querystring#"
		</script>
	</cfoutput>
<cfelse>
	<cflocation url="#attributes.self##attributes.querystring#" addtoken="No">
</cfif>