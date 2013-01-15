<cfset request.qforms = 1>
<cfoutput>
<script type="text/javascript">
// initialize the qForm object
	objForm = new qForm("pageEditForm");

// Functions
	with (document) {
		if ( navigator.appName == "Microsoft Internet Explorer" ) {
			write('<style type="text/css">');
			write(".hiddentext {display:none} .outline {cursor:hand}");
			write("</style>");
		}
	}

// parentid
	objForm.parentid.description = "Parent";
	objForm.parentid.required = true;

// pagetype
	objForm.pagetype.description = "Page type";
	objForm.pagetype.addEvent("onChange","checkZone(objForm.pagetype.getValue());");

// pgTitle
	objForm.pgTitle.description = "Page Title";
	objForm.pgTitle.required = true;

// pgLinkName
	objForm.pgLinkName.description = "Link Title";
	objForm.pgLinkName.required = true;

// pgIsHome
	objForm.pgIsHome.description = "This is the homepage";
	objForm.pgIsHome.required = false;
	function _f_isNotPage() {
		vPageType = objForm.pagetype.getValue();
		//alert(this.value + " " + vPageType);
		if ( this.value == 1 && vPageType != 'page' ) {
			this.error = "The page type must be a 'Page' to select it as the homepage.";
		}
	}
	// register the validation method
	_addValidator("isNotPage", _f_isNotPage, true);
	objForm.pgIsHome.validateNotPage();

// pgNotes
	objForm.pgNotes.description = "Notes";

// Scheduler
	function isOn(whichEl,theVal) {
		if (theVal) {
			whichEl.style.display = "block";
			objForm.pgPublishDate.required = true;
			objForm.pgEndDate.required = true;
		}
		else {
			whichEl.style.display = "none";
			objForm.pgPublishDate.required = false;
			objForm.pgEndDate.required = false;
		}
	}
	isOn( scheduleSection, objForm.pgSchedule.getValue() );
	objForm.pgSchedule.addEvent("onClick","isOn(scheduleSection,objForm.pgSchedule.getValue());");

// pgPublishDate
	objForm.pgPublishDate.description = "Publish Date";
	objForm.pgPublishDate.validateDate();

// pgEndDate
	objForm.pgEndDate.description = "End Date";
	objForm.pgEndDate.validateDate();

// Buttons
	<cfif fusebox.fuseaction eq "newPage">
		objForm.AddButton.addEvent("onClick","setfuseaction('#xfa.Add#');");
	<cfelse>
		objForm.PreviewButton.addEvent("onClick","postPreview()");
		function ConfirmDelete() {
			if ( confirm("Are you sure you want to delete '#JSStringFormat(qPage.pg_title)#'") ) {
				setfuseaction('#xfa.Delete#');
			}
		}
		objForm.UpdateButton.addEvent("onClick","setfuseaction('#xfa.Update#');");
		objForm.DeleteButton.addEvent("onClick","ConfirmDelete();");
	</cfif>
</script>
</cfoutput>