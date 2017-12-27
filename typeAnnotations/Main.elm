module Main exposing (..)
import Html

-- type alias:
type alias Item =
  {name : String, price : Float, qty : Int, discounted : Bool}

-- list of records
-- Type annotation:
--cart : List {name : String, price : Float, qty : Int, discounted : Bool}
cart : List Item
cart = [
  {name = "Lemon", price = 0.5, qty = 1, discounted = False},
  {name = "Apple", price = 1.0, qty = 5, discounted = False},
  {name = "Lemon", price = 1.25, qty = 10, discounted = False}
  ]

-- applies discount if qty above 5 -> otherwise, returns item untouched
--discount : number -> Float -> {name : String, price : Float, qty : Int, discounted : Bool} -- use type alias instead of reapeating
discount : number -> Float -> Item
discount minQty discPct item =
  if not item.discounted && item.qty >= minQty then
    {item |
      price = item.price * (1.0 - discPct)
      , discounted = True
    }
  else
    item

newCart : List Item
newCart =
  -- two versions on the same itemlist
  List.map ((discount 10 0.3) >> (discount 5 0.2)) cart

main =
  Html.text (toString newCart)
