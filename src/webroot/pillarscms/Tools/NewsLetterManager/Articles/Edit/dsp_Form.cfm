<cfsavecontent variable="toHead">
	<script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>
</cfsavecontent>
<cfhtmlhead text="#toHead#" />

<cfoutput>
<form name="myForm" action="#self#" method="post">
	<input type="Hidden" name="fuseaction" id="fuseaction" />
	<table cellpadding="2" cellspacing="2" border="0">
		<tr>
			<td width="150" align="right" class="myFieldTitle">Issue</td>
			<td width="100%">
				<cfquery name="qListIssues" datasource="#my.db.dsn#">
					SELECT
						issue_id AS id,
						issue_StartDate AS date
					FROM #my.db.tableprefix#_Issues
					ORDER BY issue_StartDate DESC
				</cfquery>
				<select name="issue" id="issue">
				<cfloop query="qListIssues">
					<cfif isDefined('session.issueid') and len(session.issueid) and session.issueid eq qListIssues.id>
						<option value="#qListIssues.id#" selected="selected">#DateFormat(qListIssues.date,'mm/dd/yyyy')#</option>
					<cfelse>
						<option value="#qListIssues.id#">#DateFormat(qListIssues.date,'mm/dd/yyyy')#</option>
					</cfif>
				</cfloop>
				</select>
			</td>
		</tr>
		<tr>
			<td align="right" class="myFieldTitle">Title</td>
			<td><input type="text" name="title" id="title" value="#HTMLEditFormat(qArticle.title)#" size="50" maxlength="255" class="myText" /></td>
		</tr>
		<tr valign="top">
			<td align="right" class="myFieldTitle">Content</td>
			<td>
				<textarea name="content" id="content" class="ckeditor textarea">#qArticle.content#</textarea>
			</td>
		</tr>
		<tr>
			<td align="right" class="myFieldTitle">Enabled</td>
			<td>
				<input type="Radio" name="enable" id="enable_on" value="1" <cfif qArticle.enable neq 0>checked="checked"</cfif> class="myRadio" />yes
				&nbsp;&nbsp;&nbsp;
				<input type="Radio" name="enable" id="enable_off" value="0" <cfif qArticle.enable eq 0>checked="checked"</cfif> class="myRadio" />no
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<cfif fusebox.fuseaction eq "new">
					<input type="Button" name="AddButton" id="AddButton" value="Add Article" class="myButton" />
				<cfelse>
					<input type="Button" name="DeleteButton" id="DeleteButton" value="Delete Article" class="myButton" />
					<input type="Button" name="UpdateButton" id="UpdateButton" value="Update Article" class="myButton" />
					<input type="Hidden" name="articleid" id="articleid" value="#qArticle.id#" />
				</cfif>
			</td>
		</tr>
	</table>
</form>
<cfif fusebox.fuseaction eq "edit">
	<cfset pageUrl = myself & xfa.frontpage & "&articleid=" & qArticle.id />
	<div class="field">
		<label for="pgContent">Page URL</label>
		<span style="font-size:80%;">Copy this text to create a link to this page.</span>
		<div style="margin-bottom: 5px;">#pageUrl#</div>
		<cfif len(qArticle.cr_id)><div><b>Created:</b> #qArticle.cr_id# - #qArticle.cr_ts#</div></cfif>
		<cfif len(qArticle.lu_id)><div><b>Updated:</b> #qArticle.lu_id# - #qArticle.lu_ts#</div></cfif>
	</div>
</cfif>
</cfoutput>