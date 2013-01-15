
<cfif ParameterExists(attributes.input) IS "No">
	<b>Error! &lt;CF_YesNo&gt; requires the &quot;input&quot; attribute.</b>
	<cfabort>
<cfelseif attributes.input IS "">
	<cfset caller.yesno = "">
	<cfexit>
</cfif>

<cfset text = ucase(Left(attributes.input,1))>

<cfif ParameterExists(attributes.suppress)>
	<cfif isnumeric(#variables.text#)>
		<CFIF text IS 0>
			<cfset caller.yesno = False>
		<CFELSEIF text is 1>
			<cfset caller.yesno = True>
		<CFELSE>
			<cfset caller.yesno = False>
		</cfif>
	<CFELSE>
		<CFIF text IS "N">
			<cfset caller.yesno = False>
		<CFELSEIF text is "Y">
			<cfset caller.yesno = True>
		<CFELSE>
			<cfset caller.yesno = False>
		</cfif>
	</cfif>
<CFELSE>
	<cfif isnumeric(#variables.text#)>
		<CFIF text IS 0>
			<cfset caller.yesno = False>
			No
		<CFELSEIF text is 1>
			Yes
			<cfset caller.yesno = True>
		<CFELSE>
			<cfset caller.yesno = False>
			No
		</cfif>
	<CFELSE>
		<CFIF text IS "N">
			<cfset caller.yesno = False>
			No
		<CFELSEIF text is "Y">
			<cfset caller.yesno = True>
			Yes
		<CFELSE>
			<cfset caller.yesno = False>
			?
		</cfif>
	</cfif>
</cfif>

<!--- <cfscript>

function YesNo(text,test_type) {
	// delare variables
	var text='';
	var test_type=TRUE;
	
	// logic for "self"
	if(pt_circuit is "self") {
		pt_thiscircuit="home";
		pt_file="index.cfm";
	} else {
		pt_thiscircuit=pt_circuit;
		pt_file="";
	}
	
	//figure out path
	basepath=listrest(fusebox.circuits[pt_thiscircuit],"/");
	if(pt_type is "url") {
		slash="/";
		fullpath=basepath&slash;
	} else if(pt_type is "cf") {
		slash="/";
		if(isdefined("request.cf_mapping_root")) {
			rootpath=request.cf_mapping_root;
		} else {
			if(find("/",getbasetemplatepath())) {
				dir_slash="/";		
			} else {
				dir_slash="\";
			}
			directories_up=listlen(getdirectoryfrompath(getcurrenttemplatepath()),dir_slash)-listlen(getdirectoryfrompath(getbasetemplatepath()),dir_slash);
			rootpath=repeatString("../",directories_up);
		}
		fullpath=rootpath & basepath&slash;
	} else if(pt_type is "dir") {
		if(find("/",getbasetemplatepath())) {
			slash="/";		
		} else {
			slash="\";
		}
		fullpath=replace(getdirectoryfrompath(getbasetemplatepath()) & basepath,"/","\","all") & slash;
	}
	if(fullpath is "/") fullpath="";
	
	if(pt_file is not "") {
		fullpath=fullpath&pt_file;
	}
	return fullpath;
}
</cfscript> --->