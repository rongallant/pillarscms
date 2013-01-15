<cfif qPage.DisplayNav eq 1 and ListContains("page,nomenu",qPage.pagetype)>
	<cfoutput>
		<div class="EditorTools">
			<ul>
				<li><a href="#myself##xfa.PrintStory#&pageid=#qPage.pageid#&layout=print" target="_blank">
					<img src="assets/images/editoricons/printButton.png" align="middle" border="0" alt="" /> print page</a></li>
				<li><a href="#myself##xfa.PrintStory#&pageid=#qPage.pageid#&layout=file" target="_blank">
					<img src="assets/images/editoricons/pdf_button.png" align="middle" border="0" alt="" /> download page (PDF)</a></li>
			</ul>
		</div>
	</cfoutput>
</cfif>