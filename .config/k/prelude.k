E:2.7182818285
PI:3.1415926536

pow:{*/y#x}
gam:{`exp y*`ln x}
sin:`sin
cos:`sin PI+
tan:{(%sin x)/cos x}

lwr:{{$[(x>64)*x<91;`c$x+32;x]}'x}

rot:{y[(#y)!-x-!#y]}
mul:(+/*)\:
i2x:,/"0123456789abcdef"@(-2#0,)'+16\
x2i:{p:((2!#x)#"0"),x;16/'"0123456789abcdef"?(2*!`i$(#p)%2)_lwr@p}
x2c:{`c$'x2i x}
