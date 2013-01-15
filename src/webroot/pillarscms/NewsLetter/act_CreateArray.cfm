<cfscript>
	request.story = ArrayNew(1);
	i = 0;
	while ( i lt qIssue.recordcount ) {
		i = i + 1;
		request.story[i] = StructNew();
		request.story[i].storyid = qIssue.storyid[i];
		request.story[i].title = qIssue.title[i];
		request.story[i].startdate = qIssue.startdate[i];
	}
</cfscript>
<cfparam name="request.storyindex" default="1" type="numeric">