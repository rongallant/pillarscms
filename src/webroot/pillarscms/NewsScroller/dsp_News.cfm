<!---<cfdump var="#attributes#"><cfabort>--->
<cfimport prefix="tag" taglib="./">
<tag:scroller
	scrollerid="#attributes.scrollerid#"
	width="150"
	height="160"
	dsn="#my.db.dsn#"
	tableprefix="#my.db.tableprefix#"
/>