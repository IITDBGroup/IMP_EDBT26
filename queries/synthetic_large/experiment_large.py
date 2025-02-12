import os
import argparse
import re
import sys
import subprocess
from dataclasses import dataclass
from typing import List
from math import ceil


t1gbjoin = ' tid, a,b,c,d,e,f,g,h,i,j,k '
t1gb1000g = ' a,b,c,d,e,f,g,h,i,j,k '
t1gb5000g = ' a,b,c,d,e,f,g,h,i,j,k '
t1gb500000g = ' id, a,b,c,d,e,f,g,h,i,j,k '
r500 = ' a,b,c,d,e,f,g,h,i,j '




queries = [
#    "60",
###    ## join selectivity; NO BF;
#    "30",
#    "31",
#    "32",
#
#    #### JOIN M-N
#    "18",
#    "19",


###    ###group nums for fix agg no join
    "04",
    "05",
    "50",
#    "51",
#
###    ### # Agg num 
    "01",
#    "02",
#    "03",
#    "17",

#    ### # Selection push down
    "06",
#    "07",

#    #### JOIN 1-N
    "15",
    "13",
    "16",
####    # join selec wit BF;
#    "40",
#    "41",
    "42",

########### Different sketch size;
#    "60",
#    "61",
#    "62",
#    "63",
    "64",
#    "65",
]

deltaTables = {
    "01" : "aggnumbers",
    "02" : "aggnumbers",
    "03" : "aggnumbers",
    "17" : "aggnumbers",
    "04" : "agggroups_4",
    "05" : "agggroups_5",
    "50" : "agggroups_50",
    "51" : "agggroups_51",
    "20" : "q20_21", 
    "21" : "q20_21",
    "06" : "selpd",
    "07" : "selpd",
    "13" : "join13",
    "15" : "join15",
    "16" : "join16",
    "18" : "join13",
    "19" : "join13",
    "30" : "join13s",
    "31" : "join13s",
    "32" : "join13s",
    "40" : "join13s",
    "41" : "join13s",
    "42" : "join13s",
    "60" : "join13",
    "61" : "join13",
    "62" : "join13",
    "63" : "join13",
    "64" : "join13",
    "65" : "join13",
}

captureTables = {
    "01": ['r500'],
    "02": ['r500'],
    "03": ['r500'],
    "17": ['r500'],
    "04": ['t1gb1000g'],
    "05": ['t1gb5000g'],
    "06": ['t1gb1000g'],
    "07": ['t1gb1000g'],
    "13": ['t1gbjoin'],
    "15": ['t1gb500000g'],
    "16": ['t1gb50g'],
    "18": ['t1gbjoin'],
    "19": ['t1gbjoin'],
    "20": ['t1gbjoin'],
    "21": ['t1gbjoin'],
    "30": ['t1gbjoin'],
    "31": ['t1gbjoin'],
    "32": ['t1gbjoin'],
    "40": ['t1gbjoin'],
    "41": ['t1gbjoin'],
    "42": ['t1gbjoin'],
    "50": ['t1gb500000g'],
    "51": ['t1gb50g'],
    "16": ['t1gb50g'],
    "60": ['t1gbjoin'],
    "61": ['t1gbjoin'],
    "62": ['t1gbjoin'],
    "63": ['t1gbjoin'],
    "64": ['t1gbjoin'],
    "65": ['t1gbjoin'],

}

psAttrs = {
    "01": ['a'],
    "02": ['a'],
    "03": ['a'],
    "04": ['a'],
    "05": ['a'],
    "06": ['a'],
    "07": ['a'],
    "08": ['a'],
    "09": ['a'],
    "10": ['a'],
    "11": ['a'],
    "12": ['a'],
    "13": ['a'],
    "14": ['a'],
    "15": ['a'],
    "16": ['a'],
    "17": ['a'],
    "18": ['a'],
    "19": ['a'],
    "20": ['a'],
    "21": ['a'],
    "30": ['a'],
    "31": ['a'],
    "32": ['a'],
    "40": ['a'],
    "41": ['a'],
    "42": ['a'],
    "50": ['a'],
    "51": ['a'],
    "60": ['a'],
    "61": ['a'],
    "62": ['a'],
    "63": ['a'],
    "64": ['a'],
    "65": ['a'],
}

updateNum = {
    "01": 100,
    "02": 100,
    "03": 100,
    "17": 100,

    "04": 100,
    "05": 100,
    "50": 100,
    "51": 100,

    "06": 50,
    "07": 50,

    "13": 15,
    "15": 15,
    "16": 15,
    "18": 15,
    "19": 15,

    "30": 15,
    "31": 15,
    "32": 15,

    "40": 15,
    "41": 15,
    "42": 15,

    "60": 15,
    "61": 15,
    "62": 15,
    "63": 15,
    "64": 15,
    "65": 15,
}

selectionPushDown = {
    "01": 1,
    "02": 1,
    "03": 1,
    "04": 1,
    "05": 1,
    "50": 1,
    "51": 1,
    "06": 1,
    "07": 0,
    "08": 1,
    "09": 1,
    "10": 1,
    "11": 1,
    "12": 1,
    "13": 1,
    "14": 1,
    "15": 1,
    "16": 1,
    "17": 1,
    "18": 1,
    "19": 1,
    "20": 1,
    "21": 1,
    "30": 1,
    "31": 1,
    "32": 1,
    "40": 1,
    "41": 1,
    "42": 1,
    "60": 1,
    "61": 1,
    "62": 1,
    "63": 1,
    "64": 1,
    "65": 1,
}

updateType = {
    "01": 'rec',
    "02": 'ri',
    "03": 'ri',
    "04": 'ri',
    "05": 'ri',
    "50": 'ri',
    "51": 'ri',
    "06": 'ri',
    "07": 'ri',
    "08": 'ri',
    "09": 'ri',
    "10": 'ri',
    "11": 'ri',
    "12": 'ri',
    "13": 'ri',
    "14": 'ri',
    "15": 'ri',
    "16": 'ri',
    "17": 'ri',
    "18": 'ri',
    "19": 'ri',
    "20": 'inc',
    "21": 'inc',
    "30": 'ri',
    "31": 'ri',
    "32": 'ri',
    "60": 'ri',
    "61": 'ri',
    "62": 'ri',
    "63": 'ri',
    "64": 'ri',
    "65": 'ri',
}

isJoinCopy = {
    "01": 1,
    "02": 1,
    "03": 1,
    "04": 1,
    "05": 1,
    "50": 1,
    "51": 1,
    "06": 1,
    "07": 1,
    "08": 1,
    "09": 1,
    "10": 1,
    "11": 1,
    "12": 1,
    "13": 1,
    "14": 1,
    "15": 1,
    "16": 1,
    "17": 1,
    "18": 1,
    "19": 1,
    "20": 1,
    "21": 1,
    "30": 1,
    "31": 1,
    "32": 1,
    "40": 1,
    "41": 1,
    "42": 1,
    "60": 1,
    "61": 1,
    "62": 1,
    "63": 1,
    "64": 1,
    "65": 1,
}

isJoinBF = {
    "01": 1,
    "02": 1,
    "03": 1,
    "04": 1,
    "05": 1,
    "50": 1,
    "51": 1,
    "06": 1,
    "07": 1,
    "08": 1,
    "09": 1,
    "10": 1,
    "11": 0,
    "12": 1,
    "13": 0,
    "14": 1,
    "15": 0,
    "16": 0,
    "17": 1,
    "18": 0,
    "19": 0,
    "20": 1,
    "21": 0,
    "30": 0,
    "31": 0,
    "32": 0,
    "40": 1,
    "41": 1,
    "42": 1,
    "60": 0,
    "61": 0,
    "62": 0,
    "63": 0,
    "64": 0,
    "65": 0,
}

PREFIX = 'synt'
GPROM_BIN = '/home/perm/pengyuan/gprom_f/gprom/src/command_line/gprom'
PSQL_BIN = '/home/perm/pengyuan/post16/installed/bin/psql'

# log
def log(msg):
    print(msg)

def logfat(msg, other=""):
    log(80 * "=" + "\n" + msg + "\n" + 80 * "=" + "\n" + other)

def getQueryDir(q):
    return f"{os.getcwd()}/q{q}"
'''
def run_gprom_store_output(gprom_opts, inf, outf, repetitions):
    qFileOpt = ["-queryFile", f'{inf}']
    cmd = [ options.gprom ]  + gprom_opts + qFileOpt
    log("run gprom_store_output cmd: " + str(cmd) + "\n")

    try:
        with open(outf, 'w') as f:
            process = subprocess.run(cmd, stdout=f, stderr=subprocess.PIPE, universal_newlines=True)
        rt = process.returncode
        if rt:
            log("error code: " + str(rt) + "\n")
            log(f'error running commands from {inf} and storing result in {outf} using command line:\n{cmd}\n')
        return (rt, process.stderr)
    except Exception as e:
        return (-1, f"error writing GProM results to file:\n{e}")
    with open(outf, 'w') as f:
        for i in range(repetitions):

'''

def run_gprom_store_output(gprom_opts, inf, outf, repetitions):
    qFileOpt = ["-queryFile", f'{inf}']
    cmd = [ options.gprom ]  + gprom_opts + qFileOpt
    log("run gprom_store_output cmd: " + str(cmd) + "\n")

    for i in range(repetitions):
        if i == 0:
            log(f'{i} of {repetitions}')
            try:
                with open(outf, 'w') as f:
                    process = subprocess.run(cmd, stdout=f, stderr=subprocess.PIPE, universal_newlines=True)
                rt = process.returncode
                if rt:
                    log("error code: " + str(rt) + "\n")
                    log(f'error running commands from {inf} and storing result in {outf} using command line:\n{cmd}\n')
                    return (rt, process.stderr)
            except Exception as e:
                return (-1, f"error writing GProM results to file:\n{e}")
        else:
            log(f'{i} of {repetitions}')
            try:
                with open(outf, 'a') as f:
                    process = subprocess.run(cmd, stdout=f, stderr=subprocess.PIPE, universal_newlines=True)
                rt = process.returncode
                if rt:
                    log("error code: " + str(rt) + "\n")
                    log(f'error running commands from {inf} and storing result in {outf} using command line:\n{cmd}\n')
                    return (rt, process.stderr)
            except Exception as e:
                return (-1, f"error writing GProM results to file:\n{e}")

def generate_rewrite_query_file(q):
    log("generate_rewirte_query_file")
    qDir = getQueryDir(q)

    # read partitions;
    psAttrs = options.psAttrs[q]
    partitions = ''
    tblIdx = 0;
    for table in options.tables[q]:
        rangeFile = f"{qDir}/{table}partition"
        rangeFileR = open(rangeFile, 'r')
        lines = rangeFileR.readlines()
        rangeFileR.close()
        ranges = ''.join([line.strip() for line in lines])
        if tblIdx > 0:
            partitions = (partitions + ', ' + table + '(' + psAttrs[tblIdx] +' ' + ranges +')')
        else:
            partitions = (partitions + table + '(' + psAttrs[tblIdx] +' ' + ranges +')')
        tblIdx = tblIdx + 1
    #  log(partitions)

    # read query;
    qFile= f"{qDir}/query"
    qFileR = open(qFile, 'r')
    qLines = qFileR.readlines()
    qFileR.close()
    query = ''.join([line.strip() for line in qLines])
    # log(query)

    # build capture query and write to file
    captureQ = 'CAPTURE PROVENANCE WITH COARSE GRAINED RANGESB (' + partitions + ') OF (' + query + ');'
    captureFileName = f"{qDir}/recapFile.sql"
    captureQueryFile = open(captureFileName, 'w')
    captureQueryFile.write(captureQ)
    captureQueryFile.close()
    #  log(partitions)



def generate_rewrite_query(q, inf, outf):
    log("generate_rewrite_query")
    repetitions = 1
    gprom_options = ['-backend', 'postgres', '-host', f'{options.host}', '-user', f'{options.user}', '-passwd', f'{options.password}', '-port', f'{str(options.port)}', '-db', f'{options.db}', '-loglevel', '0', '-Pexecutor','sql', '-ps_binary_search', 'TRUE']
    # (rt, err) = run_gprom_store_output(gprom_options, inf, outf, repetitions)
    run_gprom_store_output(gprom_options, inf, outf, repetitions)
    #if rt:
    #    log(f"error generating rewritting SQL for for {q} [{rt}]:\n{err}")


def get_shell_command_results(cmd):
    process = subprocess.run(cmd,
                             stdout=subprocess.PIPE,
                             stderr=subprocess.PIPE,
                             universal_newlines=True)
    return (process.returncode, process.stdout.strip(), process.stderr.strip())

def psql_connection_args():
    return [ '-h', options.host, '-U', options.user, '-d', options.db, '-p', str(options.port) ]


def psql_read_file_as_list(cmd):
    # return ['/Users/pengyuanli/postgresql/installed/bin/psql'] + psql_connection_args() + [ "-c", "\\timing on" ] + [ '-f', cmd ]
    return [ options.psql ] + psql_connection_args() + [ "-c", "\\timing on" ] + [ '-f', cmd ]

def psql_file_to_string(f):
    cmd = psql_read_file_as_list(f)
    log("run sql : " + str(cmd) + "\n")
    #log(f'run PSQL: {" ".join(cmd)}\n')
    return get_shell_command_results(cmd)

def psql_time(infile, outfile, repetitions):
     with open(outfile, "w") as f:
        for i in range(repetitions):
            log(f"ITERATION: {i+1} of {repetitions}")
            (rt,out,err) = psql_file_to_string(infile)
            if rt:
                log(f"error timing command with psql [{rt}]:\n{err}\n{out}")
                exit(rt)
            log(out[0:min(len(out), 1000)])
            match = re.search("Time: ([0-9.]+)", out)
            if match:
                t = match.group(1)
                log(f"took {t} ms")
                f.write(t + "\n")
            else:
                f.write("NaN\n")

def gprom_time(infile, outfile, repetitions, direcDelta, updateTable, deltaTable, selectionPushDown, isJoinCopy, isJoinBF, updIdent, queryName):
    gprom_options = ['-backend', 'postgres', '-host', f'{options.host}', '-user', f'{options.user}', '-passwd', f'{options.password}', '-port', f'{str(options.port)}', '-db', f'{options.db}', '-loglevel', '0', '-Pexecutor','sql', '-ps_binary_search', 'TRUE', '-update_ps_direct_delta', 'TRUE', '-update_ps_updated_table', str(updateTable), '-update_ps_delta_table', str(deltaTable), '-timing', '-update_ps_selection_push_down', f'{selectionPushDown}', '-update_ps_copy_delta_join', 'TRUE', '-update_ps_join_using_bf', f'{isJoinBF}', '-update_ps_delta_table_updident', f'{updIdent}', '-update_ps_query_name', f'{queryName}']
    run_gprom_store_output(gprom_options, infile, outfile, repetitions)
'''
./src/command_line/gprom -host 127.0.0.1 -db joins -port 5432 -user pengyuanli -passwd test -log -loglevel 4  -sql "UPDATEPS PROVENANCE WITH COARSE GRAINED RANGESB (jo1 (a 1, 3, 100, 400, 100000000)) OF (select a from jo1 join jo2 on(a = x));" -Pexecutor sql -backend postgres -update_ps_option 1 -update_ps_group_join FALSE -ps_binary_search TRUE -Loperator_verbose TRUE -update_ps_selection_push_down TRUE -timing -update_ps_copy_delta_join TRUE -update_ps_join_using_bf TRUE -update_ps_delta_table dtwolevels -update_ps_updated_table twolevels -update_ps_direct_delta TRUE -update_ps_delta_table_updident updident -update_ps_query_name bf15
'''


def psql_run(sql):
    # cmd =(f'/Users/pengyuanli/postgresql/installed/bin/psql -h {options.host} -U {options.user} -d {options.db} -p {options.port} -c'.split(" ") + [f'{sql}'])
    cmd =(f'{options.psql} -h {options.host} -U {options.user} -d {options.db} -p {options.port} -c'.split(" ") + [f'{sql}'])
    log("psql_run sql" + str(cmd) + "\n")
    (rt, out, err) = get_shell_command_results(cmd)
    if rt:
        log(f"error run sql: " + sql + "\n")
        exit(rt)

def incQ(q):
    print("incremental")
    qDir = getQueryDir(q)
    num = options.updateNum[q]

    selPushDownOpt = options.selectionPushDown[q]
    selectionPushDown = 'TRUE'
    if selPushDownOpt == 0:
        selectionPushDown = 'FALSE'

    isJoinCopyOpt = options.isJoinCopy[q]
    isJoinCopy = 'TRUE'
    if isJoinCopyOpt == 0:
        isJoinCopy = 'FALSE'
    isJoinBFOpt = options.isJoinBF[q]
    isJoinBF = 'TRUE'
    if isJoinBFOpt == 0:
        isJoinBF = 'FALSE'
    deltaTable = options.deltaTables[q]
    # rep
    repetitions = options.repetitions
    # get query
    queryFile = f"{qDir}/query"
    queryFileR = open(queryFile, 'r')
    qLines = queryFileR.readlines()
    query = ''.join([line.strip() for line in qLines])

    psAttrs = options.psAttrs[q]
    partitions = ''
    tblIdx = 0;
    for table in options.tables[q]:
        rangeFile = f"{qDir}/{table}partition"
        rangeFileR = open(rangeFile, 'r')
        lines = rangeFileR.readlines()
        rangeFileR.close()
        ranges = ''.join([line.strip() for line in lines])
        if tblIdx > 0:
            partitions = (partitions + ', ' + table + '(' + psAttrs[tblIdx] +' ' + ranges +')')
        else:
            partitions = (partitions + table + '(' + psAttrs[tblIdx] +' ' + ranges +')')
        tblIdx = tblIdx + 1

    # restore table ;
    log("restore table for incremental update\n")
    truncateSQL = "TRUNCATE " + f"{options.tables[q][0]}"
    restoreSQL = "INSERT INTO " + f"{options.tables[q][0]}" + " SELECT * FROM " + f"{options.tables[q][0]}" + "_backup"
#    psql_run(truncateSQL)
#    psql_run(restoreSQL)

    # build delta table and update sql
    # delta table: r_upd1
    for n in range(1, num + 1, 1):
        # This is a dummy sql;
        # updateSQL = f'delete from {options.tables[q][0]} where a = 1'

        # build incremental gprom query;
        # incSQL = f'UPDATEPS({updateSQL}) PROVENANCE WITH COARSE GRAINED RANGESB({partitions}) OF({query});'
        incSQL = f'UPDATEPS PROVENANCE WITH COARSE GRAINED RANGESB({partitions}) OF({query});'
        #log(incSQL)

        incSQLFile = open(f"{qDir}/inc_{n}.sql", 'w')
        incSQLFile.write(incSQL)
        incSQLFile.close()

    # run inc query
    for n in range (1, num + 1, 1):
        inf = (f"{qDir}/inc_{n}.sql")
        outf = (f"{options.resultdir}/runtime_incre_{q}_update{n}.csv")
        gprom_time(inf, outf, 10, 'TRUE', f"{options.tables[q][0]}", f"{deltaTable}_upd_{n}", f'{selectionPushDown}', f'{isJoinCopy}', f'{isJoinBF}', 'updident', f'{PREFIX}_{q}')

'''
def gprom_time(infile, outfile, repetitions, direcDelta, updateTable, deltaTable, selectionPushDown, isJoinCopy, isJoinBF, updIdent):
./src/command_line/gprom -host 127.0.0.1 -db joins -port 5432 -user pengyuanli -passwd test -log -loglevel 4  -sql "UPDATEPS PROVENANCE WITH COARSE GRAINED RANGESB (jo1 (a 1, 3, 100, 400, 100000000)) OF (select a from jo1 join jo2 on(a = x));" -Pexecutor sql -backend postgres -update_ps_option 1 -update_ps_group_join FALSE -ps_binary_search TRUE -Loperator_verbose TRUE -update_ps_selection_push_down TRUE -timing -update_ps_copy_delta_join TRUE -update_ps_join_using_bf TRUE -update_ps_delta_table dtwolevels -update_ps_updated_table twolevels -update_ps_direct_delta TRUE -update_ps_delta_table_updident updident -update_ps_query_name bf15
'''

def recQ(q):
    qDir = getQueryDir(q);
    repetitions = options.repetitions
    qRecapSQL = f"{qDir}/recap.sql"

    # check if there is recap sql
    if not os.path.exists(qRecapSQL):
        qRecapSQLFile = f"{qDir}/recapFile.sql"
        if not os.path.exists(qRecapSQLFile):
            generate_rewrite_query_file(q)
        generate_rewrite_query(q, qRecapSQLFile, qRecapSQL)

    # run recap query;
    #updi = 'r' + q
    #num = options.updateNum[q]
    num = 1 

    inf = f'{qDir}/recap.sql'
    outf = options.resultdir + '/' + f"runtime_recap_{q}.csv"
    psql_time(inf, outf, 15)
    if True:
        return

    for n in range(1, num+1, 1):
        #  updateFile = f"{qDir}/update" + str(n) + ".sql"
        #log(updateFile)
        # restore table
        truncateSQL = "TRUNCATE " + f"{options.tables[q][0]}"
        log("truncate table: " + truncateSQL)
        restoreSQL = "INSERT INTO " + f"{options.tables[q][0]}" + " SELECT * FROM " + f"{options.tables[q][0]}" + "_backup"
        log("restore table: " + restoreSQL)
        # run recap;

        #  updateFileR = open(updateFile, 'r')
        #  lines = updateFileR.readlines()
        #  updateFileR.close()
        #  updateSQL = ''.join([line.strip() for line in lines])
        oriT = f'{options.tables[q][0]}'

        updT = f'{options.deltaTables[q]}_upd_{n}'
        updateSQL = f'delete from {oriT} where exists(select * from {updT} where {oriT}.a = {updT}.a and {oriT}.b = {updT}.b and {oriT}.c = {updT}.c and {oriT}.d = {updT}.d and {oriT}.e = {updT}.e and {oriT}.f = {updT}.f and {oriT}.g = {updT}.g and {oriT}.h = {updT}.h and {oriT}.i = {updT}.i and {oriT}.j = {updT}.j and {updT}.updident = -1)'

        updateSQL1 = f'delete from {oriT} where exists(select * from {updT} where {oriT}.a = {updT}.a and {oriT}.b = {updT}.b and {oriT}.c = {updT}.c and {oriT}.d = {updT}.d and {oriT}.e = {updT}.e and {oriT}.f = {updT}.f and {oriT}.g = {updT}.g and {oriT}.h = {updT}.h and {oriT}.i = {updT}.i and {oriT}.j = {updT}.j and {updT}.updident = 1)'
        att = ''
        if oriT == 'r500':
            att = f'{r500}'
        elif oriT == 't1gbjoin' :
            att = f'{t1gbjoin}'
        elif oriT == 't1gb1000g':
            att = f'{t1gb1000g}'
        elif oriT == 't1gb5000g':
            att = f'{t1gb5000g}'
        elif oriT == 't1gb500000g':
            att = f'{t1gb500000g}'
        updateSQL2 = f'insert into {oriT} select {att} from {updT} where updident = 1'
        log("update sql " + updateSQL)

#        psql_run(truncateSQL)
#        psql_run(restoreSQL)
#        psql_run(updateSQL)
#        psql_run(updateSQL1)
#        psql_run(updateSQL2)

        inf = f'{qDir}/recap.sql'
        outf = options.resultdir + '/' + f"runtime_recap_{q}_update{n}.csv"
        psql_time(inf, outf, repetitions)


def recincQ(q):
    incQ(q)
    recQ(q)


def process_one_query(q):
    qDir = getQueryDir(q)

    if not os.path.exists(qDir):
        log(f"missing directory {qDir}")
    #  exit(1)
    updateApproach = options.updateType[q]
    if updateApproach == 'ri':
        log('incremental and recapture \n')
        recincQ(q)
    elif updateApproach == 'rec':
        log("only recapture \n")
        recQ(q)
    elif updateApproach == 'inc':
        log("only incremental \n")
        incQ(q)

def main(args):
    global options
    options = args

    options.queries = options.queries.strip().split(",") if options.queries else queries
    options.tables = options.tables.strip().split(",") if options.tables else captureTables
    options.psAttrs = options.psAttrs.strip().split(",") if options.psAttrs else psAttrs
    options.updateNum = options.updateNum.strip().split(",") if options.updateNum else updateNum
    options.selectionPushDown = options.selectionPushDown.strip().split(",") if options.selectionPushDown else selectionPushDown
    options.updateType = options.updateType.strip().split(",") if options.updateType else updateType
    options.isJoinCopy = options.isJoinCopy.strip().split(",") if options.isJoinCopy else isJoinCopy
    options.isJoinBF = options.isJoinBF.strip().split(",") if options.isJoinBF else isJoinBF
    options.deltaTables = options.deltaTables.strip().split(",") if options.deltaTables else deltaTables
    if not os.path.exists(options.resultdir):
        os.mkdir(options.resultdir)
    for q in options.queries:
        logfat(f"process query q{q}")
        incQ(q)
###        # process_one_query(q)
#    for q in options.queries:
#        logfat(f"process query q{q}")
        recQ(q)
#



if __name__ == '__main__':
    ap = argparse.ArgumentParser(description = 'Running Experiments For Incremental Updating Provenance Sketch')

    # log setting;
    ap.add_argument("-l", "--loglevel", type=int, default=0,
                    help="log level to use when debuging")
    # db setting
    ap.add_argument('-d', '--db', type=str, default='dbsync',
                    help='database name')
    ap.add_argument("-H", "--host", type=str, default="127.0.0.1",
                    help="database host")
    ap.add_argument("-u", "--user", type=str, default="perm",
                    help="database name")
    ap.add_argument("-P", "--password", type=str, default="test",
                    help="database password")
    ap.add_argument("-p", "--port", type=int, default=5455,
                    help="database port")
    ap.add_argument('--psql', type=str, default=PSQL_BIN, help="use this psql binary")
    # file setting;
    ap.add_argument('-o', '--overwrite', action='store_true',
                    help="overwrite existing files")
    # queries setting;
    ap.add_argument('-q', "--queries", type=str, default=None,
                    help=f"run only this query(default is to run all)")
                    #help=f"run only this query(default is to run all:{queries.keys()})")
    # gprom setting;
    ap.add_argument('--gprom', type=str, default=GPROM_BIN, help="use this gprom binary")
    # result setting;
    ap.add_argument('-R', '--resultdir', type=str, default='results',
                    help="store results in this folder")
    # update provenance sketch setting;
    ap.add_argument('-O', "--only", type=str, default='ri',
                    help="only execute only listed steps (rec(apture), inc(remental), recinc) separated by comma")
    ap.add_argument('-T', '--tables', type=str, default=None,
                    help="only capture provenance (or apply other steps) for these tables")
    ap.add_argument('-A', '--psAttrs', type=str, default=None,
                    help="only capture provenance (or apply other steps) for these tables")
    ap.add_argument('-C', '--updateNum', type=str, default=None,
                    help="update statement numbers for this query")
    ap.add_argument('-r', '--repetitions', type=int, default=30,
                    help="repetition for running")
    ap.add_argument('-s', '--selectionPushDown', type=int, default=0,
                    help="selection push down")
    ap.add_argument('-z', '--updateType', type=int, default=0,
                    help="update type")
    ap.add_argument('-j', '--isJoinCopy', type=int, default= 0,
                    help='copy join delta to DB')
    ap.add_argument('-B', '--isJoinBF', type=int, default=0,
                    help='indicate is we use bloom filter to pre check join attributes')
    ap.add_argument('-X', '--deltaTables', type=str, default=None,
                    help='indicate deltatable name')
    args = ap.parse_args()

    main(args)
