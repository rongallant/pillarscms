<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("myForm");

// linktext
	objForm.linktext.description = "Link Text";
	objForm.linktext.required = true;

// linkurl
	objForm.linkurl.description = "Link URL";
	objForm.linkurl.required = false;

// linktarget
	objForm.linktarget.description = "Link Target";
	objForm.linktarget.required = true;

// txtsize
	objForm.txtsize.description = "Font Size";
	objForm.txtsize.required = true;

// txtcolor
	objForm.txtcolor.description = "Font Color";
	objForm.txtcolor.required = true;

// txtbold
	objForm.txtbold.description = "Bold";
	objForm.txtbold.required = false;

// txtitalic
	objForm.txtitalic.description = "Italic";
	objForm.txtitalic.required = false;

// txtunderline
	objForm.txtunderline.description = "Underline";
	objForm.txtunderline.required = false;

// Buttons
	<cfif attributes.fuseaction eq "#fusebox.thisCircuit#.New">
		objForm.Add.addEvent("onclick", "setfuseaction('#xfa.Add#')");
	<cfelseif attributes.fuseaction eq "#fusebox.thisCircuit#.Edit">
		objForm.Update.addEvent("onclick", "setfuseaction('#xfa.Update#')");
		objForm.Delete.addEvent("onclick", "DeleteEntry()");

		function DeleteEntry() {
			if(confirm("Are you sure you want to delete this entry?")) {
				objForm.fuseaction.setValue("#xfa.Delete#");
				objForm.submit();
			}
		}

	</cfif>
</script>
</cfoutput>