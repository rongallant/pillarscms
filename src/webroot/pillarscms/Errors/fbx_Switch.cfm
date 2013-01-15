<cfimport prefix="fb" taglib="../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="noAuth">	
		<cfinclude template="dsp_NoAuth.cfm" />
		<fb:fusebox fuseaction="security.loginform" layout="none" />
		<cfset my.page.heading = "Not Authorized" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="404">	
		<cfinclude template="dsp_404.cfm" />
		<cfset my.page.heading = "Page Not Found" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="DefaultError">	
		<cfinclude template="dsp_DefaultError.cfm" />
		<cfset my.page.heading = "Error" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>