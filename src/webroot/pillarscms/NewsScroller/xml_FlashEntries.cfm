<entries>
	<cfoutput query="qNewsScroller">
	<entry>
		<format>
			<font>#qNewsScroller.txtfont#</font>
			<color>0x#qNewsScroller.txtcolor#</color>
			<align>left</align>
			<size>#qNewsScroller.txtsize#</size>
			<cfif qNewsScroller.txtbold eq 1><bold>true</bold></cfif>
			<cfif qNewsScroller.txtitalic eq 1><italic>true</italic></cfif>
			<cfif qNewsScroller.txtunderline eq 1><underline>true</underline></cfif>
		</format>
		<headline>#URLEncodedFormat(qNewsScroller.linktext)#</headline>
		<link>#URLEncodedFormat(qNewsScroller.linkurl)#</link>
		<target>#qNewsScroller.linktarget#</target>
	</entry>
	</cfoutput>
</entries>