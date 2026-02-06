
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER Tri_Insert_stores1 
   ON [sales].[stores]  
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @name varchar(max)
	SET @name = (SELECT store_name from inserted)

	INSERT into Loginfo (Id, Logtext) values(NEWID(), @name + ' store Is inserted')
END

INSERT INTO sales.stores
                  (store_name, phone, email, street, city, state, zip_code)
VALUES ('aa', '987655', 'hgfddc', 'nbh', 'phw', 'punjab', 144411)

Select * from loginfo