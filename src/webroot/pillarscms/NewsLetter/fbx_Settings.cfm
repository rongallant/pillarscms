<cfimport prefix="fb" taglib="../" />
<cfif not isDefined('request.GotStory')>
	<cfset request.gotStory = 1 />
	<cfparam name="attributes.story" default="" />
	<cfparam name="attributes.issue" default="" />
	<fb:fusebox fuseaction="NewsLetter.GetStory" story="#attributes.story#" issue="#attributes.issue#" layout="none" />
</cfif>