<cfparam name="attributes.linktitle" />
<cfparam name="attributes.linkurl" />
<cfscript>
	tmp = QueryAddRow(qPage,1);
	tmp = QuerySetCell(qPage,"pg_Title",attributes.linktitle,1);
	tmp = QuerySetCell(qPage,"pg_link_url",attributes.linkurl,1);
</cfscript>