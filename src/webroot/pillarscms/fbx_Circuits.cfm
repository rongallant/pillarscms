<cfscript>
// circuits
	fusebox.circuits.root = "root"; // Root Directgory
	fusebox.circuits.tags = "root/tags"; // Tags Directgory
	fusebox.circuits.errors = "root/Errors"; // Error Handling
	fusebox.circuits.home = "root/Home"; // Home

// This Site

// Security
	fusebox.circuits.security = "root/Security"; // Login Form

// Forms
	fusebox.circuits.contact = "root/ContactUs"; // Contact Us
	fusebox.circuits.forms="root/Forms";
		fusebox.circuits.NewsLetterForm="root/Forms/NewsLetter";

// Site Content (pages)
	fusebox.circuits.pages = "root/Pages";
		fusebox.circuits.menus = "root/Pages/Menus";
	fusebox.circuits.ContentEditor = "root/Tools/ContentEditor";
		fusebox.circuits.pgList = "root/Tools/ContentEditor/List";
		fusebox.circuits.pgEdit = "root/Tools/ContentEditor/Edit";
		fusebox.circuits.pgMenus = "root/Tools/ContentEditor/Menus";

// News
	fusebox.circuits.blog = "root/Blog";
	fusebox.circuits.BlogAdmin = "root/Tools/BlogManager";
		fusebox.circuits.BlogCategories = "root/Tools/BlogManager/Categories";
			fusebox.circuits.BlogListCategories = "root/Tools/BlogManager/Categories/List";
			fusebox.circuits.BlogEditCategories = "root/Tools/BlogManager/Categories/Edit";
		fusebox.circuits.BlogEntries = "root/Tools/BlogManager/Entries";
			fusebox.circuits.BlogListEntries = "root/Tools/BlogManager/Entries/List";
			fusebox.circuits.BlogEditEntries = "root/Tools/BlogManager/Entries/Edit";

// NewsLetter
	fusebox.circuits.NewsLetter = "root/NewsLetter";
	fusebox.circuits.NewsLetterAdmin = "root/Tools/NewsLetterManager";
		fusebox.circuits.Issues = "root/Tools/NewsLetterManager/Issues";
			fusebox.circuits.listIssues = "root/Tools/NewsLetterManager/Issues/List";
			fusebox.circuits.editIssues = "root/Tools/NewsLetterManager/Issues/Edit";
		fusebox.circuits.Articles = "root/Tools/NewsLetterManager/Articles";
			fusebox.circuits.listArticles = "root/Tools/NewsLetterManager/Articles/List";
			fusebox.circuits.editArticles = "root/Tools/NewsLetterManager/Articles/Edit";

// Scroller
	fusebox.circuits.NewsScroller = "root/NewsScroller";
	fusebox.circuits.scroll = "root/Tools/ScrollerManager";
		fusebox.circuits.scrollers = "root/Tools/ScrollerManager/Scrollers";
		fusebox.circuits.entries = "root/Tools/ScrollerManager/Entries";

// Tools Home
	fusebox.circuits.toolsroot="root/Tools";
		fusebox.circuits.tools = "root/Tools/Home";

// Settings
	fusebox.circuits.settings="root/Tools/Settings";

// Apps Admin
	fusebox.circuits.apps="root/Tools/AppsManager";
		fusebox.circuits.EditApps="root/Tools/AppsManager/Edit";
		fusebox.circuits.ListApps="root/Tools/AppsManager/List";

// User Admin
	fusebox.circuits.users="root/Tools/UserManager";
		fusebox.circuits.EditUsers="root/Tools/UserManager/Edit";
		fusebox.circuits.ListUsers="root/Tools/UserManager/List";

// Content Permissions
	fusebox.circuits.groups="root/Tools/GroupsManager";
		fusebox.circuits.EditGroups="root/Tools/GroupsManager/Edit";
		fusebox.circuits.ListGroups="root/Tools/GroupsManager/List";

// File manager
	fusebox.circuits.pgFiles = "root/content";
	fusebox.circuits.pgFileManager = "root/Tools/FileManager";
		fusebox.circuits.fileTools = "root/Tools/FileManager/FileTools";
		fusebox.circuits.folderTools = "root/Tools/FileManager/FolderTools";

// Block Editor
	fusebox.circuits.blockmanager="root/Tools/BlockManager";
	fusebox.circuits.bmList="root/Tools/BlockManager/List";
	fusebox.circuits.bmEdit="root/Tools/BlockManager/Edit";

// Search Engine
	fusebox.circuits.search = "root/Search";
	fusebox.circuits.SearchManager = "root/Tools/SearchManager";
</cfscript>