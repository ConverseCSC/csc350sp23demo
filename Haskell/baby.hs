doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2

-- Composing functions
doubleSmallNumber' x = succ (if x > 100 then x else x*2)

--  ++ does concatenation
concat1 = [1, 2, 3] ++ [4, 5, 6] -- -> [1,2,3,4,5,6]

-- Strings are really lists of characters
concat2 = ['w','o'] ++ ['o','t'] -- -> "woot"
concat3 =  "wo" ++ "ot" -- -> "woot"

-- : is the cons operator
-- (Implication: Haskell lists are like Lisp lists, a value followed by a list)
consHelloWorld = 'H':"ello, world!" -- -> "Hello, world!"

-- The empty list has no type
cons3 = 3 : [] -- -> [3]
consQ = 'Q' : [] -- -> "Q"

-- The subscript operator is !!
-- "Hello, world!" !! 7 -> 'w'
subscr1 = ([1, 2, 3] ++ [4, 5, 6]) !! 4 -- -> 5

-- Lists can contain lists
b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
consL7 = [7] : b -- -> [[7],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]

-- Lists can contain lists of lists
consB = b : [] -- -> [[[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]]
-- At that point, however, the consing gets strange
-- [[[7, 8, 9, 10]]] : b : [] -> error
-- [[[7, 8, 9, 10]]] : (b : []) -> error

-- List comparison uses the normal comparison operators
-- Comparison is element-by-element
-- [3,2,1] > [2,1,0] -> True
-- [3,2,1] < [4,1,0] -> True
-- [3,2,1] < [3,2,1,0] -> True
-- [3,2,1,0] == [3,2,1,0] -> True

-- List functions:
-- head like car (or first)
-- head [5,4,3,2,1] -> 5
-- tail like cdr (or rest)
-- tail [5,4,3,2,1] -> [4,3,2,1]
-- last like car/first, but from the rear
-- last [5,4,3,2,1] -> 1
-- init like cdr/rest, but from the rear
-- init [5,4,3,2,1] -> [5,4,3,2]
-- none of the preceding four is safe for an empty list

-- length [5,4,3,2,1] -> 5
-- null [1,2,3] -> False
-- null [] -> True

-- elem like "in", usually called as an infix function
-- 4 `elem` [3,4,5,6] -> True
-- 10 `elem` [3,4,5,6] -> False

-- Ranges
-- [1..10] -> [1,2,3,4,5,6,7,8,9,10]
-- Start: specify first element
-- [2..10] -> [2,3,4,5,6,7,8,9,10]
-- Step: specify first two elements
-- [2,4..10] -> [2,4,6,8,10]
-- [10,9..1] -> [10,9,8,7,6,5,4,3,2,1]

-- LIST COMPREHENSIONS
-- [x*2 | x <- [1..10]] -> [2,4,6,8,10,12,14,16,18,20]
-- "2x for x in the range [1..10]"

-- Can add one or more predicates to filter
-- [ x | x <- [50..100], x `mod` 7 == 3] -> [52,59,66,73,80,87,94]
-- [ x | x <- [50..100], x `mod` 7 == 3, odd x] -> [59,73,87]

-- Initial part can be as complicated as you like
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

-- List comprehensions in Haskell can draw from multiple lists.
-- The Cartesian product (all possible combinations) is generated.
nouns = ["New York", "laptop", "lion"]
adjectives = ["blue", "tall", "round"]
phrases = [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
