WITH duplicate_emails_id AS (
    SELECT	
		id,
		ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) as row_num
    FROM Person
	WHERE email IN 
		(SELECT email 
		 FROM Person 
		 GROUP BY email 
		 HAVING COUNT(email) > 1
		)	
)
DELETE FROM Person 
WHERE id IN (SELECT id FROM duplicate_emails_id WHERE row_num > 1)
