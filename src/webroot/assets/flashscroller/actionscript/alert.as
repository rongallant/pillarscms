function alert(message)
{
	if(message != undefined)
	{
		getURL("javascript:alert('"+message+"')");
	}
}