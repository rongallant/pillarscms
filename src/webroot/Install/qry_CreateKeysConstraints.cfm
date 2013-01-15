<cfquery name="CreateKeysConstraints" datasource="#form.dsn#">
ALTER TABLE [dbo].[#form.tableprefix#_Articles] ADD 
	CONSTRAINT [DF_#form.tableprefix#_Articles_article_id] DEFAULT (newid()) FOR [article_id],
	CONSTRAINT [PK_#form.tableprefix#_Articles] PRIMARY KEY  CLUSTERED 
	(
		[article_id]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_BlockTypes] ADD 
	CONSTRAINT [DF_#form.tableprefix#_BlockTypes_blocktypeid] DEFAULT (newid()) FOR [blocktypeid],
	CONSTRAINT [PK_#form.tableprefix#_BlockTypes] PRIMARY KEY  CLUSTERED 
	(
		[blocktypeid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_Blocks] ADD 
	CONSTRAINT [DF_#form.tableprefix#_Blocks_blockid] DEFAULT (newid()) FOR [blockid],
	CONSTRAINT [DF_#form.tableprefix#_Blocks_displaymode] DEFAULT (0) FOR [displaymode],
	CONSTRAINT [PK_#form.tableprefix#_Blocks] PRIMARY KEY  CLUSTERED 
	(
		[blockid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_BlogCategories] ADD 
	CONSTRAINT [DF_#form.tableprefix#_BlogCategories_catid] DEFAULT (newid()) FOR [catid],
	CONSTRAINT [PK_#form.tableprefix#_BlogCategories] PRIMARY KEY  CLUSTERED 
	(
		[catid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_BlogCategoriesEntries] ADD 
	CONSTRAINT [PK_#form.tableprefix#_BlogCategoriesEntries] PRIMARY KEY  CLUSTERED 
	(
		[fk_catid],
		[fk_entryid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_BlogEntries] ADD 
	CONSTRAINT [DF_#form.tableprefix#_BlogEntries_entryid] DEFAULT (newid()) FOR [entryid],
	CONSTRAINT [PK_#form.tableprefix#_BlogEntries] PRIMARY KEY  CLUSTERED 
	(
		[entryid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_GroupsPages] ADD 
	CONSTRAINT [PK_#form.tableprefix#_GroupsPages] PRIMARY KEY  CLUSTERED 
	(
		[fk_groupid],
		[fk_pageid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_Issues] ADD 
	CONSTRAINT [DF_#form.tableprefix#_Issues_issue_id] DEFAULT (newid()) FOR [issue_id],
	CONSTRAINT [PK_#form.tableprefix#_Issues] PRIMARY KEY  CLUSTERED 
	(
		[issue_id]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_LayoutAreas] ADD 
	CONSTRAINT [DF_#form.tableprefix#_LayoutAreas_areaid] DEFAULT (newid()) FOR [areaid],
	CONSTRAINT [PK_#form.tableprefix#_LayoutAreas] PRIMARY KEY  CLUSTERED 
	(
		[areaid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_Layouts] ADD 
	CONSTRAINT [DF_#form.tableprefix#_Layouts_layoutid] DEFAULT (newid()) FOR [layoutid],
	CONSTRAINT [PK_#form.tableprefix#_Layouts] PRIMARY KEY  CLUSTERED 
	(
		[layoutid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_ScrollEntries] ADD 
	CONSTRAINT [DF_#form.tableprefix#_ScrollEntries_linktarget] DEFAULT ('_top') FOR [linktarget],
	CONSTRAINT [DF_#form.tableprefix#_ScrollEntries_txtfont] DEFAULT ('arial') FOR [txtfont],
	CONSTRAINT [DF_#form.tableprefix#_ScrollEntries_txtsize] DEFAULT (10) FOR [txtsize],
	CONSTRAINT [DF_#form.tableprefix#_ScrollEntries_txtcolor] DEFAULT ('(000000'')') FOR [txtcolor],
	CONSTRAINT [DF_#form.tableprefix#_ScrollEntries_txtbold] DEFAULT (0) FOR [txtbold],
	CONSTRAINT [DF_#form.tableprefix#_ScrollEntries_txtitalic] DEFAULT (0) FOR [txtitalic],
	CONSTRAINT [DF_#form.tableprefix#_ScrollEntries_txtunderline] DEFAULT (0) FOR [txtunderline],
	CONSTRAINT [PK_#form.tableprefix#_ScrollEntries] PRIMARY KEY  CLUSTERED 
	(
		[entryid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_Scrollers] ADD 
	CONSTRAINT [DF_#form.tableprefix#_Scrollers_id] DEFAULT (newid()) FOR [scrollerid],
	CONSTRAINT [DF_#form.tableprefix#_Scrollers_height] DEFAULT (200) FOR [height],
	CONSTRAINT [DF_#form.tableprefix#_Scrollers_width] DEFAULT (150) FOR [width],
	CONSTRAINT [DF_#form.tableprefix#_Scrollers_scrolltime] DEFAULT (5) FOR [scrolltime],
	CONSTRAINT [DF_#form.tableprefix#_Scrollers_stoptime] DEFAULT (3) FOR [stoptime],
	CONSTRAINT [DF_#form.tableprefix#_Scrollers_bgcolor] DEFAULT ('FFFFFF') FOR [bgcolor],
	CONSTRAINT [PK_#form.tableprefix#_Scrollers] PRIMARY KEY  CLUSTERED 
	(
		[scrollerid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_Settings] ADD 
	CONSTRAINT [DF_#form.tableprefix#_Settings_varID] DEFAULT (newid()) FOR [varID],
	CONSTRAINT [PK_#form.tableprefix#_Settings] PRIMARY KEY  CLUSTERED 
	(
		[varID]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_SettingsGrps] ADD 
	CONSTRAINT [DF_#form.tableprefix#_SettingsGrps_groupid] DEFAULT (newid()) FOR [groupid],
	CONSTRAINT [PK_#form.tableprefix#_SettingsGrps] PRIMARY KEY  CLUSTERED 
	(
		[groupid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_apps] ADD 
	CONSTRAINT [DF_#form.tableprefix#_apps_id] DEFAULT (newid()) FOR [id],
	CONSTRAINT [DF_#form.tableprefix#_apps_type] DEFAULT ('application') FOR [type],
	CONSTRAINT [PK_#form.tableprefix#_apps] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_pgPages] ADD 
	CONSTRAINT [DF_#form.tableprefix#_pgPages_pg_id] DEFAULT (newid()) FOR [pg_id],
	CONSTRAINT [DF_#form.tableprefix#_pgPages_pg_DisplayMenu] DEFAULT (0) FOR [pg_DisplayMenu],
	CONSTRAINT [DF_#form.tableprefix#_pgPages_pg_isHome] DEFAULT (0) FOR [pg_isHome],
	CONSTRAINT [DF_#form.tableprefix#_pgPages_pg_ShowNav] DEFAULT (1) FOR [pg_DisplayNav],
	CONSTRAINT [DF_#form.tableprefix#_pgPages_pg_Schedule] DEFAULT (0) FOR [pg_Schedule],
	CONSTRAINT [DF_#form.tableprefix#_pgPages_pg_Enabled] DEFAULT (0) FOR [pg_Enabled],
	CONSTRAINT [PK_#form.tableprefix#_pgPages] PRIMARY KEY  CLUSTERED 
	(
		[pg_id]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_userapps] ADD 
	CONSTRAINT [PK_#form.tableprefix#_userapps] PRIMARY KEY  CLUSTERED 
	(
		[fk_app_id],
		[fk_user_id]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_usergroups] ADD 
	CONSTRAINT [PK_#form.tableprefix#_usergroups] PRIMARY KEY  CLUSTERED 
	(
		[fk_groupid],
		[fk_userid]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_users] ADD 
	CONSTRAINT [PK_#form.tableprefix#_users] PRIMARY KEY  CLUSTERED 
	(
		[username]
	)  ON [PRIMARY];

ALTER TABLE [dbo].[#form.tableprefix#_Articles] ADD 
	CONSTRAINT [FK_#form.tableprefix#_Articles_#form.tableprefix#_Issues] FOREIGN KEY 
	(
		[fk_issue_id]
	) REFERENCES [dbo].[#form.tableprefix#_Issues] (
		[issue_id]
	);

ALTER TABLE [dbo].[#form.tableprefix#_Blocks] ADD 
	CONSTRAINT [FK_#form.tableprefix#_Blocks_#form.tableprefix#_BlockTypes] FOREIGN KEY 
	(
		[fk_blocktypeid]
	) REFERENCES [dbo].[#form.tableprefix#_BlockTypes] (
		[blocktypeid]
	),
	CONSTRAINT [FK_#form.tableprefix#_Blocks_#form.tableprefix#_pgPages] FOREIGN KEY 
	(
		[fk_pageid]
	) REFERENCES [dbo].[#form.tableprefix#_pgPages] (
		[pg_id]
	);

ALTER TABLE [dbo].[#form.tableprefix#_BlogCategoriesEntries] ADD 
	CONSTRAINT [FK_#form.tableprefix#_BlogCategoriesEntries_#form.tableprefix#_BlogCategories] FOREIGN KEY 
	(
		[fk_catid]
	) REFERENCES [dbo].[#form.tableprefix#_BlogCategories] (
		[catid]
	) ON DELETE CASCADE ,
	CONSTRAINT [FK_#form.tableprefix#_BlogCategoriesEntries_#form.tableprefix#_BlogEntries] FOREIGN KEY 
	(
		[fk_entryid]
	) REFERENCES [dbo].[#form.tableprefix#_BlogEntries] (
		[entryid]
	) ON DELETE CASCADE;

ALTER TABLE [dbo].[#form.tableprefix#_GroupsPages] ADD 
	CONSTRAINT [FK_#form.tableprefix#_GroupsPages_#form.tableprefix#_apps] FOREIGN KEY 
	(
		[fk_groupid]
	) REFERENCES [dbo].[#form.tableprefix#_apps] (
		[id]
	),
	CONSTRAINT [FK_#form.tableprefix#_GroupsPages_#form.tableprefix#_pgPages] FOREIGN KEY 
	(
		[fk_pageid]
	) REFERENCES [dbo].[#form.tableprefix#_pgPages] (
		[pg_id]
	);

ALTER TABLE [dbo].[#form.tableprefix#_LayoutAreas] ADD 
	CONSTRAINT [FK_#form.tableprefix#_LayoutAreas_#form.tableprefix#_Layouts] FOREIGN KEY 
	(
		[fk_layoutid]
	) REFERENCES [dbo].[#form.tableprefix#_Layouts] (
		[layoutid]
	);

ALTER TABLE [dbo].[#form.tableprefix#_ScrollEntries] ADD 
	CONSTRAINT [FK_#form.tableprefix#_ScrollEntries_#form.tableprefix#_Scrollers] FOREIGN KEY 
	(
		[fk_scrollerid]
	) REFERENCES [dbo].[#form.tableprefix#_Scrollers] (
		[scrollerid]
	);

ALTER TABLE [dbo].[#form.tableprefix#_Settings] ADD 
	CONSTRAINT [FK_#form.tableprefix#_Settings_#form.tableprefix#_SettingsGrps] FOREIGN KEY 
	(
		[fk_groupid]
	) REFERENCES [dbo].[#form.tableprefix#_SettingsGrps] (
		[groupid]
	);

ALTER TABLE [dbo].[#form.tableprefix#_pgPages] ADD 
	CONSTRAINT [FK_#form.tableprefix#_pgPages_#form.tableprefix#_Layouts] FOREIGN KEY 
	(
		[fk_layoutid]
	) REFERENCES [dbo].[#form.tableprefix#_Layouts] (
		[layoutid]
	);

ALTER TABLE [dbo].[#form.tableprefix#_userapps] ADD 
	CONSTRAINT [FK_#form.tableprefix#_userapps_#form.tableprefix#_apps] FOREIGN KEY 
	(
		[fk_app_id]
	) REFERENCES [dbo].[#form.tableprefix#_apps] (
		[id]
	),
	CONSTRAINT [FK_#form.tableprefix#_userapps_#form.tableprefix#_users] FOREIGN KEY 
	(
		[fk_user_id]
	) REFERENCES [dbo].[#form.tableprefix#_users] (
		[username]
	);

ALTER TABLE [dbo].[#form.tableprefix#_usergroups] ADD 
	CONSTRAINT [FK_#form.tableprefix#_usergroups_#form.tableprefix#_users] FOREIGN KEY 
	(
		[fk_userid]
	) REFERENCES [dbo].[#form.tableprefix#_users] (
		[username]
	);
</cfquery>