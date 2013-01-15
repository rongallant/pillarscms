<!--- I set a circuit level layout variable --->
<cfparam name="my.layout[fusebox.ThisCircuit]" default="#my.theme.layout#" />

<cfscript>
	fusebox.layoutdir = "../" & fusebox.rootpath & my.design.folder;
	switch ( my.layout[fusebox.ThisCircuit] ) {

	// Top level layouts (includes header)
		case "main": // main layout for theme
			fusebox.layoutfile="lay_ThemeOne.cfm";
		break;

	// Top level layouts (includes header)
		case "themeone":
			fusebox.layoutfile="lay_ThemeOne.cfm";
		break;

		case "themetwo":
			fusebox.layoutfile="lay_ThemeTwo.cfm";
		break;

		case "themethree":
			fusebox.layoutfile="lay_ThemeThree.cfm";
		break;

		case "themefour":
			fusebox.layoutfile="lay_ThemeFour.cfm";
		break;

		case "print": // only header info and bg color
			fusebox.layoutfile="lay_Print.cfm";
		break;

		case "file": // only header info and bg color
			fusebox.layoutfile="lay_File.cfm";
		break;

		case "Tabs": // tabs used on front page
			fusebox.layoutfile="lay_Tabs.cfm";
		break;

		case "plain": // only header info and bg color
			fusebox.layoutfile="lay_Plain.cfm";
		break;

	// Second level layouts (no header)

		// Blocks
		case "mainmenu":
			fusebox.layoutfile="lay_MainMenu.cfm";
		break;

		case "mainmenuhorizontal":
			fusebox.layoutfile="lay_MainMenuHorizontal.cfm";
		break;

		case "submenu":
			fusebox.layoutfile="lay_SubMenu.cfm";
		break;

		case "Block1":
			fusebox.layoutfile="lay_Block1.cfm";
		break;

		case "Block2":
			fusebox.layoutfile="lay_Block2.cfm";
		break;

		case "Block3":
			fusebox.layoutfile="lay_Block3.cfm";
		break;

		case "Block4":
			fusebox.layoutfile="lay_Block4.cfm";
		break;

		default:
			fusebox.layoutfile="lay_Blank.cfm";
		break;

	}
</cfscript>