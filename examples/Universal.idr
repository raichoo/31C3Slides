module Universal

plusS : (n : Nat) -> 1 + n = n + 1
plusS Z     = Refl
plusS (S k) = rewrite plusS k in
                      Refl
