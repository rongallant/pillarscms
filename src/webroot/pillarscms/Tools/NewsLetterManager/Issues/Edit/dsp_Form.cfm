<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse=""dsp_Form language="ColdFusion">
	<responsibilities>
		I am a form for editing the issue entry.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="3004-04-29" />
	</properties>
</fusedoc>
--->

<cfimport prefix="cal" taglib="../../../../../assets/jscalendar/" />
<cfoutput>
<table cellpadding="2" cellspacing="2" border="0">
<form name="myForm" action="#self#" method="post">
	<input type="Hidden" name="fuseaction"/>
	<tr>
		<td class="myFieldTitle" width="150"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="150" height="1"/></td>
		<td class="myFieldTitle" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="150" height="1"/></td>
	</tr>
	<tr>
		<td class="myFieldTitle">Start Date</td>
		<td>
			<cfif fusebox.fuseaction eq "new" and isDefined('session.StartDateTime')>
				<cfset StartDateTime = session.StartDateTime />
			<cfelse>
				<cfset StartDateTime = qIssue.StartDateTime />
			</cfif>
			<input type="Text" name="StartDateTime" id="StartDateTime" size="16" maxlength="16" value="#DateFormat(StartDateTime,'mm/dd/yyyy')# #TimeFormat(StartDateTime,'HH:mm')#" class="myText"/>
			<cal:calendar inputField="StartDateTime" ifFormat="%m/%d/%Y %H:%M" showsTime="true"/>
			<span class="note">( mm/dd/yyyy 24:00 )</span>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle">Editor</td>
		<td>
			<cfif fusebox.fuseaction eq "new" and isDefined('session.editor')>
				<cfset editor = session.editor>
			<cfelse>
				<cfset editor = qIssue.editor>
			</cfif>
			<input type="Text" name="editor" size="30" maxlength="100" value="#editor#" class="myText"/>
			<span class="note">Seperate names with pipes ( | )</span>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle">Credits List</td>
		<td>
			<cfif fusebox.fuseaction eq "new" and isDefined('session.credits')>
				<cfset credits = session.credits />
			<cfelse>
				<cfset credits = qIssue.credits />
			</cfif>
			<input type="Text" name="credits" size="50" maxlength="1000" value="#credits#" class="myText"/>
			<span class="note">Seperate names with pipes ( | )</span>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle">Notes</td>
		<td><textarea name="notes" style="width:100%;height:100px;" class="myTextarea">#qIssue.notes#</textarea></td>
	</tr>
	<tr>
		<td class="myFieldTitle">Enabled</td>
		<td>
			yes<input type="Radio" name="enabled" <cfif qIssue.enabled eq 1>checked="checked"</cfif> value="1" class="myRadio"/>
			&nbsp;&nbsp;&nbsp;
			no<input type="Radio" name="enabled" <cfif qIssue.enabled neq 1>checked="checked"</cfif> value="0" class="myRadio"/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td align="right">
			<cfif fusebox.fuseaction eq "new">
				<input type="Button" name="AddButton" value="Add Issue" class="myButton"/>
			<cfelse>
				<input type="Button" name="DeleteButton" value="Delete Issue" class="myButton"/>
				<input type="Button" name="UpdateButton" value="Update Issue" class="myButton"/>
				<input type="Hidden" name="issueid" value="#qIssue.id#"/>
			</cfif>
		</td>
	</tr>
	<cfif fusebox.fuseaction eq "edit">
	<tr>
		<td colspan="2" class="myFieldTitle" width="150"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="150" height="1"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<cfif len(qIssue.cr_id)><b>Created:</b> #qIssue.cr_id# - #qIssue.cr_ts#<br /></cfif>
			<cfif len(qIssue.lu_id)><b>Updated:</b> #qIssue.lu_id# - #qIssue.lu_ts#</cfif>
		</td>
	</tr>
	</cfif>
</form>
</table>
</cfoutput>