-- COSC 304 Fall 2019
-- Lab2 Sept 10, 2019
-- DTULab2

{- Replace ABC above and below with your 3 letters, capped.
Then rename the file, again changing ABC with your 3 letters, capped. -}

module DTULab2 where

-- Question 1
listlength [] = 0
listlength (head:restoflist) = 1 + listlength restoflist

listsum [] = 0
listsum (head:restoflist) = head + listsum restoflist

-- Question 2
data Nat = Z | S Nat deriving (Read, Show, Eq)

add nat1 Z = nat1
add nat1 (S nat2) =  add (S nat1) nat2

minus nat1 Z = nat1
minus Z nat2 = Z
minus (S nat1) (S nat2) = minus nat1 nat2

mult nat1 Z = Z
mult nat1 (S nat2) = add nat1 (mult nat1 nat2)

-- Question 3
nattoInt Z = 0
nattoInt (S nat) = 1 + nattoInt nat

buildNat 0 = Z
buildNat int = S (buildNat (int - 1) )

-- Question 4
lt Z Z = False
lt nat1 Z = False
lt Z nat1 = True
lt (S nat1) (S nat2) = lt nat1 nat2

lte Z Z = True
lte Z nat1 = True
lte nat1 Z = False
lte (S nat1) (S nat2) = lte nat1 nat2

-- Question 5 - tests
three = buildNat 3
five = buildNat 5
test1 = buildNat 4
test2 = nattoInt (S(S(S(S(S(S Z))))))
test3 = add three five
test4 = mult three five
test5 = minus five three
test6 = lte three five

-- Question 6
factNat (S Z) = (S Z)
factNat Z = Z
factNat (S nat) = mult (S nat) (factNat nat)

test7 = factNat (S(S(S Z)))
test8 = nattoInt (factNat(buildNat 5))

-- Question 7
addA [] = []
addA (head:restoflist) = (head++"a"):(addA restoflist)

test9 = addA["cat", "dog"]

-- astar = addA astar
astar = "":addA (astar)
test10 = take 6 astar



{- Expressions test1, ... test10 ARE DEFINED IN THIS FILE, NOT IN THE TEST FILE -}
