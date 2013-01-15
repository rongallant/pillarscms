function load_xml(file_name,onload_function,object)
{
	var target = this;
	
	xml=new XML();
	xml.ignoreWhite = true;
	
	xml.load(file_name);
	
	xml.onLoad = function()
	{
		onload_function(this);
	}
}
