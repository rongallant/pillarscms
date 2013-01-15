<cfquery name="CreateTables" datasource="#form.dsn#">
CREATE TABLE [dbo].[#form.tableprefix#_Articles] (
	[article_id] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_issue_id] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[article_title] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[article_content] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[article_order] [int] NULL ,
	[article_enabled] [bit] NOT NULL ,
	[cr_ts] [datetime] NOT NULL ,
	[cr_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[lu_ts] [datetime] NULL ,
	[lu_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_BlockTypes] (
	[blocktypeid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[blocktypename] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[displayname] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[blockfuseaction] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[blockselectfuseaction] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[blockvarname] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderby] [int] NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_Blocks] (
	[blockid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_blocktypeid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_pageid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[blocktitle] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[layout] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[layoutarea] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderby] [int] NULL ,
	[blockfuseaction] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[blockidname] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[blockidlist] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[displaymode] [int] NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_BlogCategories] (
	[catid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[title] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[description] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cr_ts] [datetime] NULL ,
	[cr_id] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lu_ts] [datetime] NULL ,
	[lu_id] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_BlogCategoriesEntries] (
	[fk_catid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_entryid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cr_ts] [datetime] NULL ,
	[cr_id] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_BlogEntries] (
	[entryid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[title] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[shorttext] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[longtext] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[enabled] [bit] NULL ,
	[cr_ts] [datetime] NULL ,
	[cr_id] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lu_ts] [datetime] NULL ,
	[lu_id] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_GroupsPages] (
	[fk_groupid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_pageid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_Issues] (
	[issue_id] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[issue_startdate] [datetime] NOT NULL ,
	[issue_enabled] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[issue_editor] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[issue_credits] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[issue_notes] [varchar] (5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cr_ts] [datetime] NOT NULL ,
	[cr_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[lu_ts] [datetime] NULL ,
	[lu_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_LayoutAreas] (
	[areaid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_layoutid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[displayname] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[orderby] [int] NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_Layouts] (
	[layoutid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[displayname] [varchar] (126) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[type] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderby] [int] NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_ScrollEntries] (
	[entryid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_scrollerid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[linktext] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[linkurl] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[linktarget] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[txtfont] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[txtsize] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[txtcolor] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[txtbold] [bit] NULL ,
	[txtitalic] [bit] NULL ,
	[txtunderline] [bit] NULL ,
	[cr_ts] [datetime] NULL ,
	[cr_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lu_ts] [datetime] NULL ,
	[lu_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_Scrollers] (
	[scrollerid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[height] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[width] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[scrolltime] [int] NULL ,
	[stoptime] [int] NULL ,
	[bgcolor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[notes] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cr_ts] [datetime] NOT NULL ,
	[cr_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[lu_ts] [datetime] NULL ,
	[lu_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_Settings] (
	[varID] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_groupid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[varOrderby] [int] NULL ,
	[varScope] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[varName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[varValue] [varchar] (5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[varTitle] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[varDescription] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[varFieldType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_SettingsGrps] (
	[groupid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[groupOrderby] [int] NULL ,
	[groupName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[groupDescription] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_apps] (
	[id] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[identifier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[path] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[description] [varchar] (2005) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[enabled] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cr_ts] [datetime] NOT NULL ,
	[cr_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[lsup_ts] [datetime] NULL ,
	[lsup_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_pgPages] (
	[pg_id] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[parent_id] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pg_type] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pg_title] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[pg_link_name] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pg_link_url] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pg_LinkUrlTarget] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pg_Content] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pg_link] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pg_Order] [int] NULL ,
	[pg_Author] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pg_PublishDate] [datetime] NOT NULL ,
	[pg_RemoveDate] [datetime] NULL ,
	[pg_Notes] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pg_DisplayMenu] [bit] NULL ,
	[pg_isHome] [bit] NULL ,
	[fk_layoutid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pg_DisplayNav] [bit] NULL ,
	[pg_Schedule] [bit] NOT NULL ,
	[pg_Enabled] [bit] NULL ,
	[cr_ts] [datetime] NOT NULL ,
	[cr_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[lu_ts] [datetime] NULL ,
	[lu_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_userapps] (
	[fk_app_id] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_user_id] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[permissions] [decimal](18, 0) NULL ,
	[notes] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cr_ts] [datetime] NOT NULL ,
	[cr_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[lsup_ts] [datetime] NULL ,
	[lsup_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_usergroups] (
	[fk_groupid] [varchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fk_userid] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY];

CREATE TABLE [dbo].[#form.tableprefix#_users] (
	[username] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[password] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[lastname] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[firstname] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[phone_work] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email_work] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[notes] [varchar] (2005) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[enabled] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cr_ts] [datetime] NULL ,
	[cr_id] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lsup_ts] [datetime] NULL ,
	[lsup_id] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY];
</cfquery>