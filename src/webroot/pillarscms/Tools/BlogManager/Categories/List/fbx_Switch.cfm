<cfimport prefix="sec" taglib="../../../../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfset xfa.ListEntries = "BlogListEntries.home"/>
		<cfset xfa.Edit = "BlogEditCategories.edit"/>
		<cfset xfa.AddMenuLink = "pgEdit.newLink"/>
		<cfset xfa.DisplayCat = "blog.category"/>
		<cfinclude template="#pathto('tags','cf')#ListFunctions.cfm" />
		<cfinclude template="qry_List.cfm"/>
		<cfinclude template="dsp_List.cfm"/>
		<cfset my.page.heading = "List Categories"/>
		<cfset my.page.subheading = "Select a category below to see it's current entries."/>
		<cfset my.page.heading = my.page.heading/>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8"/>
	</cfdefaultcase>

</cfswitch>