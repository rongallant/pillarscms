<cfscript>
	settingsFile = URLEncodedFormat(myself & xfa.Settings & "&scrollerid=" & attributes.scrollerid );
	entriesFiles = URLEncodedFormat(myself & xfa.Entries & "&scrollerid=" & attributes.scrollerid );
</cfscript>

<cfoutput>
	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=7,0,0,0" width="#qNewsScroller.width#" height="#qNewsScroller.height#" id="scroller" align="middle">
		<param name="allowScriptAccess" value="sameDomain" />
		<param name="movie" value="assets/flashscroller/scroller.swf?settings_file=#settingsFile#&entries_file=#entriesFiles#" />
		<param name="quality" value="high" />
		<param name="bgcolor" value="###qNewsScroller.bgcolor#" />
		<embed src="assets/flashscroller/scroller.swf?settings_file=#settingsFile#&entries_file=#entriesFiles#" quality="high" bgcolor="##ffffff" width="#qNewsScroller.width#" height="#qNewsScroller.height#" name="scroller" align="middle" allowscriptaccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
	</object>
</cfoutput>