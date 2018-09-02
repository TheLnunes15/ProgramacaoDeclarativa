subst :: String -> String -> String -> String
subst [] procura nv = []
subst text procura nv = cont text
  where
    cont [] = []
    cont text = let (pref, suf) = splitAt n text in
        if procura == pref then nv ++ suf
        else head text : cont (tail text)
    n = length procura
