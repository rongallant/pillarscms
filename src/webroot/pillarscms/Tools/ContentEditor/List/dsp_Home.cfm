<cfimport prefix="menu" taglib="../menus/">
<cfimport prefix="sec" taglib="../../../">

<style type="text/css">
	A.myMenuLink, A:Hover.myMenuLink, A:Visited.myMenuLink {
		font-family: Arial, sans-serif;
		font-size: 12px;
		font-weight: bold;
	}
	 A.myMenuLinkDisabled, A:Hover.myMenuLinkDisabled, A:Visited.myMenuLinkDisabled {
		font-family: Arial, sans-serif;
		font-size: 12px;
		font-weight: bold;
		color: Red;
	}
	.TreeMenuItem {
		margin-bottom: 3px;
	}
	.myFieldTitle {
		text-align: center;
		padding: 3px;
		margin-bottom: 3px;
	}
</style>

<cfoutput>
	<script src="#pathto('ContentEditor','url')#tree/tree.js" type="text/javascript"></script>
</cfoutput>

<table cellpadding="10" cellspacing="0" border="0" align="center">
	<tr valign="top">
		<td width="50%">
			<div class="myFieldTitle">Pages</div>
			<menu:pagelist
				dsn="#my.db.dsn#"
				page="#myself#pgEdit.edit"
				startmenu="1"
				tableprefix="#my.db.tablePrefix#"
				submenu="yes"
				showdisabled="yes"
			>
		</td>
		<td width="50%">
			<sec:security rights="800">
				<cfif request.validated eq 1>
					<div class="myFieldTitle">Template Zones</div>
					<menu:pagelist
						dsn="#my.db.dsn#"
						page="#myself#pgEdit.edit"
						startmenu="2"
						tableprefix="#my.db.tablePrefix#"
						submenu="yes"
						showdisabled="yes"
					>
				</cfif>
			</sec:security>
		</td>
	</tr>
</table>