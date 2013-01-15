<cfimport prefix="fb" taglib="../../../" />
<cfimport prefix="sec" taglib="../../../" />
<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="NewUser">
		<sec:security rights="600" errorpage="#my.site.noauth#">
			<cfset xfa.Submit = "#fusebox.thisCircuit#.CheckForUser" />
			<cfinclude template="dsp_NewUser.cfm" />
			<cfinclude template="val_NewUser.cfm" />
			<cfset my.page.heading = "New User Name" />
			<cfset my.page.subheading = "Enter the User Name of the user to be added." />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

	<cfcase value="new">
		<sec:security rights="600" errorpage="#my.site.noauth#">
			<cfset xfa.GetApp = "#fusebox.thisCircuit#.GetApp" />
			<cfset xfa.newuser = "#fusebox.thisCircuit#.newuser" />
			<cfinclude template="qry_Blank.cfm" />
			<cfinclude template="qry_RestOfApps.cfm" />
			<cfinclude template="dsp_Form.cfm" />
			<cfinclude template="act_MinimizeScript.cfm" />
			<cfset xfa.adduser = "#fusebox.thisCircuit#.add" />
			<cfset xfa.DeleteUser  = "#fusebox.thisCircuit#.delete" />
			<cfinclude template="val_Form.cfm" />
			<cfset my.page.heading = "New User" />
			<cfset my.page.subheading = "Enter the information for the new user." />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

	<cfcase value="edit">
		<sec:security rights="500" errorpage="#my.site.noauth#">
			<fb:fusebox fuseaction="#fusebox.thisCircuit#.EditUser" usrid="#trim(attributes.usrid)#" layout="table1" />
			<fb:fusebox fuseaction="#fusebox.thisCircuit#.AppList" usrid="#trim(attributes.usrid)#" layout="Table1" />
			<cfset my.page.heading = "Edit User" />
			<cfset my.page.subheading = "Modify information for this user." />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

	<cfcase value="EditUser">
		<cfif not isdefined('attributes.usrid')>
			<!--- I make sure that a userid is passed in else I send them to the newuser circuit --->
			<cflocation url="#myself##xfa.newuser#" />
		</cfif>
		<sec:security rights="500" errorpage="#my.site.noauth#">
			<cfset xfa.GetApp = "#fusebox.thisCircuit#.GetApp" />		
			<cfinclude template="qry_GetUser.cfm" />
			<cfinclude template="act_MinimizeScript.cfm" />
			<cfinclude template="dsp_Form.cfm" />
			<cfset xfa.UpdateUser = "#fusebox.thisCircuit#.update" />
			<cfset xfa.DeleteUser = "#fusebox.thisCircuit#.delete" />
			<cfinclude template="val_Form.cfm" />
			<cfset my.page.heading = "Edit &quot;#getMessages.firstname# #getMessages.lastname#&quot;" />
			<cfset my.page.subheading = "Edit the account of &quot;#getMessages.firstname# #getMessages.lastname#&quot;." />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

	<cfcase value="AppList">
		<sec:security rights="500" errorpage="#my.site.noauth#">
			<cfset xfa.UpdateApps = "#fusebox.thisCircuit#.UpdateApp" />
			<cfset xfa.ModifyApp = "#fusebox.thisCircuit#.ModifyApp" />
			<cfset xfa.EditApp = "#fusebox.thisCircuit#.EditApp" />
			<cfinclude template="qry_AppList.cfm" />
			<cfinclude template="dsp_AppList.cfm" />
			<cfinclude template="val_AppList.cfm" />
			<cfset my.page.heading = "Groups List" />
			<cfset my.page.subheading = "Edit User's Groups" />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

	<cfcase value="EditApp">
		<sec:security rights="500" errorpage="#my.site.noauth#">
			<cfset xfa.UpdateApps = "#fusebox.thisCircuit#.UpdateApp" />
			<cfinclude template="qry_GetUser.cfm" />
			<cfinclude template="qry_RestOfApps.cfm" />
			<cfinclude template="dsp_EditApp.cfm" />
			<cfinclude template="val_EditApps.cfm" />
			<cfset my.layout["root"] = "Plain" />
			<cfset my.page.heading = "Edit groups for &quot;#getMessages.firstname# #getMessages.lastname#&quot;" />
			<cfset my.page.subheading = "Add and remove groups for the selected user." />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

	<cfcase value="ModifyApp">
		<sec:security rights="500" errorpage="#my.site.noauth#">
			<cfset xfa.UpdateApp = "#fusebox.thisCircuit#.UpdateAppInfo" />
			<cfinclude template="qry_GetApp.cfm" />
			<cfinclude template="dsp_ModifyApp.cfm" />
			<cfinclude template="val_ModifyApp.cfm" />
			<cfset my.page.heading = "Modify Groups" />
			<cfset my.page.subheading = "." />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

	<cfcase value="CheckForUser">
		<sec:security rights="200" errorpage="#my.site.noauth#">
			<cfinclude template="qry_GetUser.cfm" />
			<cfset xfa.NewUser = "#fusebox.thisCircuit#.new" />
			<cfset xfa.EditUser = "#fusebox.thisCircuit#.edit" />
			<cfinclude template="act_CheckForUser.cfm" />
		</sec:security>
	</cfcase>

	<cfcase value="add">
		<sec:security rights="600" errorpage="#my.site.noauth#">
			<cfinclude template="qry_Add.cfm" />
			<cfinclude template="act_UpdatePassword.cfm" />
			<cflocation url="#myself##fusebox.thisCircuit#.Edit&usrid=#attributes.usrid#" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfcase value="update">
		<sec:security rights="500" errorpage="#my.site.noauth#">
			<cfinclude template="qry_Update.cfm" />
			<cfinclude template="act_UpdatePassword.cfm" />
			<cflocation url="#myself##fusebox.thisCircuit#.Edit&usrid=#attributes.usrid#" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfcase value="UpdateApp">
		<sec:security rights="500" errorpage="#my.site.noauth#">
			<cfinclude template="qry_AppList.cfm" />
			<cfinclude template="qry_DeleteUserApps.cfm" />
			<cfinclude template="qry_AddUserApps.cfm" />
			<cfinclude template="act_ClosePopup.cfm" />
			<cfset my.page.heading = "Thank You" />
			<cfset my.page.title = my.page.heading />
		</sec:security>
	</cfcase>

	<cfcase value="UpdateAppInfo">
		<sec:security rights="500" errorpage="#my.site.noauth#">
			<cfinclude template="qry_UpdateAppInfo.cfm" />
			<cflocation url="#myself##fusebox.thisCircuit#.Edit&usrid=#attributes.usrid#" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfcase value="delete">
		<sec:security rights="700" errorpage="#my.site.noauth#">
			<cfinclude template="qry_AppList.cfm" />
			<cfinclude template="qry_DeleteAllUserApps.cfm" />
			<cfinclude template="qry_DeleteUser.cfm" />
			<cflocation url="#myself#listusers.home" addtoken="no" />
		</sec:security>
	</cfcase>

	<cfdefaultcase>
		<cfthrow type="fusebox" errorcode="8" />
	</cfdefaultcase>

</cfswitch>