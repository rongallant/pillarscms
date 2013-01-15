<cfimport prefix="tag" taglib="../../../../Tags/" />
<cfsavecontent variable="toHead">
	<script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>
</cfsavecontent>
<cfhtmlhead text="#toHead#" />

<cfoutput>
<form name="myForm" action="#self#" method="post">
	<input type="Hidden" name="fuseaction" id="" />
	<table cellpadding="2" cellspacing="2" border="0">
		<tr>
			<td class="myFieldTitle" width="150"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="150" height="1" alt="" /></td>
			<td class="myFieldTitle" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="150" height="1" alt="" /></td>
		</tr>
		<tr>
			<td align="right" class="myFieldTitle">Title</td>
			<td><input type="text" name="title" id="" value="#HTMLEditFormat(qEntry.title)#" size="60" maxlength="255" class="myText" /></td>
		</tr>
		<tr valign="top">
			<td align="right" class="myFieldTitle">Description (Short)</td>
			<td>
				<textarea name="shorttext" id="shorttext" class="ckeditor textarea">#qEntry.shorttext#</textarea>
			</td>
		</tr>
		<tr valign="top">
			<td align="right" class="myFieldTitle">Description (Long)</td>
			<td>
				<textarea name="longtext" id="longtext" class="ckeditor textarea">#qEntry.longtext#</textarea>
			</td>
		</tr>
		<tr>
			<td align="right" class="myFieldTitle">Categories</td>
			<td>
				<cfquery name="qEntryCats" datasource="#my.db.dsn#">
					SELECT fk_catid
					FROM #my.db.tableprefix#_BlogCategories AS a
					JOIN #my.db.tableprefix#_BlogCategoriesEntries AS b
						ON a.catid = b.fk_catid
					WHERE b.fk_be_entryid = '#qEntry.entryid#'
				</cfquery>
				<cfset listEntryCats = "">
				<cfloop query="qEntryCats">
					<cfset listEntryCats = ListAppend(listEntryCats,qEntryCats.fk_catid)>
				</cfloop>
				<cfquery name="qCats" datasource="#my.db.dsn#">
					SELECT catid, title
					FROM #my.db.tableprefix#_BlogCategories
					ORDER BY title
				</cfquery>
				<select name="categories" id="categories" size="5" multiple="multiple">
					<cfloop query="qCats">	
						<option value="#qCats.catid#" <cfif ListContains(listEntryCats,qCats.catid)>selected="selected"</cfif>>#HTMLEditFormat(qCats.title)#</option>
					</cfloop>
				</select>
			</td>
		</tr>
		<tr>
			<td align="right" class="myFieldTitle">Enabled</td>
			<td>
				<input type="checkbox" name="enabled" id="enabled" value="1" <cfif qEntry.enabled eq 1>checked="checked"</cfif> />
			</td>
		</tr>
		<tr>
			<td class="myFieldTitle"></td>
			<td class="myFieldTitle" align="right">
				<cfif fusebox.fuseaction eq "new">
					<input type="Button" name="AddButton" id="AddButton" value="Add Article" class="myButton" />
				<cfelse>
					<input type="Button" name="DeleteButton" id="DeleteButton" value="Delete Entry" class="myButton" />
					<input type="Button" name="UpdateButton" id="UpdateButton" value="Update Entry" class="myButton" />
					<input type="hidden" name="entryid" id="entryid" value="#qEntry.entryid#" />
				</cfif>
			</td>
		</tr>
	</table>
</form>

<cfif fusebox.fuseaction eq "edit">
	<cfset pageUrl = myself & xfa.frontpage & "&entryid=" & qEntry.entryid />
	<div class="field">
		<label for="pgContent">Page URL</label>
		<span style="font-size:80%;">Copy this text to create a link to this page.</span>
		<div style="margin-bottom: 5px;">#pageUrl#</div>
		<cfif len(qEntry.cr_id)><div><b>Created:</b> #qEntry.cr_id# - #qEntry.cr_ts#</div></cfif>
		<cfif len(qEntry.lu_id)><div><b>Updated:</b> #qEntry.lu_id# - #qEntry.lu_ts#</div></cfif>
	</div>
</cfif>

</cfoutput>