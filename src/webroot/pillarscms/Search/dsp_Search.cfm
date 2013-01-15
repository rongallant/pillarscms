<cfparam name="caller.attributes.criteria" default="">
<cfoutput>
<div class="mySearchForm">
	<form name="searchForm" id="searchForm" action="#self#" method="get">
		<input type="hidden" name="fuseaction" id="fuseaction" value="#xfa.SearchResults#" />
		<input type="text" name="criteria" id="SearchBox" class="mySearchField" size="15" maxlength="50" value="#caller.attributes.criteria#" />
		<input type="button" name="mySearchButton" id="mySearchButton" class="mySearchButton" value="Search" />
	</form>
</div>
</cfoutput>