
-- Perfil em Eng. de Sw
-- Aula de 17/2/2023

module Parser where


import Prelude hiding ((<*>),(<$>))

import Data.Char


infixl 2 <|>
infixl 3 <*>

type Parser r = String -> [(r,String)]

symbola :: String -> [(Char,String)]
symbola []    = []
symbola (h:t) | h == 'a'  = [(h , t)]
              | otherwise = []


symbol :: Char -> Parser Char
symbol c [] = []
symbol c (h:t) | h == c    = [(h,t)]
               | otherwise = []

symbol' c = f <$> symbol c <*> spaces
  where f r1 r2 = r1

satisfy :: (Char -> Bool) -> Parser Char
satisfy p [] = []
satisfy p (h:t) | p h        = [ (h,t)]
                | otherwise  = []

satisfy' p = (\r1 _ -> r1) <$> satisfy p <*> spaces

token :: String -> Parser String
token t [] = []
token t inp = if take (length t) inp == t
              then [(t,drop (length t) inp )]
              else []

token' t = (\r1 _ -> r1) <$> token t <*> spaces

succeed :: a -> Parser a 
succeed r inp = [( r , inp )] 


(<|>) :: Parser a -> Parser a -> Parser a
(p <|> q) inp = p inp ++ q inp


fors  =  token "for"
     <|> token "while"



{-
(p <*> q) inp = [ ( (r,r'') ,inp'')
                | (  r      ,inp' ) <- p inp
                , (    r''  ,inp'') <- q inp'
                ]

exThen = token "if" <*> symbol ' ' <*>  symbol '('
-}

(<*>) :: Parser (a -> r) -> Parser a -> Parser r
(p <*> q) inp = [ ( f v ,inp'')
                | ( f   ,inp' ) <- p inp
                , (   v ,inp'') <- q inp'
                ]

(<$>)  :: (a -> r) -> Parser a -> Parser r
(f <$> p) inp =  [ ( f v , inp') 
                 | (   v , inp') <- p inp
                 ]

-- a+
--  A -> a
--    |  a A
-- qts a existem!

pA =  f <$> symbol 'a' 
  <|> g <$> symbol 'a' <*> pA
   where f x = 1
         g x y = 1 + y

-- Gramática do quadro

pX =  f <$>  pB <*> pA
   where f b a = (b,a)

pB =   f <$> symbol 'b' <*> pB
  <|>        succeed 0 
  where f  a b = 1 + b


-- um ou mais simbolos i
-- i+

pI :: Parser [Char]
pI = f <$> symbol 'i'
  <|> g <$> symbol 'i' <*> pI
  where f r1 = [r1]
        g r1 r2 = r1:r2

oneOrMore :: Parser a -> Parser [a]
oneOrMore p = f <$> p
  <|> g <$> p <*> oneOrMore p
  where f r1 = [r1]
        g r1 r2 = r1:r2

-- a*
zeroOrMore :: Parser a -> Parser [a]
zeroOrMore p = succeed []
  <|> f <$> p <*> zeroOrMore p
  where f r1 r2 = r1:r2

spaces = zeroOrMore (satisfy isSpace)

ident = oneOrMore (satisfy isAlpha) -- letra maiuscla ou minuscla

pIErr :: Parser [Char]
pIErr = f <$> symbol 'i'
  <|> g <$> pIErr <*> symbol 'i'
  where f r1 = [r1]
        g r1 r2 = r1++[r2]


