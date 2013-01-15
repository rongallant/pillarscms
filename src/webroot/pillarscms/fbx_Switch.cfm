<cfswitch expression = "#fusebox.fuseaction#">

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>