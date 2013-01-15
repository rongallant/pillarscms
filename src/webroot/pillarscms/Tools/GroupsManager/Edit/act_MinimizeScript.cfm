<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="act_MinimizeScript" language="ColdFusion">
	<responsibilities>
		I 
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
<script type="text/javascript">
	with (document) {
		write("<STYLE TYPE='text/css'>");
		if (navigator.appName == 'Microsoft Internet Explorer') {
			write(".hiddentext {display:none} .outline {cursor:hand}");
		}
		write("</STYLE>");
	}
	
	function expandIt(whichEl,iconName) {
	
		if (navigator.appName == 'Microsoft Internet Explorer')	{
			whichEl.style.display = (whichEl.style.display == "block" ) ? "none" : "block";
			var iconRestore = '#my.design.folder##my.theme.folder#icons/iconRestore.gif';
			var iconMinimize = '#my.design.folder##my.theme.folder#icons/iconMinimize.gif';
			if (whichEl.style.display == "block") {
				iconName.src=iconMinimize;
			} else if (whichEl.style.display == "none") {
				iconName.src=iconRestore;
			}
		}
		else return;
	}
</script>
</cfoutput>