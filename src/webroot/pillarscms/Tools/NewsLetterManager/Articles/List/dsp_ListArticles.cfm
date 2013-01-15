<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="" language="ColdFusion">
	<responsibilities>
		I 
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="" />
	</properties>
	<io>
		<in>
			<string name="" />
		</in>
		<out>
			<string name="" />
		</out>
	</io>
</fusedoc>
--->

<style type="text/css">
	.Disabled {
		color:red;
	}
</style>

<cfoutput>
<table cellpadding="2" cellspacing="2">
	<tr>
		<td width="20"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="20" height="1" /></td>
		<td width="20"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="20" height="1" /></td>
		<td width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1" /></td>
		<td width="50"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1" /></td>
		<td width="50"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="50" height="1" /></td>
	</tr>
	<tr>
		<td class="myFieldTitle" align="center">##</td>
		<td class="myFieldTitle" align="center">Order</td>
		<td class="myFieldTitle">Title</td>
		<td class="myFieldTitle" align="center">Edit</td>
		<td class="myFieldTitle" align="center">Enabled</td>
	</tr>
	<cfloop query="qArticles">
	<tr <cfif qArticles.CurrentRow mod 2>class="coloredrow"</cfif>>
		<td>#qArticles.orderby#</td>
		<td align="center" nowrap="nowrap">
			<cfif qArticles.currentrow gt 1>
				<a href="#myself##xfa.ChangeOrder#&go=up&issueid=#attributes.issueid#&id=#qArticles.id#"><img src="#my.design.folder##my.theme.folder#icons/iconup.gif" width="16" height="13" alt="Up"/></a>
			<cfelse>
				<img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="16" height="13"/>
			</cfif>
			<cfif qArticles.currentrow  lt  qArticles.recordcount>
				<a href="#myself##xfa.ChangeOrder#&go=down&issueid=#attributes.issueid#&id=#qArticles.id#"><img src="#my.design.folder##my.theme.folder#icons/icondown.gif" width="16" height="13" alt="Down"/></a>
			<cfelse>
				<img src="#my.design.folder##my.theme.folder#images/spacer.gif" width="16" height="13" />
			</cfif>
		</td>
		<td><a href="#myself##xfa.Edit#&articleid=#qArticles.id#" title="#qArticles.id#"><span <cfif qArticles.enable eq 0>class="Disabled"</cfif>>#qArticles.title#</span></a></td>
		<td align="center"><a href="#myself##xfa.Edit#&articleid=#qArticles.id#"><img src="#my.design.folder##my.theme.folder#icons/iconedit.gif" /></a></td>
		<td align="center">
			<cfif qArticles.enable eq 1>
				<img src="#my.design.folder##my.theme.folder#icons/iconcheckmark.gif" />
			<cfelse>
				<img src="#my.design.folder##my.theme.folder#icons/icondelete.gif" />
			</cfif>
		</td>
	</tr>
	</cfloop>
</table>
</cfoutput>