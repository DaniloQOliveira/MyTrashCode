-- Perfil em Eng. de Sw
-- Aula de 24/2/2023

module Parser where

import Parser
import Let
import Prelude hiding ((<*>),(<$>))
import Data.Char

data Exp = Add Exp Exp
         | Mul Exp Exp
         | Const Int
         | Var String
         deriving String

-- "3 + 4 * 2"
e :: Exp
e = Add (Const 3) (Mul (Const 4) (Const 2))

-- Gramática
-- Exp    -> Termo '+' Exp
--         | Termo
-- Termo  -> Factor '*' Termo
--         | Factor
-- Factor -> int
--         | var
--         | '(' Exp ')'
--
pExp :: Parser Exp










