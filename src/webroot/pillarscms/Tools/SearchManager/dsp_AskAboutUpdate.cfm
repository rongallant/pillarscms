<cfoutput>
<div id="warningbox">
	<p>You have made changes that could effect search results.<br/>
	If you have completed your changes you should update the search engine.</p>
	<form name="UpdateSearchEngine" action="#self#" method="get">
		<input type="hidden" name="fuseaction" value="#xfa.Update#"/>
		<input type="submit" name="ans" value="Update Search Engine" class="myButton" />
	</form>
</div>
</cfoutput>