

def gen(dir, allInfoFiles, U, Q):
    cap_file = open("capFiles/capTemplate", 'r')
    cap_lines = cap_file.readlines()
    cap_file.close()
    info_file = open(allInfoFiles, 'r')
    info_lines = info_file.readlines()
    info_file.close()

    for line in info_lines:
        line = line.strip()
        if line[0] == 'Q':
            buckets = line.strip().split(":")[2].strip().split("_")
            #writeFile = open(f"{dir}/cap_{str(U)}_{str(Q)}_{buckets[0]}_{buckets[1]}.sql", 'w')
            writeFile = open(f"{dir}/cap_{buckets[0]}_{buckets[1]}.sql", 'w')
            for cap_line in cap_lines:
                writeFile.write(cap_line)
            writeFile.write(f'WHERE ((F0_0."AGGR_0" > {buckets[0]}) AND (F0_0."AGGR_0" < {buckets[1]}));\n')
            writeFile.close()
