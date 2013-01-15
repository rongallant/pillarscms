<cfquery name="DeleteConstraints" datasource="#form.dsn#">
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_Blocks_#form.tableprefix#_BlockTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_Blocks] DROP CONSTRAINT FK_#form.tableprefix#_Blocks_#form.tableprefix#_BlockTypes;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_BlogCategoriesEntries_#form.tableprefix#_BlogCategories]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_BlogCategoriesEntries] DROP CONSTRAINT FK_#form.tableprefix#_BlogCategoriesEntries_#form.tableprefix#_BlogCategories;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_BlogCategoriesEntries_#form.tableprefix#_BlogEntries]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_BlogCategoriesEntries] DROP CONSTRAINT FK_#form.tableprefix#_BlogCategoriesEntries_#form.tableprefix#_BlogEntries;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_Articles_#form.tableprefix#_Issues]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_Articles] DROP CONSTRAINT FK_#form.tableprefix#_Articles_#form.tableprefix#_Issues;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_LayoutAreas_#form.tableprefix#_Layouts]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_LayoutAreas] DROP CONSTRAINT FK_#form.tableprefix#_LayoutAreas_#form.tableprefix#_Layouts;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_pgPages_#form.tableprefix#_Layouts]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_pgPages] DROP CONSTRAINT FK_#form.tableprefix#_pgPages_#form.tableprefix#_Layouts;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_ScrollEntries_#form.tableprefix#_Scrollers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_ScrollEntries] DROP CONSTRAINT FK_#form.tableprefix#_ScrollEntries_#form.tableprefix#_Scrollers;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_Settings_#form.tableprefix#_SettingsGrps]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_Settings] DROP CONSTRAINT FK_#form.tableprefix#_Settings_#form.tableprefix#_SettingsGrps;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_GroupsPages_#form.tableprefix#_apps]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_GroupsPages] DROP CONSTRAINT FK_#form.tableprefix#_GroupsPages_#form.tableprefix#_apps;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_userapps_#form.tableprefix#_apps]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_userapps] DROP CONSTRAINT FK_#form.tableprefix#_userapps_#form.tableprefix#_apps;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_Blocks_#form.tableprefix#_pgPages]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_Blocks] DROP CONSTRAINT FK_#form.tableprefix#_Blocks_#form.tableprefix#_pgPages;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_GroupsPages_#form.tableprefix#_pgPages]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_GroupsPages] DROP CONSTRAINT FK_#form.tableprefix#_GroupsPages_#form.tableprefix#_pgPages;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_userapps_#form.tableprefix#_users]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_userapps] DROP CONSTRAINT FK_#form.tableprefix#_userapps_#form.tableprefix#_users;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_#form.tableprefix#_usergroups_#form.tableprefix#_users]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[#form.tableprefix#_usergroups] DROP CONSTRAINT FK_#form.tableprefix#_usergroups_#form.tableprefix#_users;
</cfquery>