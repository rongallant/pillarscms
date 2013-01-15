<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfset xfa.Send = fusebox.thisCircuit & ".send">
		<cfinclude template="dsp_Form.cfm">
		<cfinclude template="val_Form.cfm">
		<cfset my.page.heading = "Contact Us">
		<cfset my.page.subheading = "">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfcase value="send">
		<cfinclude template="act_Send.cfm">
		<cflocation url="#my.email.contactus.thankyoupage#" addtoken="no" />
	</cfcase>

	<cfcase value="thankyou">
		<cfinclude template="dsp_Thankyou.cfm">
		<cfset my.page.heading = "Contact Us - Thank You">
		<cfset my.page.subheading = "">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>