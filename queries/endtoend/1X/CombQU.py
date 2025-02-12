






def combine(qNum, U, Q, filename):

    tot = U + Q
    per = (int) (qNum / tot)
    Unum = per * U
    Qnum = qNum - Unum

    qfile = open("Qinfos", 'r')
    qlines = qfile.readlines()
    qfile.close()
    ufile = open("Uinfos", 'r')
    ulines = ufile.readlines()
    ufile.close()

    idx = 1
    qIdx = 0
    uIdx = 0
    deletes = []
    insIdx = 0
    orders = []
    isIns = False
    with open(filename, 'w') as ff:
        while idx <= 1000:
            # write Q;
            for i in range(Q):
                q = qlines[qIdx]
                qIdx += 1
                if idx <= 1000:
                    ff.write(f"Q_{str(idx)}:{q.strip().split(":")[1]}:{q.strip().split(":")[2]}\n")
                    idx += 1

            # write U;
            for i in range(U):
                u = ulines[uIdx]
                if idx <= 1000:
                    if len(deletes) < 30:
                        ff.write(f'U_{str(idx)}:-{u}')
                        deletes.append(u)
                        orders.append(f'-{u}')
                    else:
                        if isIns == False:
                            ff.write(f'U_{str(idx)}:-{u}')
                            deletes.append(u)
                            orders.append(f'-{u}')
                            isIns = True
                        else:
                            ff.write(f'U_{str(idx)}:+{deletes[insIdx]}')
                            # deletes.append(u)
                            orders.append(f'+{deletes[insIdx]}')
                            insIdx += 1
                            isIns = False

#                        if len(deletes) % 2 == 1:
#                            ff.write(f'U_{str(idx)}:-{u}')
#                            deletes.append(u)
#                            orders.append(f'-{u}')
#                        else :
#                            ff.write(f'U_{str(idx)}:+{deletes[insIdx]}')
#                            # deletes.append(u)
#                            orders.append(f'+{deletes[insIdx]}')
#                            insIdx += 1

                    idx += 1
                    uIdx += 1

    ff = open(f'orders-{filename}', 'w')
    oidx = 0
    for o in orders:
        if oidx > 0:
            ff.write(',')
        oidx += 1
        ff.write(o.strip())
    ff.close()

    for o in orders:
        if o[0] == '+':
            oo = f'-{o[1:]}'
            if oo not in orders:
                print(f'{oo} no in')


