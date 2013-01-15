<cfimport prefix="menu" taglib="../menus/" />
<cfimport prefix="tag" taglib="../../../tags/" />

<cfsavecontent variable="toHead">
	<link rel="stylesheet" type="text/css" media="all" href="assets/jscalendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
	<script type="text/javascript" src="assets/jscalendar/calendar.js"></script>
	<script type="text/javascript" src="assets/jscalendar/lang/calendar-en.js"></script>
	<script type="text/javascript" src="assets/jscalendar/calendar-setup.js"></script>
	<script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>
</cfsavecontent>
<cfhtmlhead text="#toHead#" />

<cfoutput>
<form name="pageEditForm" action="#self#" method="post">
	<input type="Hidden" name="fuseaction" id="fuseaction" />
	<input type="Hidden" name="pageid" id="pageid" value="#qPage.pg_id#" />
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr valign="top">
		<td width="100%">		
			<div id="theContent">
				<fieldset>
					<legend>Page</legend>
					<div class="field">
						<label for="pagetype">Parent</label>
						<select name="parentid" id="parentid" class="mySelect">
							<option value="1">ROOT</option>
							<menu:select parent="#qPage.parent_id#" currentpage="#qPage.pg_id#" dsn="#my.db.dsn#" tableprefix="#my.db.tablePrefix#">
						</select>
					</div>
					<div class="field">
						<label for="pgTitle">Page Title *</label>
						<input type="Text" name="pgTitle" id="pgTitle" value="#HTMLEditFormat(qPage.pg_Title)#" size="60" maxlength="500" class="myText" />
					</div>
					<div class="field">
						<label for="pgLinkName">Menu Title *</label>
						<input type="Text" name="pgLinkName" id="pgLinkName" value="#HTMLEditFormat(qPage.pg_link_name)#" size="30" maxlength="500" class="myText" />
						<span style="font-size:80%;">This will show in the site menu.</span>
					</div>
					<div class="field">
						<label for="pgContent">Content</label><br/>
						<textarea name="pgContent" id="pgContent" class="ckeditor textarea">#qPage.Content#</textarea>
					</div>
					<div class="field">
						<div style="float:right;">
							<cfif fusebox.fuseaction eq "newPage">
								<input type="Button" name="AddButton" id="AddButton" value="Add Page" class="myButton" />
							<cfelse>
								<input type="button" name="PreviewButton" id="PreviewButton" value="Preview Page" class="myButton" style="margin-right:20px;" />
								<input type="Button" name="DeleteButton" id="DeleteButton" value="Delete Page" class="myButton" />
								<input type="Button" name="UpdateButton" id="UpdateButton" value="Update Page" class="myButton" />
							</cfif>
						</div>
						<label for="pgEnabled">Enabled</label> 
						<input type="checkbox" name="pgEnabled" id="pgEnabled" value="1" <cfif qPage.pg_Enabled eq 1>checked="checked"</cfif>/>
					</div>
					<cfif fusebox.fuseaction eq "editPage">
						<cfset pageUrl = myself & xfa.pages & "&pageid=" & qPage.pg_id />
						<div class="field">
							<label for="pgContent">Page URL</label>
							<span style="font-size:80%;">Copy this text to create a link to this page.</span>
							<div>#pageUrl#</div>
						</div>
					</cfif>
				</fieldset>
			</div>
		</td>
		<td width="7" valign="middle" background="designs/tools/main/images/column_spacer.gif">
			<script type="text/javascript">
				function expander(whichEl) {
					var theCol = document.getElementById(whichEl);
					theCol.style.display = ( theCol.style.display == "block" ) ? "none" : "block";
					if ( theCol.style.display == "block" ) {
						document.toggleArrow.src = "designs/tools/main/images/column_right.gif";
					} else {
						document.toggleArrow.src = "designs/tools/main/images/column_left.gif";
					}
					return false;
				}
			</script>
			<cfif fusebox.fuseaction eq "editPage">
				<style type="text/css" media="all">
					.SettingsClass { display: none; }
				</style>
				<a href="javascript:void(0);" onclick="expander('SettingsID');">
				<img src="designs/tools/main/images/column_left.gif" name="toggleArrow" width="7" height="56" border="0" alt="toggle setting panel" /></a>
			<cfelse>
				<a href="javascript:expander('SettingsID');">
				<img src="designs/tools/main/images/column_right.gif" name="toggleArrow" width="7" height="56" border="0" alt="toggle setting panel" /></a>
			</cfif>
		</td>
		<td width="35%" id="SettingsID" class="SettingsClass">
			<fieldset>
				<legend>Setting</legend>
				<div class="field">
					<label for="pagetype">Page Type</label>
					<select name="pagetype" id="pagetype" class="mySelect">
						<option value="page"<cfif qPage.pagetype eq "page"> selected="selected"</cfif>>Page (page with link that shows in menus)</option>
						<option value="nomenu"<cfif qPage.pagetype eq "nomenu"> selected="selected"</cfif>>Page With No Menu (page with no menu link)</option>
						<option value="block"<cfif qPage.pagetype eq "block"> selected="selected"</cfif>>Block (peice of content to be used as a block)</option>
					</select>
				</div>
			</fieldset>
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
			<fieldset>
				<legend>Setup</legend>
				<div class="field">
					<label for="pgTheme">Theme</label>
					<select name="pgTheme" id="pgTheme">
						<cfloop query="qThemes">
							<option value="#qThemes.layoutid#" <cfif qThemes.layoutid eq qPage.layoutid>selected="selected"</cfif>>#qThemes.displayname#</option>
						</cfloop>
					</select>
				</div>
				<div class="field">
					<label for="pgDisplayMenu">Show Page Tools</label>
					<input type="checkbox" name="pgDisplayNav" id="pgDisplayNav" value="1" <cfif qPage.pg_DisplayNav eq 1>checked="checked"</cfif> />
					( Set this if you want the print page and download page icons on this page )
				</div>
				<div class="field">
					<label for="pgSchedule">Schedule</label>
					<input type="Checkbox" name="pgSchedule" id="pgSchedule" value="1" <cfif qPage.pg_Schedule eq 1>checked="checked"</cfif> />
					(Schedule the page to display only between two dates.)
				</div class="field">
				<div id="scheduleSection">
					<fieldset>
						<legend>Scheduler</legend>
						<div class="field">
							<label for="pgPublishDate">Publish Date *</label>
							<cfif fusebox.fuseaction eq "new">
								<input type="Text" name="pgPublishDate" id="pgPublishDate" value="#DateFormat(now(),'mm/dd/yyyy')#" size="12" maxlength="10" class="myText" />
							<cfelse>
								<input type="Text" name="pgPublishDate" id="pgPublishDate" value="#DateFormat(qPage.pg_PublishDate,'mm/dd/yyyy')#" size="12" maxlength="10" class="myText" />
							</cfif>
							<img src="assets/jscalendar/img.gif" id="f_trigger_a" style="cursor:pointer;" title="Date selector"
								  onmouseover="this.style.background='red';" onmouseout="this.style.background=''" />
							<script type="text/javascript">
								Calendar.setup({
									inputField     :    "pgPublishDate", // id of the input field
									ifFormat       :    "%m/%d/%Y",      // format of the input field
									showsTime      :    false,           // will display a time selector
									button         :    "f_trigger_a",   // trigger for the calendar (button ID)
									singleClick    :    false,           // double-click mode
									step           :    1                // show all years in drop-down boxes (instead of every other year as default)
								});
							</script>			
						</div>
						<div class="field">
							<label for="pgEndDate">End Date *</label>
							<cfif fusebox.fuseaction eq "new">
								<cfset EndDate = now() + day(30)>
								<input type="Text" name="pgEndDate" id="pgEndDate" value="#DateFormat(EndDate,'mm/dd/yyyy')#" size="12" maxlength="10" class="myText" />
							<cfelse>
								<input type="Text" name="pgEndDate" id="pgEndDate" value="#DateFormat(qPage.pg_RemoveDate,'mm/dd/yyyy')#" size="12" maxlength="10" class="myText" />
							</cfif>
							<img src="assets/jscalendar/img.gif" id="f_trigger_b" style="cursor: pointer;" title="Date selector"
								  onmouseover="this.style.background='red';" onmouseout="this.style.background=''" />
							<script type="text/javascript">
								Calendar.setup({
									inputField     :    "pgEndDate",      // id of the input field
									ifFormat       :    "%m/%d/%Y",       // format of the input field
									showsTime      :    false,            // will display a time selector
									button         :    "f_trigger_b",   // trigger for the calendar (button ID)
									singleClick    :    false,           // double-click mode
									step           :    1                // show all years in drop-down boxes (instead of every other year as default)
								});
							</script>
						</div>
					</fieldset>
				</div>
				<div class="field">
					<label for="pgDisplayMenu">This is the homepage</label>
					<input type="checkbox" name="pgIsHome" id="pgIsHome" value="1" <cfif qPage.pg_isHome eq 1>checked="checked"</cfif> />
					(This will be the default page for your site. This will show if no page ID is given.)
				</div>
				<div class="field">
					<label for="pgNotes">Notes</label>
					<div style="font-size:80%;">This will not show up on the homepage</div>
					<tag:textarea fieldname="pgNotes" fieldvalue="#qPage.pg_Notes#" />
				</div>
			</fieldset>
			
			<div align="right">Required ( * )</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		</td>
	</tr>
</table>
</form>
</cfoutput>