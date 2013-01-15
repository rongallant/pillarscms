// Ron Gallant - 2003-10-14
// src for other scripts http://www.mattkruse.com/javascript/popupwindow/combined_source.html
// Usage:
// <script type="text/javascript" src="scripts/AnchorPosition.js"></script>
// <script type="text/javascript" src="scripts/PopupWindow.js"></script>
// <script type="text/javascript" src="scripts/PopupWin.js"></script>
// <a href="popupwin('index.html','here',100,120)" name="here" id="here"> must have a space for IE</a>
function popupwin(theurl,anchorname,width,height) {
	var win = new PopupWindow(); 
	win.autoHide();
	win.setSize(1,1);
	win.setUrl(theurl);
	win.offsetX = 1200;
	win.offsetY = 20;
	win.showPopup(anchorname);
}