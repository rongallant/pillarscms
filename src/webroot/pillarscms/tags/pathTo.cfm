<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="pathTo.cfm" language="ColdFusion">
	<responsibilities>
		I define a function which returns a path of a specified type to a circuit defined in the fusebox.circuits structure.
	</responsibilities>
	<properties>
		<property name="Version" value="1.0" />
		<history author="Ron Gallant" email="ron@rongallant.com" type="update" date="2002-04-19" comments="Converted Fusedocs to 3.0 spec" />
		<history author="ken beard" email="anon_tyrant@yahoo.com" type="create" date="2002-04-18" />
		<note author="ken beard" date="2002-04-18">
			FUNCTION SYNTAX:
				#pathTo(CircuitName,PathType)#

				CircuitName must be defined in the fusebox.circuits structure.

				Path Types
				cf: for includes and cfmodules
				dir: for cffile and cfcontent
				url: for cflocations,links,forms,images,etc

				Notes
				1. set request.cf_mapping_root to the absolute 'cf' path to the root of your application if you want to use absolute 'cf' paths.
				2. putting in a circuit name of self will cause pathTo() to append "index.cfm" to the path.

			EXAMPLE CALLS:
				<cfinclude template="#pathTo('project','cf')#qry_project.cfm">
				<script src="#pathTo('js','url')#validation.js"></script>
				<cfset request.self=pathTo('self','url')>
				<a href="#request.self#?fuseaction=#xfa.next#">Go</a>
		</note>
	</properties>
	<io>
		<in>
			<string name="fusebox.circuits.~pathname~" format="CFML" />
		</in>
		<out>
			<structure scope="variables">
				<string name="~pathname~" />
				<string name="pt_thiscircuit" />
				<string name="pt_file" />
				<string name="slash" />
				<string name="dir_slash" />
				<string name="fullpath" />
				<string name="basepath" />
				<string name="rootpath" />
				<string name="directories_up" />
			</structure>
		</out>
	</io>
</fusedoc>
--->

<cfscript>
function pathTo(pt_circuit,pt_type) {
	// declare variables
	var pt_thiscircuit='';
	var pt_file='';
	var slash='';
	var dir_slash='';
	var fullpath='';
	var basepath='';
	var rootpath='';
	var directories_up='';
	
	// logic for "self"
	if(pt_circuit is "self") {
		pt_thiscircuit="home";
		pt_file="index.cfm";
	} else {
		pt_thiscircuit=pt_circuit;
		pt_file="";
	}
	
	//figure out path
	basepath="pillarscms/"&listrest(fusebox.circuits[pt_thiscircuit],"/");
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
</cfscript>