




def Gen(dir, filename, U, Q):
    # updatesFile = f'./AllUpdates/updates_{str(U)}_{str(Q)}.sql'
    # updates = open(updatesFile, 'w')
    # updates.close()
    ff = open(filename, 'r')
    lines = ff.readlines()
    ff.close()
    for line in lines:
        line = line.strip()
        if line[0] == 'Q':
            qidx = line.strip().split(':')[0].strip().split('_')[1]
            avgR = line.strip().split(':')[1].strip().split('_')
            left = avgR[0]
            right = avgR[1]

            qfile = open(f'./{dir}/nor_{qidx}.sql', 'w')
            qfile.write(f'select a, avg(c) as ac from edb1 group by a having avg(c)> {str(left)} and avg(c) < {str(right)};\n')
            qfile.close()
        else:
            qidx = line.strip().split(':')[0].strip().split('_')[1]
            uNum = line.strip().split(':')[1].strip()
            if uNum[0] == '-':
                qfile = open(f'./{dir}/nor_{qidx}.sql', 'w')
                # qfile.write(f'delete from edb1 where a = {uNum[1:]};')
                qfile.write(f'delete from edb1 where id >= {uNum[1:]} and id < {(int) (uNum[1:]) + 20};')
                qfile.close()

            else :
                qfile = open(f'./{dir}/nor_{qidx}.sql', 'w')
                # qfile.write(f'insert into edb1 select * from edb1_backup where a = {uNum[1:]};')
                qfile.write(f'insert into edb1 select * from edb1_backup where id >= {uNum[1:]} and id < {(int) (uNum[1:]) + 20};')
                qfile.close()
