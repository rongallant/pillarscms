<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="act_MinimizeScript" language="Javascript">
	<responsibilities>
		I am a javascript that toggles the display style on a block.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" />
	</properties>
	<io>
		<in>
			<string name="pathto('themeIcons','url')" />
		</in>
	</io>
</fusedoc>
--->

<cfoutput>
<script language="JavaScript" type="text/javascript">
<!-- 
with (document) {
	write("<STYLE TYPE='text/css'>");
	if (navigator.appName == 'Microsoft Internet Explorer') {
		write(".hiddentext {display:none} .outline {cursor:hand}");
		}
		write("</STYLE>");
		}

function expandIt(whichEl) {
	if (navigator.appName == 'Microsoft Internet Explorer')	{
		whichEl.style.display = (whichEl.style.display == "block" ) ? "none" : "block";
		else return;
	}
//  -->
</script>
</cfoutput>