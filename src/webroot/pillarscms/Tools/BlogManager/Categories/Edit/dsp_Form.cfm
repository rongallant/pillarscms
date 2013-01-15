<cfimport prefix="tag" taglib="../../../../tags/">
<cfoutput>
<table cellpadding="2" cellspacing="2" border="0">
<form name="myForm" action="#self#" method="post">
<input type="Hidden" name="fuseaction"/>
	<tr>
		<td class="myFieldTitle" width="150"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="150" height="1"/></td>
		<td class="myFieldTitle" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="150" height="1"/></td>
	</tr>

	<tr>
		<td class="myFieldTitle"><label for="">Title</label></td>
		<td>
			<input type="Text" name="title" id="title" size="60" maxlength="256" value="#qCat.title#" class="myText"/>
			<span class="note"></span>
		</td>
	</tr>

	<tr>
		<td class="myFieldTitle"><label for="description">Description</label></td>
		<td>
			<tag:textarea fieldname="description" fieldvalue="#qCat.description#" maxlength="512"/>
			<span class="note"></span>
		</td>
	</tr>

	<tr>
		<td class="myFieldTitle"></td>
		<td class="myFieldTitle" align="right">
			<cfif fusebox.fuseaction eq "new">
				<input type="Button" name="AddButton" value="Add Category" class="myButton"/>
			<cfelse>
				<input type="Button" name="DeleteButton" value="Delete Category" class="myButton"/>
				<input type="Button" name="UpdateButton" value="Update Category" class="myButton"/>
				<input type="Hidden" name="catid" value="#qCat.id#"/>
			</cfif>
		</td>
	</tr>

	<cfif fusebox.fuseaction eq "edit">
	<tr>
		<td colspan="2">
			<cfif len(qCat.cr_id)><b>Created:</b> #qCat.cr_id# - #qCat.cr_ts#<br></cfif>
			<cfif len(qCat.lu_id)><b>Updated:</b> #qCat.lu_id# - #qCat.lu_ts#</cfif>
		</td>
	</tr>
	</cfif>
</form>
</table>
</cfoutput>