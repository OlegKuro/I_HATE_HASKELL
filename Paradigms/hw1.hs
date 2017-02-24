-- Хаятов Олег А3200

-- Задание: 
-- Написать функцию hasPair :: Integer -> Bool, которая проверяет,
-- есть ли в десятичной записи заданного числа две подряд идущие одинаковые цифры
-- Ex.: hasPair 1001 => True
--      hasPair 1212 => False

-- Задание простое. Будем постоянно делить на 2 и понимать, какая ведущая цифра.
-- Проблема лишь в том, как понять, какая она. Для этого будем использовать встроенные функции div и mod
-- возьмем небольшое число, чтобы понять, как все устроено. Например Oleg.rand() = 19 (19 = 1 + 2 + 16 = 10011)
-- 19/2=9 19%2 = 1
-- 9/2=4 9%2 = 1
-- 4/2=2 4%2 = 0
-- 2/2=1 2%2 = 0
-- 1. - получение при целочисленном делении единицы - признак окончания рекурсии (но это неточно)

-- функция будет рекурсивная, т.к. нельзя писать циклы. По аналогии с факкториалом на паре в субботу, будем передавать туда число и предыдущую полученную цифру
-- для этого, опять же, по аналогии с факториалом, сделаем вспомогательную функцию, где будем делать всю "грязь"
-- !!! если мы получим уже положительный результат, нам не за чем спускаться по рекурсии ниже !!!
module HW1 where

hasPair :: Integer -> Bool
hasPair n | n < 0 = error "Please type in positive number"
hasPair n | n < 2 = False --односимвольные числа нам неинтересны
hasPair n = hasPair' n (-1)

hasPair' :: Integer -> Integer -> Bool
hasPair' n prevFig |
 prevFig == n `mod` 2 = True |
 n==1 = False |
 n==0 = False |
 n>1 = hasPair' (n `div` 2) (n `mod` 2)

--Несколько тестов 
--19 разобрано выше и ответ True
--101010 = 2 + 8 + 32 = 42 ответ False
--10101 = 1 + 4 + 16 = 21 ответ False
--3 ответ True	
--2 ответ False
--(-1) даст ошибку
main = [hasPair 19, hasPair 42, hasPair 21, hasPair 3, hasPair 2, hasPair (-1)]