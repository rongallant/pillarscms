dynamic class actionscript.create_text_formats
{
	public function create_text_formats(xml)
	{
		text_formats = xml.firstChild.childNodes.length;
		
		for(text_format = 0; text_format<text_formats; text_format++)
		{
			_root[xml.firstChild.childNodes[text_format].childNodes[0].childNodes[0]] = new TextFormat();
			
			text_format_attributes = xml.firstChild.childNodes[text_format].childNodes;
			
			for(attribute = 1; attribute<text_format_attributes.length; attribute++)
			{
				_root[xml.firstChild.childNodes[text_format].childNodes[0].childNodes[0]][text_format_attributes[attribute].nodeName] = text_format_attributes[attribute].childNodes[0].toString();
			}
		}
	}
}