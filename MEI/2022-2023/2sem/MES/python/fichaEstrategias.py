import zipper as zp

lista = [1, 2, 3]

def alteraLista(lst):
    z = zp.obj(lst)
    n = z.down().right()
    return n.replace(n.node() + 10).root()

def alteraLista2(lst):
    z = zp.obj(lst)
    n = z.down().right()
    return n.trans(lambda x: x + 10).root()

lista = alteraLista(lista)
print(lista)