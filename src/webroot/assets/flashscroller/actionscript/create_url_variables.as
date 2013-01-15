function create_url_variables(url)
{
	if(url == undefined)
	{
		url = _url;	
	}
	
	_root.url = [];
	
	query_string = url.split("?")[1].split("&");
	
	for(position=0; position<query_string.length; position++)
	{
		variable = unescape(query_string[position].split("=")[0]);
		value = unescape(query_string[position].split("=")[1]);
		
		_root.url[variable] = value;
	}
	
}
