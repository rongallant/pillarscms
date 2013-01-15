<cfimport prefix="sec" taglib="../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="loginform,home">
		<cfif structKeyExists(session, 'username')>
			<cflocation url="#myself##fusebox.thisCircuit#.loggedin" addtoken="false" />
		</cfif>
		<cfset xfa.login = "#fusebox.thisCircuit#.login" />
		<cfinclude template="dsp_LoginForm.cfm" />
		<cfinclude template="val_LoginForm.cfm" />
		<cfset my.page.heading = "Login" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="loggedin">
		<cfinclude template="dsp_LoggedIn.cfm" />
		<cfset my.page.heading = "Login" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="login">
		<cfparam name="attributes.username" />
		<cfparam name="attributes.password" />
		<cfinclude template="act_login.cfm" />
		<cfif structKeyExists(session, 'userid') and len(session.userid)>
			<cflocation url="#myself#pages.home" addtoken="false" />
		<cfelse>
			<cflocation url="#myself##fusebox.thisCircuit#.loginform&error=failed" addtoken="false" />
		</cfif>
		<cfdump var="#session#"/>
	</cfcase>

	<cfcase value="logout">
		<cfinclude template="act_logout.cfm" />
		<cfif structKeyExists(session, 'username')>
			<cfoutput>Failed to logout</cfoutput>
		<cfelse>
			<cfoutput>Logged out</cfoutput>
		</cfif>
		<cfset my.page.heading = "Logout" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="changepassword">
		<sec:security thisApp="SiteManager" rights="100">
		<cfset xfa.UpdatePassword = fusebox.thisCircuit & ".updatepassword" />
		<cfinclude template="dsp_ChangePassword.cfm" />
		<cfinclude template="val_ChangePassword.cfm" />
		<cfset my.page.heading = "Change Your Password" />
		<cfset my.page.title = my.page.heading />
	</cfcase>

	<cfcase value="updatepassword">
		<sec:security thisApp="SiteManager" rights="100">
		<cfinclude template="act_UpdatePassword.cfm" />
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>