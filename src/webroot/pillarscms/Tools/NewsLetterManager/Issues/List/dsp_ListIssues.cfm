<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="dsp_ListIssues" language="ColdFusion">
	<responsibilities>
		I display a list of issues in the database.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
</fusedoc>
--->

<cfoutput>
<table cellpadding="2" cellspacing="2">
	<tr>
		<td class="myFieldTitle" align="center">##</td>
		<td class="myFieldTitle">Date</td>
		<td class="myFieldTitle" align="center">Edit</td>
		<td class="myFieldTitle" align="center">Enabled</td>
	</tr>
	<cfloop query="qIssues">
	<tr <cfif not (qIssues.currentrow mod 2)>class="myRow2"</cfif>>
		<td align="center">#qIssues.CurrentRow#</td>
		<td><a href="#myself##xfa.ListArticles#&issueid=#qIssues.id#">#DateFormat(qIssues.date,"mm/dd/yyyy")#</a></td>
		<td align="center"><a href="#myself##xfa.Editissue#&issueid=#qIssues.id#"><img src="#my.design.folder##my.theme.folder#icons/iconedit.gif"/></a></td>
		<td align="center">
			<cfif qIssues.enabled eq 1>
				<img src="#my.design.folder##my.theme.folder#icons/iconcheckmark.gif" />
			<cfelse>
				<img src="#my.design.folder##my.theme.folder#icons/icondelete.gif" />
			</cfif>
		</td>
	</tr>
	</cfloop>
	<tr>
		<td class="myFieldTitle" width="20"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="20" height="1" /></td>
		<td class="myFieldTitle" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="1" height="1" /></td>
		<td class="myFieldTitle" width="50"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1" /></td>
		<td class="myFieldTitle" width="50"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1" /></td>
	</tr>
</table>
</cfoutput>