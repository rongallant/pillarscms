<cfimport prefix="sec" taglib="../">

<style media="all">
	#EditorTools UL {
		margin: 10px 0 0 0;
		padding: 0;
		float: right;
	}
	#EditorTools LI {
		list-style-image: none;
		list-style-type: none;
		display: inline;
	}
</style>

<cfoutput>
  <div id="EditorTools">
	<ul>
		<sec:security thisApp="NewsLetterManager" rights="600">
			<li><a href="#myself##xfa.EditPage#&articleid=#request.qStory.storyid#" target="_blank" title="Edit Page" onMouseover="hOn('ea#request.qStory.storyid#','##FFFFCC');" onmouseout="hOff('ea#request.qStory.storyid#');">	
				<img src="#my.design.folder##my.theme.folder#editoricons/edit.png" width="16" height="16" /></a></li>
		</sec:security>
		<li><a href="#myself##xfa.PrintStory#&layout=print" target="_blank" title="Print Page">
			<img src="#my.design.folder##my.theme.folder#editoricons/printButton.png"></a></li>
		<li><a href="#myself##xfa.PrintStory#&layout=file" target="_blank" title="Download PDF">
			<img src="#my.design.folder##my.theme.folder#editoricons/pdf_button.png"></a></li>
	</ul>
</div>
</cfoutput>