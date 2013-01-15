function Toggle(item) {
	obj = document.getElementById(item);
	visible = (obj.style.display != "none");
	key = document.getElementById("x" + item);
	if (visible) {
		obj.style.display="none";
		key.style.listStyleImage="url('designs/defaultdesign/defaulttheme/icons/SmallPlus.gif')";
	} else {
		obj.style.display="block";
		key.style.listStyleImage="url('designs/defaultdesign/defaulttheme/icons/SmallMinus.gif')";
	}
}