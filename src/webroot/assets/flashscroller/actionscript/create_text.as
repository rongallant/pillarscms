MovieClip.prototype.create_text = function(name,x,y,w,h,displayed_text,style,autosize,multiline,wordwrap,embedfonts,depth)
{
	this.createTextField(name,depth,x,y,w,h);
	
	with(this[name])
	{
		text = displayed_text;
		setTextFormat(style);
		multiLine = multiline;
		selectable = false;
		wordWrap = wordwrap;
		
		if(embedfonts != false)
		{
			embedFonts = true;
		}
	}
	
	this[name].autoSize = autosize;
}