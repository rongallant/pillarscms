<cfparam name="my.layout[fusebox.ThisCircuit]" default="#my.theme.layout#">

<cfscript>
	fusebox.layoutdir = "../" & fusebox.rootpath & my.design.folder;
	switch ( my.layout[fusebox.ThisCircuit] ) {

		case "main":
			fusebox.layoutfile = "lay_NewsPlain.cfm";
		break;

		default:
			fusebox.layoutfile = "lay_Blank.cfm";
		break;

	}
</cfscript>