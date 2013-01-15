<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfinclude template="dsp_Home.cfm"/>
		<cfset my.page.heading = ""/>
		<cfset my.page.subheading = ""/>
		<cfset my.page.title = my.page.heading/>
	</cfcase>

	<cfdefaultcase>
		<cfoutput>
	       I received a fuseaction called <b>"#fusebox.fuseaction#"</b> that
		   circuit <b>"#fusebox.circuit#"</b> doesn't have a handler for.
		</cfoutput>
	</cfdefaultcase>

</cfswitch>