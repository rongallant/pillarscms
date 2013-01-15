<cfoutput>
	<form name="myForm" action="#self#" method="post">
		<input type="hidden" name="fuseaction" id="fuseaction" value="#xfa.SelectBlock#" />
		<input type="hidden" name="blockfuseaction" id="blockfuseaction" value="#xfa.DisplayBlock#" />
		#formToHidden("fuseaction,fieldnames,submitButton,blockfuseaction")#
		<table cellpadding="3" cellspacing="3" border="0">
			<tr>
				<td width="200" id="FormHeader"><img src="assets/images/spacer.gif" width="200" height="1" border="0" alt="" /></td>
				<td width="100%" id="FormHeader"><img src="assets/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
			</tr>
			<tr>
				<td align="right" id="FormHeader"><label for="blkbgcolor">Select a News Scroller</label></td>
				<td>
					<cfif qNewsScrollers.recordcount eq 0>
						<p><a href="#myself#scrollers.new">You need to create a scroller first</a></p>
					<cfelse>
						<select name="blockidlist" id="blockidlist">
							<cfloop query="qNewsScrollers">
								<option value="#qNewsScrollers.scrollerid#">#qNewsScrollers.name#</option></cfloop>
						</select>
					</cfif>
				</td>
			</tr>

			<tr>
				<td id="FormHeader"><img src="assets/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
				<td align="right" id="FormHeader"><input type="submit" name="submitButton" id="submitButton" value="Add Block" class="myButton" /></td>
			</tr>
		</table>
	</form>
</cfoutput>