function create_scroller(xml)
{
	stage = [];
	stage["height"] = Number(_root.settings["height"]);
	stage["width"] = Number(_root.settings["width"]);
	stage["x"] = 150-Number(_root.settings["width"]);
	stage["y"] = 150-Number(_root.settings["width"]);
	stage["y_padding"] = 5;
	
	_root.createEmptyMovieClip("background",_root.getNextHighestDepth());
	with(_root.background)
	{
		lineStyle(0,0,0);
		beginFill(_root.settings["background_color"],100)
		moveTo(stage["x"],stage["y"]);
		lineTo(stage["x"],stage["height"]);
		lineTo(stage["width"],stage["height"]);
		lineTo(stage["width"],stage["y"]);
		lineTo(stage["x"],stage["y"]);
		endFill();
	}
	
	entries = xml.firstChild.childNodes;
	this.content = [];
	
	for(entry = 0; entry<entries.length; entry++)
	{			
		this["format_"+entry] = new TextFormat();
		
		format_attributes = entries[entry].childNodes[0].childNodes;
		
		for(format_attribute = 0; format_attribute<format_attributes.length; format_attribute++)
		{
			this["format_"+entry][format_attributes[format_attribute].nodeName] = format_attributes[format_attribute].childNodes[0].toString();
		}
		
		this.content[entry] = [];
		
		for(content = 1; content<entries[entry].childNodes.length; content++)
		{
			this.content[entry][entries[entry].childNodes[content].nodeName] = unescape(entries[entry].childNodes[content].childNodes[0]);
		}
		
		_root.createEmptyMovieClip("link_"+entry,_root.getNextHighestDepth());
		
		_root["link_"+entry].create_text("headline",0,0,stage["width"],stage["height"],this.content[entry]["headline"],this["format_"+entry],"left",true,true,false,_root.getNextHighestDepth());
		
		_root["link_"+entry]._x=stage["x"]/2;
		_root["link_"+entry]._y=stage["height"]+10;
		_root["link_"+entry].link = this.content[entry]["link"];
		_root["link_"+entry].target = this.content[entry]["target"];
		
		
		
		_root["link_"+entry].onRelease = function()
		{
			getURL(this.link,this.target);
		}
		
	}
	
	animate("scroll up",0,"all");
	//_root.pause = setInterval(animate,2000,"scroll up",0,"all");
}
	
function animate(animation,entry,type)
{
	clearInterval(_root.pause);
	
	if(animation == "scroll up")
	{
		_root.onEnterFrame = function()
		{
			if(_root["link_"+entry]._y>(stage["y"]/2)+stage["y_padding"])
			{
				_root["link_"+entry]._y-=(stage["height"]/30)/_root.settings["scroll_time"];
			}
			else
			{
				delete _root.onEnterFrame;
				
				if(type == "all")
				{
					_root.scroll_out = setInterval(animate,_root.settings["stop_time"]*1000,"scroll out",entry,type);
				}
			}
		}
	}
	
	if(animation == "scroll out")
	{		
		clearInterval(_root.scroll_out);
		
		_root.onEnterFrame = function()
		{
			if(_root["link_"+entry]._y>((stage["y"]/2)-_root["link_"+entry]._height))
			{
				_root["link_"+entry]._y-=Number((stage["height"]/30)/_root.settings["scroll_time"]);
			}
			else
			{
				delete _root.onEnterFrame;					
				
				_root["link_"+entry]._y=stage["height"]+10;
				
				if(entry < entries.length-1)
				{
					next_entry = entry+1;
				}
				else
				{
					next_entry = 0;
				}
				
				animate("scroll up",next_entry,"all");	
			}
		}
	}
}
