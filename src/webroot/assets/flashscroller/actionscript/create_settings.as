function create_settings(xml)
{	
	_root.settings = [];
	
	settings_length = xml.firstChild.childNodes.length;
	
	for(setting = 0; setting<settings_length; setting++)
	{
		_root.settings[xml.firstChild.childNodes[setting].nodeName] = xml.firstChild.childNodes[setting].childNodes[0].toString();
	}
	
	/* remove the following line to encapsulate and reuse this file */
	load_xml(_root.url["entries_file"],create_scroller,"scroller");
}
