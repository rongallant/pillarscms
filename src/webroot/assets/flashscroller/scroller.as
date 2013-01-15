#include "actionscript/alert.as"
#include "actionscript/create_url_variables.as"
#include "actionscript/load_xml.as"
#include "actionscript/create_settings.as"
#include "actionscript/create_scroller.as"
#include "actionscript/create_text.as"

Stage.scaleMode = "noScale";

create_url_variables();
load_xml(_root.url["settings_file"],create_settings,"settings");
