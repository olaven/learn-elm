-- almost everything is a function, or
-- can act as one

-- function notation

-- prefix function
-- funName par1 par2

-- infix functions
-- par1 funName par2


-- ex. infix function
module Main exposing (..)
import Html

-- infix function definitio
(~+) a b =
  a + b + 0.1

-- infix funtion use
result =
  1 ~+ 2

-- using an infix function as prefix funnctio
resultPrefix =
  (~+) 1 2

main =

  Html.text (toString result)
