<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfset xfa.Update = fusebox.thisCircuit & ".update"/>
		<cfinclude template="qry_GetSettings.cfm"/>
		<cfinclude template="dsp_Form.cfm"/>
		<cfset my.page.heading = "Welcome to the settings editor"/>
		<cfset my.page.subheading = "Below is a list of setting for your website. They are group logicaly by functionality.<br/>When you have completed making your changes press the &quot;Update Settings&quot; button."/>
		<cfset my.page.title = my.page.heading/>
	</cfcase>

	<cfcase value="update">
		<cfinclude template="qry_Update.cfm"/>
		<cflocation url="#myself##fusebox.thisCircuit#.home" addtoken="no"/>
	</cfcase>

	<cfcase value="menu">
		<cfset xfa.Menu1 = "tools.home"/>
		<cfinclude template="dsp_Menu.cfm"/>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8"/>
	</cfdefaultcase>

</cfswitch>