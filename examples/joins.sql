
-- examples are stolen from
-- http://www.codinghorror.com/blog/2007/10/a-visual-explanation-of-sql-joins.html

-- given the following two tables TableA (left) and TableB (right)

id name       id  name
-- ----       --  ----
1  Pirate     1   Rutabaga
2  Monkey     2   Pirate
3  Ninja      3   Darth Vader
4  Spaghetti  4   Ninja


-- inner join, like a boolean intersection, only matches
SELECT * FROM TableA
INNER JOIN TableB
ON TableA.name = TableB.name

id  name       id   name
--  ----       --   ----
1   Pirate     2    Pirate
3   Ninja      4    Ninja

-- outer join, like a boolean union, nulls where there is no match
SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.name = TableB.name

id    name       id    name
--    ----       --    ----
1     Pirate     2     Pirate
2     Monkey     null  null
3     Ninja      4     Ninja
4     Spaghetti  null  null
null  null       1     Rutabaga       
null  null       3     Darth Vader

-- left outer join, uniques in A plus matches in B
SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON TableA.name = TableB.name

id  name       id    name
--  ----       --    ----
1   Pirate     2     Pirate
2   Monkey     null  null
3   Ninja      4     Ninja
4   Spaghetti  null  null

-- left outer join without null, just the unique things in A
SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON TableA.name = TableB.name
WHERE TableB.id IS null

id  name       id     name
--  ----       --     ----
2   Monkey     null   null
4   Spaghetti  null   null

-- full outer join, all unique things in either table that don't match
SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.name = TableB.name
WHERE TableA.id IS null 
OR TableB.id IS null

id    name       id    name
--    ----       --    ----
2     Monkey     null  null
4     Spaghetti  null  null
null  null       1     Rutabaga
null  null       3     Darth Vader

-- cross join (everything in A times everything in B)
SELECT * FROM TableA
CROSS JOIN TableB

