<cfset request.RowAmount = 9 />

<cfquery name="AddBlanks" datasource="#my.db.dsn#">
	CREATE PROCEDURE addWhiteSpace AS
	DECLARE @counter INT
	SET @counter = 1
	WHILE @counter < 10
		BEGIN
			INSERT INTO #my.db.tableprefix#_ScrollEntries
				(Message, scrollerid)
			VALUES
				('blank', 'blank')
			SET @counter = @counter + 1
		END
	GO
</cfquery>