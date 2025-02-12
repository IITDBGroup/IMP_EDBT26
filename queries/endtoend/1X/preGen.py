import GenQ as genQ
import GenU as genU
import CombQU as combQU
import GenNormals as genNormal
import GenCap as genCap
# import GenDelta as genDelta
import GenInc as genInc
# import StaInc as sta









def main():
    # genQ.Gen()
    # genU.Gen()
    Us = [1, 5, 1]
    Qs = [5, 1, 1]
    Ns = ['01', '02', '03']
    for idx in range(len(Us)):
        U = Us[idx]
        Q = Qs[idx]
        N = Ns[idx]
        combQU.combine(1000, U, Q, f'norInfo{N}')
        genNormal.Gen(f'q{N}', f'norInfo{N}', U, Q)
        genCap.gen('./capFiles', f'norInfo{N}', U, Q)
        genInc.gen(f'norInfo{N}')




if __name__ == '__main__':
    main()