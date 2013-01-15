<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfinclude template="dsp_Home.cfm"/>
		<cfset my.page.heading = "Forms"/>
		<cfset my.page.subheading = ""/>
		<cfset my.page.title = my.page.heading/>
	</cfcase>

	<cfcase value="send">
		<cfparam name="attributes.email"/>
		<cfparam name="attributes.return"/>
		<cfparam name="attributes.subject"/>
		<cfinclude template="act_Send.cfm">
		<cflocation url="#myself##fusebox.thisCircuit#.thankyou" addtoken="no"/>
	</cfcase>

	<cfcase value="thankyou">
		<cfinclude template="dsp_Thankyou.cfm">
		<cfset my.page.heading = "Ask a Reference Question - Thank You">
		<cfset my.page.subheading = "">
		<cfset my.page.title = my.page.heading>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8">
	</cfdefaultcase>

</cfswitch>