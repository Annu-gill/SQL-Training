SELECT MAX (Amount) OrderAmount FROM Orders WHERE Amount <(SELECT MAX (Amount) FROM Orders)

SELECT MAX (Amount) OrderAmount FROM Orders