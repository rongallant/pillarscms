<cfparam name="attributes.pageid" default="" />
<cfparam name="attributes.page_full" default="" />
<cfscript>
	if ( qPage.pagetype eq "block" ) preview_type = "block";
	else preview_type = "page";
	blockid = attributes.pageid;
	pageid = attributes.page_full;
</cfscript>
<cfoutput>
<script type="text/javascript">
	function postPreview() {
		// I set the values of the preview form
		//var oEditor = FCKeditorAPI.GetInstance('pgContent');
		//var preview_Content = oEditor.GetXHTML();
		var preview_Content = document.pgContent;
		var previewForm = document.previewForm;
		var editForm = document.pageEditForm;
		previewForm.preview_title.value = editForm.pgTitle.value;
		previewForm.preview_content.value = preview_Content;
		// submit the form
		document.previewForm.submit();
	}
</script>
<form name="previewForm" action="#self#" method="post" target="_blank">
	<input type="hidden" name="fuseaction" id="fuseaction" value="#xfa.Preview#" />
	<input type="hidden" name="pageid" id="pageid" value="#pageid#" />
	<input type="hidden" name="preview" id="preview" value="1" />
	<input type="hidden" name="preview_title" id="preview_title" />
	<input type="hidden" name="preview_content" id="preview_content" />
	<input type="hidden" name="preview_type" id="preview_type" value="#preview_type#" />
	<input type="hidden" name="blockid" id="blockid" value="#blockid#" />
</form>
</cfoutput>