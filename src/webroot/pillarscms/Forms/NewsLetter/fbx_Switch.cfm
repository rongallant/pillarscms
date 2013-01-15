<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfset xfa.Send = "forms.send">
		<cfset my.page.heading = "Sign up for the Meet Med-D newsletter">
		<cfset my.page.subheading = "">
		<cfset my.page.title = my.page.heading>
		<cfinclude template="dsp_Form.cfm">
		<cfinclude template="val_Form.cfm">
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>