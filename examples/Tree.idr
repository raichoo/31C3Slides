module Tree

data TreeShape : Type where
  LeafS   : TreeShape
  BranchS : TreeShape -> TreeShape -> TreeShape

data Tree : TreeShape -> Type -> Type where
  Leaf   : Tree LeafS a
  Branch : a -> Tree s a -> Tree s' a -> Tree (BranchS s s') a

%name Tree t1,t2,t3,t4

test : Tree (BranchS (BranchS LeafS LeafS) LeafS) Nat
test = Branch 1 (Branch 2 Leaf Leaf) Leaf

zipWith : (a -> b -> c) -> Tree s a -> Tree s b -> Tree s c
zipWith f Leaf Leaf = Leaf
zipWith f (Branch x t1 t3) (Branch y t2 t4) =
  Branch (f x y) (zipWith f t1 t2) (zipWith f t3 t4)

data IsElem : a -> Tree s a -> Type where
  Here    : IsElem x (Branch x l r)
  IsLeft  : IsElem x l -> IsElem x (Branch y l r)
  IsRight : IsElem x r -> IsElem x (Branch y l r)

isNotInLeaf : Not (IsElem x Leaf)
isNotInLeaf Here impossible

isNotInTree : {l : Tree s a}
           -> {r : Tree s' a}
           -> Not (x = y)
           -> Not (IsElem x l)
           -> Not (IsElem x r)
           -> Not (IsElem x (Branch y l r))
isNotInTree nv nl nr Here        = nv Refl
isNotInTree nv nl nr (IsLeft p)  = nl p
isNotInTree nv nl nr (IsRight p) = nr p

isElem : DecEq a => (x : a) -> (t : Tree s a) -> Dec (IsElem x t)
isElem x Leaf = No isNotInLeaf
isElem x (Branch y l r) with (decEq x y)
  isElem x (Branch x l r) | Yes Refl = Yes Here
  isElem x (Branch y l r) | No nv with (isElem x l)
    isElem x (Branch y l r) | No nv | Yes p = Yes (IsLeft p)
    isElem x (Branch y l r) | No nv | No nl with (isElem x r)
      isElem x (Branch y l r) | No nv | No nl | Yes p = Yes (IsRight p)
      isElem x (Branch y l r) | No nv | No nl | No nr =
        No (isNotInTree nv nl nr)
