<cfoutput>
	<form name="myForm" action="#self#" method="post">
		<input type="hidden" name="fuseaction" id="fuseaction" value="#xfa.SelectBlock#" />
		#formToHidden("fuseaction,fieldnames,submitButton")#
	</form>
</cfoutput>