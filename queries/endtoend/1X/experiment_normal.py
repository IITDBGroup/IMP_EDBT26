import os
import argparse
import re
import sys
import subprocess
from dataclasses import dataclass
from typing import List
from math import ceil

# 01: 1U-5Q
# 02: 5U-1Q
# 03: 1U-1Q
queries = [
    "01",
    "02",
    "03",
]
updateNum = {
    "01": 1000,
    "02": 1000,
    "03": 1000,
}

tbls = {
    '01': 'edb1',
    '02': 'edb1',
    '03': 'edb1',
}

deltaTables = {
    "01" : "etoe_q1",
    "04" : "etoe_q1",
    "05" : "etoe_q1",

    "02" : "etoe_q2",
    "06" : "etoe_q2",
    "07" : "etoe_q2",

    "03" : "etoe_q2",
    "08" : "etoe_q2",
    "09" : "etoe_q2",
}

captureTables = {
    "01": ['edb1'],
    "02": ['edb1'],
    "03": ['edb1'],
}

psAttrs = {
    "01": ['a'],
    "02": ['a'],
    "03": ['a'],
}



selectionPushDown = {
    "01": 1,
    "04": 1,
    "05": 1,

    "02": 1,
    "06": 1,
    "07": 1,

    "03": 1,
    "08": 1,
    "09": 1,
}

updateType = {
    "01": 'ri',
    "04": 'ri',
    "05": 'ri',

    "02": 'ri',
    "06": 'ri',
    "07": 'ri',

    "03": 'ri',
    "08": 'ri',
    "09": 'ri',
}

isJoinCopy = {
    "01": 1,
    "04": 1,
    "05": 1,

    "02": 1,
    "06": 1,
    "07": 1,

    "03": 1,
    "08": 1,
    "09": 1,
}

isJoinBF = {
    "01": 1,
    "04": 1,
    "05": 1,

    "02": 1,
    "06": 1,
    "07": 1,

    "03": 1,
    "08": 1,
    "09": 1,
}

partitionSize = {
    "01": 1000,
    "02": 1000,
    "03": 1000,
}


IS_TEST = False
GPROM_BIN = '/home/oracle/pengyuan/gproms/gprom/src/command_line/gprom'
PSQL_BIN = '/home/oracle/pengyuan/postgres16/installed/bin/psql'
################################################################################
# utils# log
def log(msg):
    print(msg)

def logfat(msg, other=""):
    log(80 * "=" + "\n" + msg + "\n" + 80 * "=" + "\n" + other)


def logOut(msg):
    fff = open('runlogs', 'a')
    fff.write(msg + '\n')
    fff.close()

def getQueryDir(q):
    return f'{os.getcwd()}/q{q}'
####
def get_shell_command_results(cmd):
    process = subprocess.run(cmd,
                             stdout=subprocess.PIPE,
                             stderr=subprocess.PIPE,
                             universal_newlines=True)
    return (process.returncode, process.stdout.strip(), process.stderr.strip())

def psql_connection_args():
    return [ '-h', options.host, '-U', options.user, '-d', options.db, '-p', str(options.port) ]

####  build cmd line
####  'cmd' is the input file
def psql_read_file_as_list(cmd):
    return [ options.psql ] + psql_connection_args() + [ "-c", "\\timing on" ] + [ '-f', cmd ]
####
def psql_file_to_string(f):
    cmd = psql_read_file_as_list(f)
    cc = ''
    for stt in cmd:
        cc += (stt + " ")
    log("run sql : " + cc + "\n")
    #log(f'run PSQL: {" ".join(cmd)}\n')
    return get_shell_command_results(cmd)

##### run psql to get time;
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

def psql_run(sql):
    cmd =(f'{options.psql} -h {options.host} -U {options.user} -d {options.db} -p {options.port} -c'.split(" ") + [f'{sql}'])
    log("psql_run sql" + str(cmd) + "\n")
    (rt, out, err) = get_shell_command_results(cmd)
    if rt:
        log(f"error run sql: " + sql + "\n")
        exit(rt)
################################################################################
### Normal Run
# param q: str, QorU: 'Q'/'U', qSeriesNumber: str
def normalRun(q, QorU, qSeriesNumber):
    qDir = getQueryDir(q)
    infile = f'{qDir}/nor_{qSeriesNumber}.sql'
    outfile = f'{options.resultdir}/runtime_normal_{q}_{qSeriesNumber}.csv'
    if QorU == 'Q':
        psql_time(infile, outfile, 10)
    else:
        psql_time(infile, outfile, 1)
################################################################################
### Main function
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

    totalQNum = 1000
    isRunNormal = False
    isRunCapReuse = False
    isRunIncremental = True

    for q in queries:
        tb = captureTables[q][0]
        if IS_TEST == False:
            psql_run(f"truncate {tb};")
            psql_run(f"insert into {tb} select * from {tb}_backup;")

        # normal;
        norIndicatorFile = f'norInfo{str(q)}'
        norIndFileContent = open(norIndicatorFile, 'r')
        norIndLines = norIndFileContent.readlines()
        for line in norIndLines:
            line = line.strip().split(':')[0]
            qinfo = line.strip().split('_')
            normalRun(q, qinfo[0], qinfo[1])











if __name__ == '__main__':
    ap = argparse.ArgumentParser(description = 'Running Experiments For Incremental Updating Provenance Sketch')

    # log setting;
    ap.add_argument("-l", "--loglevel", type=int, default=0,
                    help="log level to use when debuging")
    # db setting
    ap.add_argument('-d', '--db', type=str, default='dbendtoend',
                    help='database name')
    ap.add_argument("-H", "--host", type=str, default="127.0.0.1",
                    help="database host")
    ap.add_argument("-u", "--user", type=str, default="oracle",
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
    ap.add_argument('-r', '--repetitions', type=int, default=10,
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