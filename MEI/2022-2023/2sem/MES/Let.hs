
-- Perfil em Eng. de Sw
-- Aula de 17/2/2023

module Let where

import Parser
import Data.Char


import Prelude hiding ((<*>),(<$>))


example = let { a = b + 3;
                c = 4 * a;
                b = 23;
              } in c

input = "let{ a = 3 ; c = a ; b = 23;}inc"

input2 = "let{a=3;x=let{c=a;}inc;b=23;}inc"



data Let = Let Items Exp
        deriving Show

type Items = [Item]

data Item = NestedLet String Let
          | Decl      String Exp
          deriving Show

type Exp = String


pLet = f <$> token' "let" <*> symbol' '{' <*> pItems 
                         <*> symbol' '}' <*> token "in"
                         <*> pExp
       where f l a i f _ e = Let i e 

pItems =         succeed []
      <|>  f <$> pItem <*> symbol' ';' <*> pItems
    where f a b c = a:c

pItem =  f <$>  pId <*> symbol' '=' <*> pExp
     <|> g <$>  pId <*> symbol' '=' <*> pLet
     where  f a b c = Decl a c
            g a b c = NestedLet a c


pExp =  f <$>   pId
    <|> g <$>   pInt
    where f a = a
          g a = a 

pId =  f <$>  satisfy' (isLower)
   <|> g <$>   satisfy' isLower <*> pId
   where f a = [a]
         g a b = a : b

pInt =  f <$>   satisfy' isDigit
    <|> g <$>   satisfy' isDigit <*> pInt
    where f a = [a]
          g a b = a:b
