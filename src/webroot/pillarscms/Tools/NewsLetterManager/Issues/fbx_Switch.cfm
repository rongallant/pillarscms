<cfswitch expression = "#fusebox.fuseaction#">

	<cfdefaultcase>
		<cfoutput>
	       I received a fuseaction called <b>"#fusebox.fuseaction#"</b> that
		   circuit <b>"#fusebox.circuit#"</b> doesn't have a handler for.
		</cfoutput>
	</cfdefaultcase>

</cfswitch>