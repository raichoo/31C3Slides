module LEM

lem : Not (Not (Either a (Not a)))
lem p = p (Right $ \x => p $ Left x)

lem' : Not (Not (Dec a))
lem' p = p (No $ \x => p $ Yes x)
