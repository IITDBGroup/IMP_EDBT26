import random







def Gen():
    upd = []

    for i in range(2000):
        a = random.randint(1, 60000)
        while a in upd:
            a = random.randint(1, 60000)
        upd.append(a)
    ff = open("Uinfos", 'w')
    for u in upd:
        ff.write(f'{str(u)}\n')
    ff.close()