<cfimport prefix="sec" taglib="../../../" />
<sec:security tableprefix="#my.db.tableprefix#" thisapp="#my.site.name#" rights="100" errorpage="#my.site.noauth#">