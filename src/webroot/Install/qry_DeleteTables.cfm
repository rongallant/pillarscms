<cfquery name="DeleteTables" datasource="#form.dsn#">
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_Articles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_Articles];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_BlockTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_BlockTypes];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_Blocks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_Blocks];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_BlogCategories]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_BlogCategories];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_BlogCategoriesEntries]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_BlogCategoriesEntries];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_BlogEntries]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_BlogEntries];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_GroupsPages]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_GroupsPages];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_Issues]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_Issues];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_LayoutAreas]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_LayoutAreas];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_Layouts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_Layouts];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_ScrollEntries]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_ScrollEntries];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_Scrollers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_Scrollers];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_Settings]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_Settings];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_SettingsGrps]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_SettingsGrps];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_apps]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_apps];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_pgPages]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_pgPages];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_userapps]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_userapps];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_usergroups]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_usergroups];

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[#form.tableprefix#_users]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[#form.tableprefix#_users];
</cfquery>