E:2.7182818285
PI:3.1415926536

pow:{*/y#x}
gam:{`exp y*`ln x}
sin:`sin
cos:`sin PI+
tan:{(%sin x)/cos x}

rot:{y[(#y)!-x-!#y]}
mul:(+/*)\:
hex:,/"0123456789abcdef"@(-2#0,)'+16\
