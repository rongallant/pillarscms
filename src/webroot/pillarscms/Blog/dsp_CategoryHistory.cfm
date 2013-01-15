<cfimport prefix="tag" taglib="../tags/"/>
<cfimport prefix="sec" taglib="../">

<cfparam name="attributes.pageid" default=""/>
<cfparam name="attributes.currentpage" default="1"/>
<tag:pagethru
	totalrecords="#qCat.recordcount#"
	currentpage="#attributes.currentpage#"
	displaycount="30"
	addedpath="&fuseaction=#attributes.fuseaction#&catid=#attributes.catid#&pageid=#attributes.pageid#"
	templateurl="#self#"
	usetablehtml=true
	imagepath="NONE"
	HiLiteColor="##FF7300"
>

<cfoutput>
	<h2>#qCat.cat#</h2>

	#PT_PageThru#

	<ol start="#PT_StartRow#">
		<cfloop query="qCat" startrow="#PT_StartRow#" endrow="#PT_EndRow#">
			<li>
				<a href="#myself##xfa.Detailed#&entryid=#qCat.entryid#">#qCat.title#</a>
				<sec:security thisApp="BlogManager" rights="100">
					<cfif not ( StructKeyExists(session, 'hideadmin') and session.hideadmin )>
					<span class="EditorIcon">
						<a href="#myself##xfa.edit#&entryid=#qCat.entryid#" target="_blank">	
						<img src="assets/images/editoricons/edit_sm.png" alt="Edit Area" width="10" height="10" border="0"/></a>
					</span>
					</cfif>
				</sec:security>
			</li>
		</cfloop>
	</ol>
</cfoutput>