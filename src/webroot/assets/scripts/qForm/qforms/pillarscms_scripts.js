// validate Regular Expression
	// Use this format - objForm.FieldName.validateReqEx(/^.gif|.jpg$/,"Error Message");
	function _f_isReqEx(RegExp,msg) {
		var re = RegExp;
		var isMatch = re.exec(this.value);
		if(!isMatch && this.value!="") {
			this.error = msg;
		}
	}
	// register the validation method
	_addValidator("isReqEx", _f_isReqEx, true);

// I set the fuseaction and submit form
	// This function is fusebox specific
	function setfuseaction(NewAction) {
		objForm.fuseaction.setValue(NewAction);
		objForm.submit();
	}

// I pop up a new window with the desired elements
	// Use this format - javascript:popupPage('file.htm','yes',10,10,640,480);
	function popupPage(page, s, l, t, w, h) {
		var windowprops = "location=no,menubars=no,toolbars=no,resizable=no" + ",scrollbars=" + s + ",left=" + l + ",top=" + t + ",width=" + w + ",height=" + h;
		var URL = page;
		window.open(URL,"MenuPopup",windowprops);
	}

// I check the page for images that didn't load.  If not then I replace it with another image.
	// Works only in IE, use nc="1" in image to ignore or if image is 28X30
	// Load using window.onload=checkImages("image.gif","The image didn't load");
	function checkImages(dimage,dtext) {
		if(document.getElementById) {
			var imagesArr = new Array();
			var setDefaultErrImg=dimage; // Default image to be displayed on error
			var setDefaultErrTxt=dtext; // Default text to be displayed on error 
			imagesArr = document.getElementsByTagName("img");
			for(var i=0; i<imagesArr.length; i++) {
				if(!imagesArr[0].getAttribute("nc")=="1") {
					var tempImgAttrib=imagesArr[i].getAttribute("alt");
					imagesArr[i].setAttribute("alt","");
					if(imagesArr[i].width=="28" && imagesArr[i].height=="30") {
						imagesArr[i].src=setDefaultErrImg;
						imagesArr[i].setAttribute("alt",setDefaultErrTxt);
					} else {
						imagesArr[i].setAttribute("alt",tempImgAttrib);
					}
				}
			}
		}
	}