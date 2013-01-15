<cfimport prefix="menu" taglib="../menus/" />
<cfimport prefix="tag" taglib="../../../tags/" />

<cfoutput>
<form name="myForm" action="#self#" method="post">
	<input type="Hidden" name="fuseaction" id="fuseaction" />
	<input type="Hidden" name="pageid" id="pageid" value="#qPage.pg_id#" />
	<input type="hidden" name="pagetype" id="pagetype" value="link" />

	<div class="field">
		<label for="pagetype">Parent *</label>
		<select name="parentid" id="parentid" class="mySelect">
			<option value="1">ROOT</option>
			<cfif ( fusebox.fuseaction eq "new" ) and ( isDefined('attributes.parentid') and len(attributes.parentid) )>
				<menu:select parent="#attributes.parentid#" currentpage="#qPage.pg_id#" dsn="#my.db.dsn#" tableprefix="#my.db.tablePrefix#">
			<cfelse>
				<menu:select parent="#qPage.parent_id#" currentpage="#qPage.pg_id#" dsn="#my.db.dsn#" tableprefix="#my.db.tablePrefix#">
			</cfif>
			<option value="2">Site Zone</option>
		</select>
	</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr valign="top">
		<td width="65%">		

<fieldset>
	<legend>Link</legend>

	<div class="field">
		<label for="pgTitle">Link Name *</label>
		<input type="Text" name="pgTitle" id="pgTitle" value="#qPage.pg_Title#" size="60" maxlength="200" class="myText" />
	</div>

	<div class="field">
		<label for="pgLinkUrl">Link URL *</label>
		<input type="Text" name="pgLinkUrl" id="pgLinkUrl" value="#qPage.pg_link_url#" size="50" maxlength="255" class="myText" />
	</div>

	<div class="field">
		<label for="pgLinkUrl">Link Target</label>
		<select name="pgLinkUrlTarget" id="pgLinkUrlTarget">
			<option value="_top"<cfif qPage.pg_LinkUrlTarget eq "_top"> selected</cfif>>This Window</option>
			<option value="_blank"<cfif qPage.pg_LinkUrlTarget eq "_blank"> selected</cfif>>New Window</option>
		</select>
	</div>

	<cfif fusebox.fuseaction eq "editLink" and not (
			qPage.pg_link_url contains "http://"
			or qPage.pg_link_url contains "https://"
			or qPage.pg_link_url contains "file://"
		) >
		<div class="field">
			<label for="pgContent">Internal Page URL</label><br/>
			<div style="font-size:80%;"></div>
			<cfset pageUrl = qPage.pg_link_url & "&pageid=" & qPage.pg_id />
			<textarea name="theurl" id="theurl" readonly="readonly" class="myTextarea" wrap="off">#pageUrl#</textarea>
		</div>
	</cfif>

	<cfif fusebox.fuseaction eq "editLink" and not (
		qPage.pg_link_url contains "http://"
		or qPage.pg_link_url contains "https://"
		or qPage.pg_link_url contains "file://"
	) >
		<cfset pageUrl = qPage.pg_link_url & "&pageid=" & qPage.pg_id />
		<div class="field">
			<label for="pgContent">Page URL</label>
			<span style="font-size:80%;">Copy this text to create a link to this page.</span>
			<div>#pageUrl#</div>
		</div>
	</cfif>
</fieldset>

		</td>
		<td width="35%">

<fieldset>
<cfif len(qPage.pg_id)>
	<fieldset>
		<legend>Page Information</legend>
		<div class="field">
			<label for="showpageid">Page ID:</label>
			<span id="showpageid">#qPage.pg_id#</span>
		</div>
		<div class="field">
			<label for="showpageid">Last Updated By:</label>
			<span id="showpageid">#qPage.lu_id#</span><br />
			<label for="showpageid">Last Updated On:</label>
			<span id="showpageid">#DateFormat(qPage.lu_ts,"mmmm d, yyyy")# - #TimeFormat(qPage.lu_ts,"h:mm:ss tt")#</span>
		</div>
		<div class="field">
			<label for="showpageid">Created By:</label>
			<span id="showpageid">#qPage.cr_id#</span><br />
			<label for="showpageid">Created On:</label>
			<span id="showpageid">#DateFormat(qPage.cr_ts,"mmmm d, yyyy")# - #TimeFormat(qPage.cr_ts,"h:mm:ss tt")#</span>
		</div>
	</fieldset>
</cfif>

	<div class="field">
		<label for="pgNotes">Notes</label>
		<div style="font-size:80%;">This will not show up on the homepage</div>
		<tag:textarea fieldname="pgNotes" fieldvalue="#qPage.pg_Notes#" />
	</div>
	<div class="field">

		<div style="float:right;">
			<cfif fusebox.fuseaction eq "newLink">
				<input type="Button" name="AddButton" id="AddButton" value="Add Page" class="myButton" />
			<cfelse>
				<input type="Button" name="DeleteButton" id="DeleteButton" value="Delete Page" class="myButton" />
				<input type="Button" name="UpdateButton" id="UpdateButton" value="Update Page" class="myButton" />
			</cfif>
		</div>

		<label for="pgEnabled">Enabled</label> 
		<input type="checkbox" name="pgEnabled" id="pgEnabled" value="1" <cfif qPage.pg_Enabled eq 1>checked="checked"</cfif> />

	</div>

</fieldset>

<div align="right">Required ( * )</div>

		</td>
	</tr>
</table>

</form>
</cfoutput>