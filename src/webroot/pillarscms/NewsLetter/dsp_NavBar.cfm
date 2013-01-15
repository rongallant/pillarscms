<cfimport prefix="sec" taglib="../">

<cfscript>
	request.storyindex = request.qIssue.recordcount;
	i = 0;
	while ( i lt request.qIssue.recordcount ) {
		if ( request.qIssue.storyid[i] eq request.qStory.storyid ) {
			request.storyindex = i;
			break;
		}
		 i = i + 1;
	}
</cfscript>

<cfoutput>
<br clear="all" />
<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-top:20px;">
	<tr>
		<td width="33%" align="left" id="navbar" nowrap="nowrap">
			<cfif request.storyindex gt 1>
				<cfset tmp = request.storyindex - 1>
				<a href="#myself##xfa.ViewStory#&story=#request.qIssue.storyid[tmp]#&pageid=#attributes.pageid#">&lt;&lt; page #tmp#</a>
			</cfif>
		</td>
		<td width="33%" align="center" id="navbar" nowrap="nowrap">
			<cfif isdefined('request.backarrow')>
				<a href="##top"><img src="#my.design.folder##my.theme.folder#images/arrowUp.gif" width="18" height="16"/></a>
				<a href="##top">Back to Top</a>
			<cfelse>
				<div class="EditorTools">
					<ul>
						<sec:security thisApp="SiteManager" rights="100">
							<li><a href="#myself##xfa.EditPage#&articleid=#request.qStory.storyid#&pageid=#attributes.pageid#" onMouseover="hOn('ea#request.qStory.storyid#','##FFFFCC');" onmouseout="hOff('ea#request.qStory.storyid#');" target="_blank">
								<img src="assets/images/editoricons/edit.png" width="16" height="16" align="middle" border="0" alt="" /> edit article</a></li>
						</sec:security>
						<li><a href="#myself##xfa.PrintStory#&articleid=#request.qStory.storyid#&layout=print&pageid=#attributes.pageid#" target="_blank">
							<img src="assets/images/editoricons/printButton.png" align="middle" border="0" alt="" /> print article</a></li>
						<li><a href="#myself##xfa.PrintStory#&articleid=#request.qStory.storyid#&layout=file&pageid=#attributes.pageid#" target="_blank">
							<img src="assets/images/editoricons/pdf_button.png" align="middle" border="0" alt="" /> download article (PDF)</a></li>
					</ul>
				</div>
			</cfif>
		</td>
		<td width="33%" align="right" id="navbar" nowrap="nowrap">
			<cfif request.storyindex lt request.qIssue.recordcount>
				<cfset tmp = request.storyindex + 1>
				<a href="#myself##xfa.ViewStory#&story=#request.qIssue.storyid[tmp]#&pageid=#attributes.pageid#">page #tmp# &gt;&gt;</a>
			</cfif>
		</td>
	</tr>
</table>
</cfoutput>