import GenQ as genQ
import GenU as genU
import CombQU as combQU
import GenNormals as genNormal
import GenCap as genCap
# import GenDelta as genDelta
import GenInc as genInc
# import StaInc as sta




def check(n):
    fff = open(f'norInfo{n}', 'r')
    lines = fff.readlines()
    fff.close()
    deleted = []
    for line in lines:
        lineA = line.strip();
        lineCells = lineA.strip().split(':')
        if lineCells[0][0] == 'U':
            cell = lineCells[1]
            if cell[0] == '-':
                deleted.append(f'id >= {lineCells[1][1:]} and id < {(int) (lineCells[1][1:]) + 20}' )
            else:
                if f'id >= {cell[1:]} and id < {(int) (cell[1:]) + 20}' not in deleted:
                    print(f'error for U: {lineCells[0]}')




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

    for n in Ns:
        check(n)



if __name__ == '__main__':
    main()