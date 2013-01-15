<cfset request.qforms = 1>
<script type="text/javascript">
	searchBox = new qForm("searchForm");
	if ( searchBox.criteria.getValue() == "" ) {
		searchBox.criteria.setValue("search this site");
		searchBox.criteria.obj.style.color = "#818181";
	}
	function SetSearchText() {
		if ( searchBox.criteria.getValue() == "search this site" ) {
			searchBox.criteria.setValue("");
			searchBox.criteria.obj.style.color = "#000000";
		}
	}
	searchBox.criteria.description = "Search field";
	searchBox.criteria.required = true;
	searchBox.criteria.addEvent("onClick","SetSearchText();");
	function performSearch() { 
		SetSearchText()
		searchBox.submit();
	}
	searchBox.mySearchButton.addEvent("onClick","performSearch();");
</script>