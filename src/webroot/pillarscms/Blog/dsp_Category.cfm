<cfimport prefix="tag" taglib="../tags/" />
<cfimport prefix="sec" taglib="../" />

<cfparam name="attributes.pageid" default="" />
<cfparam name="attributes.currentpage" default="1" />
<tag:pagethru
	totalrecords="#qCat.recordcount#"
	currentpage="#attributes.currentpage#"
	displaycount="10"
	addedpath="&fuseaction=#attributes.fuseaction#&catid=#attributes.catid#&pageid=#attributes.pageid#"
	templateurl="#self#"
	usetablehtml=true
	imagepath="NONE"
	HiLiteColor="##FF7300"
> 

<cfoutput>
#PT_PageThru#

<cfloop query="qCat" startrow="#PT_StartRow#" endrow="#PT_EndRow#">
<div class="newsBox">
	<h3>
		#qCat.title#
		<cfif not ( StructKeyExists(session, 'hideadmin') and session.hideadmin )>
		<sec:security thisApp="BlogManager" rights="100">
			<span class="EditorIcon">
				<a href="#myself##xfa.edit#&entryid=#qCat.entryid#" target="_blank">	
				<img src="assets/images/editoricons/edit_sm.png" alt="Edit Area" width="10" height="10" border="0"/></a>
			</span>
		</sec:security>
		</cfif>
	</h3>

	#qCat.shorttext#

	<cfif len(trim(qCat.longtext))>
		<a class="catMoreDetails" href="#myself##xfa.Detail#&entryid=#qCat.entryid#">more...</a>
	</cfif>
</div>
</cfloop>
</cfoutput>