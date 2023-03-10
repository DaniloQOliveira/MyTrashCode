import zipper as zp
import strategy as st
from adt import adt, Case

lista = [1, 2, 3]

def alteraLista(lst):
    z = zp.obj(lst)
    n = z.down().right()
    return n.replace(n.node() + 10).root()

def alteraLista2(lst):
    z = zp.obj(lst)
    n = z.down().right()
    return n.trans(lambda x: x + 10).root()

def alteraDois(lst):
    if lst == 2:
        return 12
    else:
        return lst
    
def alteraListaS(lst):
    z = zp.obj(lst)
    return st.full_tdTP(lambda x: st.adhocTP(st.idTP, alteraDois, x), z).node()

@adt
class Tree:
    EMPTY: Case
    LEAF: Case[int]
    NODE: Case["Tree", "Tree"]
               
    def __repr__ (self):
        return str(self)
       
    def __str__ (self):
        return self.match(
        empty = lambda: "",
        leaf = lambda x: str(x),
        node = lambda x, y: "Node_" + str(x) + "_" + str(y))

x = Tree.NODE(Tree.LEAF(3), Tree.LEAF(4))

def somaUm(t):
    return t.match(
        leaf = lambda x: Tree.LEAF(x + 1),
        node = lambda x, y: st.StrategicError,
        empty = lambda: st.StrategicError)
    if result is st.StrategicError:
        raise result
    else:
        return result
    
def somaUmS(lst):
    z = zp.obj(lst)
    return st.full_tdTP(lambda x: st.adhocTP(st.idTP, somaUm, x), z).node()

def somaUm2(t):
    return t.match(
        leaf = lambda x: Tree.LEAF(x + 1),
        node = lambda x, y: Tree.NODE(x, y),
        empty = lambda: Tree.EMPTY())

def somaUmS2(lst):
    z = zp.obj(lst)
    return st.full_tdTP(lambda x: st.adhocTP(st.idTP, somaUm2, x), z).node()

print("lista        = ", lista)
print("alteraLista  = ", alteraLista(lista))
print("alteraLista2 = ", alteraLista2(lista))
print("alteraDois   = ", alteraDois(lista))                              
print("alteraListaS = ", alteraListaS(lista))
#print("somaUm       = ", somaUm(lista))
print("somaUmS      = ", somaUmS(lista))
#print("somaUm2      = ", somaUm2(lista))
print("somaUmS2     = ", somaUmS2(lista))