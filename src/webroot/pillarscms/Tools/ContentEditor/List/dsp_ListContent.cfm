<cfimport prefix="menu" taglib="../menus/">
<cfimport prefix="sec" taglib="../../../">
<script type="text/javascript">
	function hover(CurId,NewClass) {
		if ( document.getElementById ) {
			var nodeObj = document.getElementById(CurId);
			nodeObj.className = NewClass;
		}
	}
</script>
<table cellpadding="3" cellspacing="3" border="0">
	<tr>
		<td class="myFieldTitle"><img src="assets/images/spacer.gif" width="30" height="1" alt="" /></td>
		<td class="myFieldTitle">Name</td>
		<td class="myFieldTitle" align="center">Homepage</td>
		<td class="myFieldTitle" align="center">Page Type</td>
		<td class="myFieldTitle" align="center">Active</td>
	</tr>
	<menu:tablelist
		dsn="#my.db.dsn#"
		page="#myself#pgEdit.edit"
		startmenu="1"
		tableprefix="#my.db.tablePrefix#"
		submenu="yes"
		showdisabled="yes"
	>
	<sec:security rights="800">
		<cfif request.validated eq 1>
			<tr>
				<td class="myFieldTitle" colspan="5">
					Blocks
				</td>
			</tr>
			<menu:tablelist
				dsn="#my.db.dsn#"
				page="#myself#pgEdit.edit"
				startmenu="2"
				tableprefix="#my.db.tablePrefix#"
				submenu="yes"
				showdisabled="yes"
			>
		</cfif>
	</sec:security>
	<tr>
		<td class="myFieldTitle" width="30"><img src="assets/images/spacer.gif" width="30" height="1" alt="" /></td>
		<td class="myFieldTitle" width="100%"><img src="assets/images/spacer.gif" width="1" height="1" alt="" /></td>
		<td class="myFieldTitle" width="50"><img src="assets/images/spacer.gif" width="50" height="1" alt="" /></td>
		<td class="myFieldTitle" width="80"><img src="assets/images/spacer.gif" width="80" height="1" alt="" /></td>
		<td class="myFieldTitle" width="50"><img src="assets/images/spacer.gif" width="50" height="1" alt="" /></td>
	</tr>
</table>