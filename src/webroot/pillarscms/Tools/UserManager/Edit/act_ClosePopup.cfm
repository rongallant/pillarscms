<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="act_ClosePopup" language="ColdFusion">
	<responsibilities>
		I close the current popup window.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2003-04-10" />
	</properties>
</fusedoc>
--->

<script type="text/javascript">
	parent.opener.location.reload();
	window.close();
</script>

<p><a href="javascript:window.close();">Close Window</a></p>