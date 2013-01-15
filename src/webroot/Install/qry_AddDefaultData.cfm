<cfquery name="AddDefaultData" datasource="#form.dsn#">
/* #form.tableprefix#_apps */

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=ListGroups.home', 'This tool enables you to create private pages on your site.  Use the User Permissions Manager to assign users access to these pages.', '0181245A-DA74-D704-1DFF-3FEF6775C881', 'pagepermissions', 'Page Permissions');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '0', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'pagegroup', '', 'This is the group that you will add members of your team to enable them to see these pages.', '018E0E4E-BE2D-0417-84A7-5AE5E908EA4B', '018E0E4E-BE2D-0417-84A7-5AE5E908EA4B', 'Team Area');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '0', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'group', '', 'DO NOT DELETE! This is the main account that gives users full access to the backend.', '3B178C8C-E11D-1E3E-70B8-55C7BCA85B6A', 'admin', 'All Applications');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=users.home', 'This tool allows you create user accounts, and assign them permissions to the various administration tools and private pages of your site.', '3B178CFA-A7D7-7834-4403-8FBD9B9BFE81', 'usermanager', 'User Permissions Manager');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=pgfilemanager.home', 'This tool enables you to upload, rename, move and delete files in your site. (e.g. pdf, doc, jpg)', '3B178D09-B8BA-2011-D9F1-85890AA1CC40', 'filemanager', 'File Manager');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=contenteditor.home', 'This tool allows you to create, update, reorder and delete the content in your site. (You can insert this content as page blocks using the Block Manager tool).', '3B178D19-A52F-C24B-CD3D-19584A142E4C', 'contentmanager', '* Content Manager');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=settings.home', 'This tool enables you to modify various bits of information and features on your site. Some of these include, site title and contact form email addresses.', '3B178D28-F304-8C4B-5E6C-28DF29D662D9', 'settingsmanager', 'Settings Manager');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '0', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'group', '', 'Site administrators need access to this account if you want them to see the admin and edit buttons on your site.', '3B178D38-D287-6527-98DA-A1CEBF12FE09', 'sitemanager', 'Site Administration');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=scroll.home', 'Here you can create and modify those little scrolling blocks of content.', '3B178D48-F85E-A7A0-F1D6-E081C3498E93', 'scrollmanager', 'Scroll Manager');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=newsletteradmin.home', 'This is the administration and content editor for your newsletter.', '3B178D57-9004-94A1-344B-4734ACA0248A', 'newslettermanager', 'Newsletter Manager');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=apps.home', 'Developers administration tool. Do not modify the contents of this tool.', '3B178D67-BBC1-F5A6-C354-943A28616088', 'applicationmanager', 'User Groups Manager');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=SearchManager.home', 'If your site has the search engine enabled, use this tool when you are ready to re-index the search engine.', '3B178D77-F0E4-F262-025D-E9B4E8D947C3', 'SearchManager', 'Search Manager');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=blogadmin.home', 'This tool enables you create a news log. You can organize your news articles into categories. Using the block manager, you can display these articles and categories on your web page in blocks.', '3B178D86-B304-A768-EDA4-E9121AE36343', 'blogmanager', 'News Manager');

INSERT INTO #form.tableprefix#_apps
	( enabled,cr_ts,lsup_ts,cr_id,lsup_id,type,path,description,id,identifier,name )
VALUES
	( '1', CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'application', 'index.cfm?fuseaction=blockmanager.home', 'The small boxes of information surrounding your pages are called blocks. This tool enables you insert content and small applications into these blocks.', '3B178D96-946B-8D0F-8751-036970EE32D1', 'blockmanager', 'Block Manager');

/* #form.tableprefix#_Articles */

INSERT INTO #form.tableprefix#_Articles
	( article_enabled,cr_ts,lu_ts,article_order,article_content,cr_id,lu_id,article_id,fk_issue_id,article_title )
VALUES
	( 1, CURDATE(), CURDATE(), 1, '<p>Welcome to your newsletter.</p><p>This is only sample text.</p>', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '3B178E51-F7A1-B146-570B-87138E8EA579', '3B178CEA-9165-817A-F325-96C4E5A83D87', 'Welcome');

/* #form.tableprefix#_Blocks */

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'NewsScroller.flash', '', '90DADAFD-A673-319D-5CF5-2EC087C7A4DF', 'News', 'none', 'rightcolumn', '01C83340-EB0A-5BDD-3A33-DFE0A80E5ACF', 'EF361354-5B34-4AC8-A4DE-FE9193F17EEF', 'B4757BF3-A9B6-D8AF-033A-95DD65A1A18B');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 1, 'pages.ToggleAdmin', '', '', 'Toggle Admin Button', 'none', 'adminmenu', '28EACD50-FD66-F878-A21B-CF452333586C', '9FCFF167-A344-48F6-8A65-56333071F87C', '1');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 1, 'pages.menu', '', '', 'Main Menu', 'mainmenu', 'leftcolumn', 'DE974308-A0C5-959D-1ED8-D1E26F9C359F', '6686AFB5-DB3E-4A8D-8F50-C082710CC92F', '1');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'pages.NoTitle', '', 'E3697DF3-02F3-4909-92DF-5F09203BDD05', 'Block Two', 'block2', 'rightcolumn', 'E36A456F-E155-4CCE-E19F-E98FA1D418C2', '97E14545-C02A-4CE4-8703-3928D409D51A', '9F9854E8-D336-D27D-7BE2-B82BDDA27D9F');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'pages.NoTitle', '', 'E3697DF3-02F3-4909-92DF-5F09203BDD05', 'Block One', 'block1', 'leftcolumn', 'E36AA823-0F0F-A4D3-A6C0-170D8F6D4E8C', '97E14545-C02A-4CE4-8703-3928D409D51A', '9F9854E8-D336-D27D-7BE2-B82BDDA27D9F');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 2, 1, 'pages.submenu', '', '', 'Sub Menu', 'none', 'top', 'E3C944B2-CE3D-B50D-FE82-EBB6BE00CCEE', '104C3EB9-DF05-429A-8548-40A93492F6E1', '1');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 1, 'pages.breadcrumbs', '', '', 'Bread Crumbs', 'none', 'top', 'E3C9EDF6-E587-4248-7F43-CE145EC137AF', 'FC777936-40F2-4E7B-866B-4131EEB63FE5', '1');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 1, 'pages.NoTitle', '', '1809FF74-C3DE-D2C5-A7E8-AAD2CA58571E', 'Copyright', 'none', 'footer', '180FDBB0-0B1D-AFFB-E7F6-5065F5A2E6CE', '97E14545-C02A-4CE4-8703-3928D409D51A', '1');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'contact.home', '', '', 'Contact Us', 'none', 'bottom', 'E3EDC2B7-C25F-200B-C339-0A97EADB0133', 'EACAD0B1-48FC-48F2-9CC2-EA942E6704C2', 'E3ED4101-06D8-2655-77B0-B8EA53B860B7');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'search.form', '', '', 'Search Form', 'block2', 'leftcolumn', 'E3F07CD9-FEC1-E9BD-3AC5-43C09963E734', '7F610481-C0F5-45C3-AE9F-119D9983D491', 'E35EFDEE-EF02-28BD-3548-66595966FBF5');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'blog.categoryList', '', '745606BB-FA00-1CB1-43C9-88CD7CCBBEBE', 'Weblog Category Top 5,Test Three', 'none', 'leftcolumn', 'E3F14DDA-B141-04D1-6690-588971612604', '2BFDAFE4-4ADC-4DF2-A187-9CBA3CC8E6A2', 'E35EFDEE-EF02-28BD-3548-66595966FBF5');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'blog.topcats', '', '7455CB75-F6BB-DEC8-61FB-F97759877A7A,745606BB-FA00-1CB1-43C9-88CD7CCBBEBE,7455F073-9A95-1486-2A3B-E2D268357C7B', 'Weblog Selected Categories', 'block2', 'rightcolumn', 'E3F23B8C-DB1D-5457-632B-038CFC049102', 'B2CC43CE-7084-49ED-8C5F-D5168B4D924D', 'E35EFDEE-EF02-28BD-3548-66595966FBF5');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'blog.category', '', '7455F073-9A95-1486-2A3B-E2D268357C7B', 'Weblog Category,Test Two', 'none', 'rightcolumn', 'E3F32333-C58E-00E1-D861-3EFB0BC155AE', '2377087E-94DC-4C19-9B79-7B3A6C06A507', 'E35EFDEE-EF02-28BD-3548-66595966FBF5');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'blog.category', '', '7455CB75-F6BB-DEC8-61FB-F97759877A7A', 'WebLog Category Center,Test One', 'none', 'bottom', 'F87D8B4C-F49E-FEB1-3007-8444C57B3A60', '2377087E-94DC-4C19-9B79-7B3A6C06A507', 'B4757BF3-A9B6-D8AF-033A-95DD65A1A18B');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'blog.category', '', '7455CB75-F6BB-DEC8-61FB-F97759877A7A', 'Test One,Test One', 'block1', 'rightcolumn', 'F8E6C828-05F7-37DD-6EB0-D9190CAEEBFD', '2377087E-94DC-4C19-9B79-7B3A6C06A507', 'E3C4D738-9173-9FEE-4BE9-D50FDE013BCC');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'pages.NoTitle', '', 'E3697DF3-02F3-4909-92DF-5F09203BDD05', 'Test', 'block2', 'rightcolumn', 'F916460E-E132-5188-B4A7-8DB07C2DB450', '97E14545-C02A-4CE4-8703-3928D409D51A', 'E3EF43C4-E608-F15D-3282-BD3F892E4069');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 2, 0, 'newsletter.menu', '', '', 'News Letter Articles', 'mainmenu', 'leftcolumn', 'F91EDBE7-913A-85F5-FBFC-82B7C32B6407', '5B31A2F7-833D-4CA4-BD92-AF7604C7406A', 'F90638F1-9B4D-72C7-ABFF-06B4DD797694');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'newsletter.mainmenu', '', '', 'News Letter Main Menu', 'mainmenu', 'leftcolumn', 'F91FE686-E418-8832-D26D-7CFDC651ECBE', '03751D24-C809-4998-86D0-2F101D5D5B01', 'F90638F1-9B4D-72C7-ABFF-06B4DD797694');

INSERT INTO #form.tableprefix#_Blocks
	( orderby,displaymode,blockfuseaction,blockidname,blockidlist,blocktitle,layout,layoutarea,blockid,fk_blocktypeid,fk_pageid )
VALUES
	( 1, 0, 'pages.NoTitle', '', '0868CDB6-B4BC-9551-49EE-16744767388A', 'Page Three Block', 'block1', 'rightcolumn', '0869AA23-BEAF-B78C-8F05-8BEAE543FC38', '97E14545-C02A-4CE4-8703-3928D409D51A', '085F7A08-0CD4-E2D8-7630-8E3161282745');


/* #form.tableprefix#_BlockTypes */

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 11, 'newsletter.mainmenu', 'bmEdit.add', '', '03751D24-C809-4998-86D0-2F101D5D5B01', 'newslettermain', 'News Letter Main Menu');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 10, 'pages.submenu', 'bmEdit.add', '', '104C3EB9-DF05-429A-8548-40A93492F6E1', 'submenu', 'Sub Menu');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 9, 'blog.category', 'bmEdit.selectBlogCat', 'catid', '2377087E-94DC-4C19-9B79-7B3A6C06A507', 'blogcat', 'News Category');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 7, 'blog.categoryList', 'bmEdit.selectBlogCatList', 'catid', '2BFDAFE4-4ADC-4DF2-A187-9CBA3CC8E6A2', 'blogcattop', 'News Category Top 5 Headlines');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 12, 'newsletter.menu', 'bmEdit.add', '', '5B31A2F7-833D-4CA4-BD92-AF7604C7406A', 'newsletterentries', 'NewsLetter Entries');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 4, 'pages.menu', 'bmEdit.add', '', '6686AFB5-DB3E-4A8D-8F50-C082710CC92F', 'mainmenu', 'Main Menu');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 2, 'search.form', 'bmEdit.add', '', '7F610481-C0F5-45C3-AE9F-119D9983D491', 'searchform', 'Search Form');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 1, 'pages.NoTitle', 'bmEdit.selectPage', 'pageid', '97E14545-C02A-4CE4-8703-3928D409D51A', 'page', 'Content (block)');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 6, 'pages.ToggleAdmin', 'bmEdit.add', '', '9FCFF167-A344-48F6-8A65-56333071F87C', 'toggleddmin', 'Admin Menu (only admins see)');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 8, 'blog.topcats', 'bmEdit.selectBlogTopCats', 'catid', 'B2CC43CE-7084-49ED-8C5F-D5168B4D924D', 'blogtopfromcat', 'News Top Entry From Selected Categories');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 3, 'contact.home', 'bmEdit.add', '', 'EACAD0B1-48FC-48F2-9CC2-EA942E6704C2', 'contactform', 'Contact Form');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 13, 'NewsScroller.flash', 'bmEdit.selectNewsScroller', 'scrollerid', 'EF361354-5B34-4AC8-A4DE-FE9193F17EEF', 'newsscroller', 'News Scroller');

INSERT INTO #form.tableprefix#_BlockTypes
	( orderby,blockfuseaction,blockselectfuseaction,blockvarname,blocktypeid,blocktypename,displayname )
VALUES
	( 5, 'pages.breadcrumbs', 'bmEdit.add', '', 'FC777936-40F2-4E7B-866B-4131EEB63FE5', 'breadcrumbs', 'Bread Crumbs');

/* #form.tableprefix#_BlogCategories */

INSERT INTO #form.tableprefix#_BlogCategories
	( cr_ts,lu_ts,cr_id,lu_id,catid,title,description )
VALUES
	( CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '7455CB75-F6BB-DEC8-61FB-F97759877A7A', 'Test One', 'Test One');

INSERT INTO #form.tableprefix#_BlogCategories
	( cr_ts,lu_ts,cr_id,lu_id,catid,title,description )
VALUES
	( CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '7455F073-9A95-1486-2A3B-E2D268357C7B', 'Test Two', 'Test');

INSERT INTO #form.tableprefix#_BlogCategories
	( cr_ts,lu_ts,cr_id,lu_id,catid,title,description )
VALUES
	( CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '745606BB-FA00-1CB1-43C9-88CD7CCBBEBE', 'Test Three', 'Test');

/* #form.tableprefix#_BlogCategoriesEntries */

INSERT INTO #form.tableprefix#_BlogCategoriesEntries
	( cr_ts,fk_catid,fk_entryid,cr_id )
VALUES
	( CURDATE(), '7455CB75-F6BB-DEC8-61FB-F97759877A7A', '74564D7B-FB41-5521-E184-152005E1DC54', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogCategoriesEntries
	( cr_ts,fk_catid,fk_entryid,cr_id )
VALUES
	( CURDATE(), '7455CB75-F6BB-DEC8-61FB-F97759877A7A', '74567DA5-F1E9-485C-59DB-581DEBD314ED', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogCategoriesEntries
	( cr_ts,fk_catid,fk_entryid,cr_id )
VALUES
	( CURDATE(), '7455CB75-F6BB-DEC8-61FB-F97759877A7A', '7456BC95-0855-24B7-831E-81E2F4C6EA41', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogCategoriesEntries
	( cr_ts,fk_catid,fk_entryid,cr_id )
VALUES
	( CURDATE(), '7455F073-9A95-1486-2A3B-E2D268357C7B', '74567DA5-F1E9-485C-59DB-581DEBD314ED', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogCategoriesEntries
	( cr_ts,fk_catid,fk_entryid,cr_id )
VALUES
	( CURDATE(), '7455F073-9A95-1486-2A3B-E2D268357C7B', '7456BC95-0855-24B7-831E-81E2F4C6EA41', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogCategoriesEntries
	( cr_ts,fk_catid,fk_entryid,cr_id )
VALUES
	( CURDATE(), '745606BB-FA00-1CB1-43C9-88CD7CCBBEBE', '74567DA5-F1E9-485C-59DB-581DEBD314ED', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogCategoriesEntries
	( cr_ts,fk_catid,fk_entryid,cr_id )
VALUES
	( CURDATE(), '745606BB-FA00-1CB1-43C9-88CD7CCBBEBE', '7456BC95-0855-24B7-831E-81E2F4C6EA41', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogCategoriesEntries
	( cr_ts,fk_catid,fk_entryid,cr_id )
VALUES
	( CURDATE(), '745606BB-FA00-1CB1-43C9-88CD7CCBBEBE', '7456FBE2-D224-E687-0315-B234B2397F5F', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogCategoriesEntries
	( cr_ts,fk_catid,fk_entryid,cr_id )
VALUES
	( CURDATE(), '745606BB-FA00-1CB1-43C9-88CD7CCBBEBE', '74572F87-ED2D-5C81-BB1E-593E52C76175', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogCategoriesEntries
	( cr_ts,fk_catid,fk_entryid,cr_id )
VALUES
	( CURDATE(), '745606BB-FA00-1CB1-43C9-88CD7CCBBEBE', '7BAF7D94-C11B-0DD2-998E-6528E27CF164', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

/* #form.tableprefix#_BlogEntries */

INSERT INTO #form.tableprefix#_BlogEntries
	( enabled,cr_ts,lu_ts,shorttext,`longtext`,lu_id,entryid,title,cr_id )
VALUES
	( 1, CURDATE(), CURDATE(), 'Entry', '', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '74564D7B-FB41-5521-E184-152005E1DC54', 'Entry One', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogEntries
	( enabled,cr_ts,lu_ts,shorttext,`longtext`,lu_id,entryid,title,cr_id )
VALUES
	( 1, CURDATE(), CURDATE(), '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p> <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '74567DA5-F1E9-485C-59DB-581DEBD314ED', 'Entry Two', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogEntries
	( enabled,cr_ts,lu_ts,shorttext,`longtext`,lu_id,entryid,title,cr_id )
VALUES
	( 1, CURDATE(), CURDATE(), '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>', '', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '7456BC95-0855-24B7-831E-81E2F4C6EA41', 'Entry Three', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogEntries
	( enabled,cr_ts,lu_ts,shorttext,`longtext`,lu_id,entryid,title,cr_id )
VALUES
	( 1, CURDATE(), CURDATE(), 'Entry', '', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '7456FBE2-D224-E687-0315-B234B2397F5F', 'Entry Four', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogEntries
	( enabled,cr_ts,lu_ts,shorttext,`longtext`,lu_id,entryid,title,cr_id )
VALUES
	( 1, CURDATE(), CURDATE(), 'Entry', '', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '74572F87-ED2D-5C81-BB1E-593E52C76175', 'Entry Five', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_BlogEntries
	( enabled,cr_ts,lu_ts,shorttext,`longtext`,lu_id,entryid,title,cr_id )
VALUES
	( 1, CURDATE(), CURDATE(), '<h1>rstsf</h1>', '', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '7BAF7D94-C11B-0DD2-998E-6528E27CF164', 'How do you feel', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

/* #form.tableprefix#_GroupsPages */

INSERT INTO #form.tableprefix#_GroupsPages
	( fk_groupid,fk_pageid )
VALUES
	( '018E0E4E-BE2D-0417-84A7-5AE5E908EA4B', '0185C40F-DB2F-31A0-2787-943A04CFF749');

INSERT INTO #form.tableprefix#_GroupsPages
	( fk_groupid,fk_pageid )
VALUES
	( '018E0E4E-BE2D-0417-84A7-5AE5E908EA4B', '06F30B6A-981A-033D-2542-25A14ABC392A');

/* #form.tableprefix#_Issues */

INSERT INTO #form.tableprefix#_Issues
	( issue_enabled,issue_startdate,cr_ts,lu_ts,issue_notes,cr_id,lu_id,issue_id,issue_editor,issue_credits )
VALUES
	( '1', CURDATE(), CURDATE(), CURDATE(), '', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '3B178CEA-9165-817A-F325-96C4E5A83D87', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '');

/* #form.tableprefix#_LayoutAreas */

INSERT INTO #form.tableprefix#_LayoutAreas
	( orderby,displayname,areaid,fk_layoutid,name )
VALUES
	( 6, 'Footer', '10494D33-11B4-460D-9942-D2BF4726E19E', '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 'footer');

INSERT INTO #form.tableprefix#_LayoutAreas
	( orderby,displayname,areaid,fk_layoutid,name )
VALUES
	( 2, 'Left Column', '2BFC532A-C3B8-4412-BA83-B3F410919F72', '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 'leftcolumn');

INSERT INTO #form.tableprefix#_LayoutAreas
	( orderby,displayname,areaid,fk_layoutid,name )
VALUES
	( 3, 'Top (above content)', '33CF6E1C-15C7-4FA0-A9D6-561714FE538A', '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 'top');

INSERT INTO #form.tableprefix#_LayoutAreas
	( orderby,displayname,areaid,fk_layoutid,name )
VALUES
	( 1, 'Site Menu', '7048526F-63C9-40C7-8742-C6167DCD07B2', '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 'sitemenu');

INSERT INTO #form.tableprefix#_LayoutAreas
	( orderby,displayname,areaid,fk_layoutid,name )
VALUES
	( 5, 'Right Column', 'B91290B7-AA1C-4B32-894C-34469DA22C81', '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 'rightcolumn');

INSERT INTO #form.tableprefix#_LayoutAreas
	( orderby,displayname,areaid,fk_layoutid,name )
VALUES
	( 4, 'Bottom (below content)', 'C0E8DAAC-2F8B-48C1-9249-07978DAF866A', '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 'bottom');

INSERT INTO #form.tableprefix#_LayoutAreas
	( orderby,displayname,areaid,fk_layoutid,name )
VALUES
	( 7, 'Main Menu (top)', 'E4A68ED9-533C-49C1-B3A5-5AA06E71BBD6', '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 'mainmenu');

INSERT INTO #form.tableprefix#_LayoutAreas
	( orderby,displayname,areaid,fk_layoutid,name )
VALUES
	( 8, 'Admin Menu (bottom)', '17F5E6E3-EA9C-149E-5F83-84E5CAABA55B', '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 'adminmenu');

/* #form.tableprefix#_Layouts */

INSERT INTO #form.tableprefix#_Layouts
	( orderby,type,layoutid,name,displayname )
VALUES
	( 1, 'toplevel', '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 'themeone', 'Main Theme');

INSERT INTO #form.tableprefix#_Layouts
	( orderby,type,layoutid,name,displayname )
VALUES
	( 2, 'toplevel', 'CE5168B1-55DE-4C24-968C-9F1F8D5B348B', 'themetwo', 'Theme Two');


INSERT INTO #form.tableprefix#_Layouts
	( orderby,type,layoutid,name,displayname )
VALUES
	( 1, 'block', '17F38FE6-0374-7E12-C580-14451A203C3B', 'block1', 'Block One');

INSERT INTO #form.tableprefix#_Layouts
	( orderby,type,layoutid,name,displayname )
VALUES
	( 2, 'block', '345ECDDB-C014-40DF-A16A-03A338D3CFA8', 'block2', 'Block Two');

INSERT INTO #form.tableprefix#_Layouts
	( orderby,type,layoutid,name,displayname )
VALUES
	( 4, 'block', 'D378E5D5-126F-4CCE-9D81-13043FF7FFA2', 'mainmenu', 'Main Menu (vertical)');

INSERT INTO #form.tableprefix#_Layouts
	( orderby,type,layoutid,name,displayname )
VALUES
	( 5, 'block', '17F088EE-EDB9-1458-1DCD-1E1E7DF67008', 'mainmenuhorizontal', 'Main Menu (horizontal)');

INSERT INTO #form.tableprefix#_Layouts
	( orderby,type,layoutid,name,displayname )
VALUES
	( 6, 'block', 'E8A8F296-AC47-4EC2-A628-65419AD23211', 'submenu', 'Sub Menu');


/* #form.tableprefix#_pgPages */

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( '0185C40F-DB2F-31A0-2787-943A04CFF749', '1', 'page', 'Team Area', 'Team Area (Secure)', '', '', 'Team Area (Secure)', '', 6, '', CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( '085F7A08-0CD4-E2D8-7630-8E3161282745', '1', 'page', 'Third Page', 'Third Page', '', '', 'Duis autem vel eum iriure dolor in. hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', '', 3, '', CURDATE(), CURDATE(), '', 0, NULL, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( '0868CDB6-B4BC-9551-49EE-16744767388A', '2', 'block', 'Page Three Block', 'Test', '', '', 'Duis autem vel eum iriure dolor in. hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat', '', 14, '', CURDATE(), CURDATE(), '', 0, NULL, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( '1', '', 'page', '-ROOT', 'ROOT', '', '', '', '', 0, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 0, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), '');

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( '9F9854E8-D336-D27D-7BE2-B82BDDA27D9F', '1', 'page', 'Heading One', 'Home', '', '', '<p><strong>I am strong text.</strong> <em>I am em text.</em> <u>I am underlined text.</u> Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p> <p>Duis autem vel eum iriure dolor in <a href="http://google.com">I am a regular link</a>. hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p> <p>&nbsp;</p> <hr /> <h2>Heading Two</h2> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p> <h3>Heading Three</h3> <blockquote>I am a block quote. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </blockquote> <h4>Heading Four</h4> <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p> <h5>Heading Five</h5> <ul> <li>List Item </li> <li>List Item </li> <li>List Item </li> </ul> <hr /> <h6>Heading Six</h6> <ol> <li>List Item </li> <li>List Item </li> <li>List Item </li> </ol>', '', 1, '', CURDATE(), CURDATE(), '', 0, 1, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( 'B4757BF3-A9B6-D8AF-033A-95DD65A1A18B', '1', 'page', 'Second Page', 'Second Page', '', '', '', '', 2, '', CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( 'E35EFDEE-EF02-28BD-3548-66595966FBF5', 'B4757BF3-A9B6-D8AF-033A-95DD65A1A18B', 'page', 'Sub Page', 'Sub Page', '', '', 'Sub Page using theme two. Also using page tools.', '', 9, '', CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( 'E3697DF3-02F3-4909-92DF-5F09203BDD05', '2', 'block', 'Test Block', 'Test Block', '', '', '<h1>Heading One</h1> <p><strong>I am strong text.</strong> <em>I am em text.</em> <u>I am underlined text.</u> Lorem ipsum dolor sit amet.</p> <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit.</p> <h2>Heading Two</h2> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p> <h3>Heading Three</h3> <blockquote>I am a block quote. Lorem ipsum dolor sit amet. </blockquote> <h4>Heading Four</h4> <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit Duis autem vel eum iriure dolor in hendrerit in vulputate velit.</p> <h5>Heading Five</h5> <ul> <li>List Item </li> <li>List Item </li> <li>List Item </li> </ul> <h6>Heading Six</h6> <ol> <li>List Item </li> <li>List Item </li> <li>List Item </li> </ol>', '', 10, '', CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( 'E3C4D738-9173-9FEE-4BE9-D50FDE013BCC', 'E35EFDEE-EF02-28BD-3548-66595966FBF5', 'page', 'Sub Sub Page', 'Sub Sub Page', '', '', 'Sub Sub Page', '', 11, '', CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( 'E3ED4101-06D8-2655-77B0-B8EA53B860B7', 'E35EFDEE-EF02-28BD-3548-66595966FBF5', 'page', 'Contact Us', 'Contact Us', '', '', '<p><font size="3">This is the contact us form.</font></p>', '', 12, '', CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( 'E3EF43C4-E608-F15D-3282-BD3F892E4069', '1', 'link', 'News Category', 'News Category', 'index.cfm?fuseaction=blog.category&catid=7455CB75-F6BB-DEC8-61FB-F97759877A7A', '_top', '', '', 4, '', CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( 'F90638F1-9B4D-72C7-ABFF-06B4DD797694', '1', 'link', 'Newsletter', 'Newsletter', 'index.cfm?fuseaction=newsletter.home', '_top', '', '', 5, '', CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( '06F479ED-E222-84A8-7666-3808F83CC8A7', '1', 'link', 'Login', 'Login', 'index.cfm?fuseaction=security.loginform', '_top', '', '', 7, '', CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( '06F30B6A-981A-033D-2542-25A14ABC392A', '1', 'link', 'Logout', 'Logout', 'index.cfm?fuseaction=security.logout', '_top', '', '', 8, '', CURDATE(), CURDATE(), '', 0, 0, '10272A8B-B81A-4AA3-A91D-713E6DE9EB43', 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

INSERT INTO #form.tableprefix#_pgPages
	( pg_id,parent_id,pg_type,pg_title,pg_link_name,pg_link_url,pg_LinkUrlTarget,pg_Content,pg_link,pg_Order,pg_Author,pg_PublishDate,pg_RemoveDate,pg_Notes,pg_DisplayMenu,pg_isHome,fk_layoutid,pg_DisplayNav,pg_Schedule,pg_Enabled,cr_ts,cr_id,lu_ts,lu_id )
VALUES
	( '1809FF74-C3DE-D2C5-A7E8-AAD2CA58571E', '2', 'block', 'Copyright', 'Copyright', '', '', '<p style="MARGIN-TOP: 0px; FONT-SIZE: 11px; COLOR: gray" align="center">&copy; #year(now())# Pillar CMS</p>', '', 12, '', CURDATE(), CURDATE(), '', 0, 0, NULL, 0, 0, 1, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />);

/* #form.tableprefix#_ScrollEntries */

INSERT INTO #form.tableprefix#_ScrollEntries
	( txtbold,txtitalic,txtunderline,cr_ts,lu_ts,lu_id,txtsize,txtcolor,cr_id,linkurl,linktarget,txtfont,entryid,fk_scrollerid,linktext )
VALUES
	( 0, 0, 0, CURDATE(), CURDATE(), <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '14', '000000', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'Test.cfm', '_top', 'arial', '013BEFFE-9E31-D537-03EA-07018E78E5E0', '90DADAFD-A673-319D-5CF5-2EC087C7A4DF', 'Test');

INSERT INTO #form.tableprefix#_ScrollEntries
	( txtbold,txtitalic,txtunderline,cr_ts,lu_ts,lu_id,txtsize,txtcolor,cr_id,linkurl,linktarget,txtfont,entryid,fk_scrollerid,linktext )
VALUES
	( 1, 0, 1, CURDATE(), CURDATE(), '', '11', '000000', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 'http://www.google.com/search?hl=en&q=test', '_blank', 'arial', '959D0CC7-0E13-716C-A298-86C514C719FF', '90DADAFD-A673-319D-5CF5-2EC087C7A4DF', 'This is an entry');

INSERT INTO #form.tableprefix#_ScrollEntries
	( txtbold,txtitalic,txtunderline,cr_ts,lu_ts,lu_id,txtsize,txtcolor,cr_id,linkurl,linktarget,txtfont,entryid,fk_scrollerid,linktext )
VALUES
	( 0, 0, 0, CURDATE(), CURDATE(), '', '11', '000000', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '', '_top', 'arial', '959D32BA-C3FC-8BB9-2CCE-21F9D84D2658', '90DADAFD-A673-319D-5CF5-2EC087C7A4DF', 'This is another entry');

/* #form.tableprefix#_Scrollers */

INSERT INTO #form.tableprefix#_Scrollers
	( cr_ts,lu_ts,scrolltime,stoptime,cr_id,lu_id,width,bgcolor,notes,scrollerid,name,height )
VALUES
	( CURDATE(), CURDATE(), 5, 3, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '180', 'EEEEEE', 'This scroller is displayed on the sites homepage via a block.', '90DADAFD-A673-319D-5CF5-2EC087C7A4DF', 'Homepage Scroller', '200');

/* #form.tableprefix#_Settings */

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
	
VALUES
	( 1, 'Name used by application. Only uppercase alpha charactors.', 'text', 'name', <cfqueryparam value="" cfsqltype="cf_sql_varchar" maxlength="5000" />, 'Site Name', '3B178DA5-ADE0-14F1-2F60-3BEA232EE762', '3B178CCB-DF71-0614-5D67-9D819C7546D1', 'my.site');

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
VALUES
	( 2, 'Name to be displayed to the user.', 'text', 'title', '#form.SiteHeading#', 'Site Heading', '3B178DB5-F69A-B1D8-3395-9B5B0807849B', '3B178CCB-DF71-0614-5D67-9D819C7546D1', 'my.site');

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
VALUES
	( 3, 'Slogan for site.', 'text', 'subtitle', '', 'Site Subheading', '3B178DD4-C07E-9652-9C8C-B6CB453474D9', '3B178CCB-DF71-0614-5D67-9D819C7546D1', 'my.site');

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
VALUES
	( 4, 'Domain and path to site root.', 'text', 'url', '#form.SiteURL#', 'Site URL', '3B178DE4-F3D0-BC9B-12D2-A382AA66950D', '3B178CCB-DF71-0614-5D67-9D819C7546D1', 'my.site');

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
VALUES
	( 1, '', 'text', 'address', <cfqueryparam value="#my.user.email#" cfsqltype="cf_sql_varchar" maxlength="256" />, 'Email Address', '3B178DF4-DFDE-E56F-AF08-DA739B1BBC58', '3B178CDA-B439-D759-9048-1EA2D56AFFF5', 'my.email.contactus');

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
VALUES
	( 2, '', 'text', 'return', <cfqueryparam value="#my.user.email#" cfsqltype="cf_sql_varchar" maxlength="256" />, 'Return Address', '3B178E13-9217-3D9F-D8D4-52918AF787CA', '3B178CDA-B439-D759-9048-1EA2D56AFFF5', 'my.email.contactus');

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
VALUES
	( 3, '', 'text', 'subject', 'Email From Your Site', 'Email Subject Line', '3B178E22-EA07-327C-AE5C-ECE5C4B4D609', '3B178CDA-B439-D759-9048-1EA2D56AFFF5', 'my.email.contactus');

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
VALUES
	( 1, 'Email Address errors default to', 'text', 'address', <cfqueryparam value="#my.user.email#" cfsqltype="cf_sql_varchar" maxlength="256" />, 'Email Address', '9220B803-A372-43E0-966E-D1827093CAC0', '324EFA49-24DD-4AC1-B1B1-F655BE5F0FCB', 'my.email.errors');

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
VALUES
	( 5, 'Email address errors will be sent too.', 'text', 'webmaster', <cfqueryparam value="#my.user.email#" cfsqltype="cf_sql_varchar" maxlength="256" />, 'Webmaster Email', 'C126CFBE-BF5B-4669-B14E-FBD3CD831626', '3B178CCB-DF71-0614-5D67-9D819C7546D1', 'my.email');

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
VALUES
	( 4, 'Page where users are send after sending email.', 'text', 'thankyoupage', 'index.cfm?fuseaction=contact.thankyou', 'Thank You Page', 'CB9E2BCE-2E83-4F4F-97D3-8E984FCCE8F7', '3B178CCB-DF71-0614-5D67-9D819C7546D1', 'my.email.contactus');

INSERT INTO #form.tableprefix#_Settings
	( varOrderby,varDescription,varFieldType,varName,varValue,varTitle,varID,fk_groupid,varScope )
VALUES
	( 2, '', 'text', 'return', <cfqueryparam value="#my.user.email#" cfsqltype="cf_sql_varchar" maxlength="256" />, 'Return Address', 'FA8B20C0-34B8-4A2D-B51A-26D691EB57C2', '324EFA49-24DD-4AC1-B1B1-F655BE5F0FCB', 'my.email.errors');

/* #form.tableprefix#_SettingsGrps */

INSERT INTO #form.tableprefix#_SettingsGrps
	( groupOrderby,groupid,groupName,groupDescription )
VALUES
	( 3, '324EFA49-24DD-4AC1-B1B1-F655BE5F0FCB', 'Site Error Handling', 'Settings for site error handling');

INSERT INTO #form.tableprefix#_SettingsGrps
	( groupOrderby,groupid,groupName,groupDescription )
VALUES
	( 2, '3B178CCB-DF71-0614-5D67-9D819C7546D1', 'Site Settings', 'Global settings for the whole site.');

INSERT INTO #form.tableprefix#_SettingsGrps
	( groupOrderby,groupid,groupName,groupDescription )
VALUES
	( 1, '3B178CDA-B439-D759-9048-1EA2D56AFFF5', 'Contact Us Form', 'Settings for contact us form.');

/* #form.tableprefix#_users */

INSERT INTO #form.tableprefix#_users ( 
	enabled, 
	cr_ts, 
	lsup_ts, 
	notes, 
	cr_id, 
	lsup_id, 
	username, 
	password, 
	firstname, 
	lastname, 
	email_work, 
	phone_work
)
VALUES ( 
	'1', 
	CURDATE(), 
	CURDATE(), 
	'', 
	<cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 
	<cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, 
	<cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />,
	<cfqueryparam value="#my.user.password#" cfsqltype="cf_sql_varchar" maxlength="32" />,
	<cfqueryparam value="#my.user.fname#" cfsqltype="cf_sql_varchar" maxlength="256" />,
	<cfqueryparam value="#my.user.lname#" cfsqltype="cf_sql_varchar" maxlength="256" />,
	<cfqueryparam value="#my.user.email#" cfsqltype="cf_sql_varchar" maxlength="256" />,
	''
);

/* #form.tableprefix#_userapps */

INSERT INTO #form.tableprefix#_userapps
	( cr_ts,lsup_ts,permissions,cr_id,lsup_id,fk_app_id,fk_user_id,notes )
VALUES
	( CURDATE(), CURDATE(), 800, <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '', '3B178C8C-E11D-1E3E-70B8-55C7BCA85B6A', <cfqueryparam value="#my.user.userid#" cfsqltype="cf_sql_varchar" maxlength="8" />, '');
</cfquery>