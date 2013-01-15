<cfimport prefix="fb" taglib="../" />
<cfloop query="qBlocks">
	<cfscript>
		my.pageblock.title = qBlocks.blocktitle;
		my.pageblock.layoutarea = qBlocks.layoutarea;
		my.pageblock.fuseaction = qBlocks.blockfuseaction;
		my.pageblock.layout = qBlocks.layout;
		my.pageblock.blocktitle = qBlocks.blocktitle;
		my.pageblock.pagetype = "block";
		if ( len(qBlocks.blockvarname) ) SetVariable( "my.pageblock.#qBlocks.blockvarname#", qBlocks.blockidlist );
	</cfscript>
	<cfsavecontent variable="blockCode"><fb:fusebox attributecollection="#my.pageblock#"></cfsavecontent>
	<cfparam name="request.my.layout.#my.pageblock.layoutarea#" default="" />
	<cfset request.my.layout[my.pageblock.layoutarea] = request.my.layout[my.pageblock.layoutarea] & blockCode />
</cfloop>