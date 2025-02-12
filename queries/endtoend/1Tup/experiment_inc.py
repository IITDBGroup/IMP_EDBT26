

import os
import argparse
import re
import sys
import subprocess
from dataclasses import dataclass
from typing import List
from math import ceil
import datetime
ranges = [1,61,123,187,250,308,368,426,482,540,595,660,717,776,832,894,951,1014,1076,1138,1202,1261,1320,1386,1445,1505,1565,1622,1680,1738,1794,1854,1917,1979,2035,2096,2161,2221,2281,2342,2408,2470,2527,2586,2643,2704,2763,2822,2876,2939,3000,3059,3119,3182,3239,3306,3365,3427,3489,3550,3610,3669,3726,3783,3839,3903,3960,4019,4077,4129,4188,4250,4310,4368,4434,4489,4549,4613,4675,4732,4794,4852,4916,4975,5041,5102,5158,5215,5271,5329,5398,5465,5525,5587,5644,5706,5767,5825,5883,5940,5999,6065,6127,6184,6244,6305,6367,6424,6482,6539,6602,6663,6726,6780,6839,6901,6961,7022,7083,7146,7208,7268,7327,7387,7443,7503,7562,7622,7681,7736,7801,7859,7915,7974,8029,8088,8150,8214,8272,8333,8391,8454,8511,8572,8634,8698,8755,8820,8879,8935,8997,9062,9122,9184,9242,9298,9359,9427,9489,9547,9608,9664,9727,9787,9840,9902,9962,10026,10080,10136,10197,10254,10314,10368,10423,10482,10546,10607,10667,10723,10786,10851,10906,10966,11029,11084,11149,11211,11269,11331,11392,11447,11509,11570,11631,11689,11750,11811,11876,11937,11995,12054,12113,12175,12238,12301,12361,12426,12483,12544,12607,12665,12726,12782,12840,12902,12960,13023,13080,13141,13203,13260,13323,13383,13445,13506,13564,13620,13679,13743,13797,13854,13915,13978,14037,14097,14159,14223,14280,14339,14400,14460,14519,14580,14641,14701,14765,14823,14891,14958,15021,15076,15137,15201,15261,15322,15385,15446,15505,15564,15626,15686,15740,15797,15856,15919,15982,16047,16105,16159,16224,16285,16344,16398,16452,16514,16569,16623,16687,16754,16814,16870,16926,16990,17050,17111,17166,17229,17287,17345,17404,17459,17517,17572,17637,17696,17755,17813,17879,17943,18005,18063,18125,18188,18246,18308,18367,18427,18484,18540,18599,18662,18723,18781,18842,18902,18967,19025,19090,19152,19204,19266,19323,19387,19453,19519,19576,19639,19698,19759,19819,19880,19945,20007,20070,20128,20188,20249,20314,20372,20433,20492,20553,20618,20682,20738,20798,20865,20921,20981,21050,21114,21175,21237,21296,21357,21421,21482,21542,21598,21657,21721,21783,21835,21895,21956,22011,22070,22131,22198,22255,22321,22378,22440,22498,22552,22608,22667,22723,22780,22831,22888,22950,23012,23073,23130,23187,23257,23311,23373,23436,23492,23547,23608,23665,23726,23780,23836,23893,23950,24007,24065,24123,24183,24236,24296,24355,24414,24473,24532,24594,24650,24710,24771,24832,24895,24956,25017,25080,25143,25207,25265,25329,25387,25454,25517,25581,25634,25688,25743,25806,25869,25935,25995,26052,26113,26172,26232,26294,26352,26410,26463,26522,26580,26643,26698,26753,26812,26875,26930,26988,27047,27112,27170,27228,27287,27349,27407,27466,27527,27585,27647,27702,27763,27818,27879,27934,28000,28057,28119,28181,28240,28300,28369,28434,28500,28559,28618,28674,28735,28794,28855,28910,28973,29037,29096,29159,29222,29280,29343,29404,29467,29521,29574,29633,29693,29754,29817,29882,29943,30005,30066,30134,30190,30242,30299,30356,30420,30479,30545,30603,30660,30720,30782,30846,30910,30969,31032,31093,31153,31214,31269,31325,31379,31436,31498,31560,31624,31684,31744,31804,31861,31920,31981,32041,32102,32159,32218,32280,32345,32409,32471,32531,32595,32651,32705,32764,32826,32882,32941,33009,33062,33120,33178,33240,33302,33363,33424,33485,33541,33597,33660,33723,33787,33847,33904,33962,34022,34077,34134,34189,34247,34302,34362,34421,34479,34541,34597,34657,34720,34773,34830,34885,34943,34999,35053,35115,35182,35243,35305,35363,35425,35483,35540,35600,35661,35721,35789,35844,35906,35964,36019,36083,36146,36203,36266,36331,36392,36452,36517,36577,36637,36690,36748,36811,36869,36934,36988,37048,37109,37175,37235,37294,37351,37409,37474,37527,37591,37656,37719,37784,37839,37901,37958,38019,38072,38142,38203,38257,38315,38379,38439,38511,38568,38625,38689,38747,38809,38870,38933,38991,39054,39114,39176,39237,39295,39357,39413,39475,39533,39597,39653,39720,39780,39837,39894,39955,40019,40080,40138,40202,40261,40320,40383,40442,40500,40560,40618,40672,40735,40795,40850,40909,40963,41020,41081,41136,41198,41259,41315,41378,41439,41503,41565,41631,41687,41743,41799,41855,41917,41976,42034,42092,42150,42209,42269,42326,42389,42451,42506,42567,42623,42691,42755,42818,42876,42940,42998,43055,43116,43175,43233,43292,43348,43403,43466,43525,43588,43643,43700,43766,43819,43878,43935,44001,44057,44120,44182,44241,44304,44361,44421,44486,44543,44597,44658,44719,44778,44837,44897,44960,45018,45073,45134,45198,45257,45312,45373,45434,45490,45550,45604,45663,45727,45783,45843,45901,45959,46024,46080,46138,46202,46264,46330,46389,46453,46514,46573,46631,46684,46741,46799,46867,46930,46990,47052,47109,47170,47229,47289,47350,47409,47465,47527,47588,47644,47705,47765,47832,47891,47954,48019,48080,48141,48204,48259,48324,48388,48446,48504,48561,48624,48684,48742,48799,48856,48913,48974,49038,49091,49154,49215,49280,49343,49407,49461,49518,49577,49635,49695,49757,49815,49880,49936,49994,50052,50110,50168,50222,50285,50348,50408,50471,50536,50592,50652,50711,50772,50829,50892,50952,51009,51075,51135,51195,51256,51315,51369,51429,51490,51550,51609,51666,51726,51789,51851,51911,51972,52036,52097,52155,52219,52281,52336,52399,52458,52521,52578,52636,52702,52763,52822,52879,52938,52987,53047,53100,53165,53220,53285,53344,53411,53474,53537,53594,53661,53727,53782,53841,53905,53966,54024,54087,54150,54211,54268,54323,54379,54445,54504,54562,54619,54675,54732,54788,54851,54919,54975,55035,55102,55160,55219,55283,55342,55405,55469,55535,55594,55650,55710,55769,55824,55884,55943,56003,56066,56126,56185,56247,56310,56377,56437,56499,56556,56613,56669,56732,56794,56853,56912,56972,57027,57090,57150,57216,57280,57342,57399,57466,57528,57588,57645,57710,57768,57829,57888,57947,58004,58063,58121,58183,58248,58306,58368,58426,58482,58544,58607,58671,58739,58798,58857,58920,58985,59037,59100,59158,59218,59279,59341,59402,59464,59520,59583,59639,59692,59755,59820,59881,59937,60001]
# 01: 1U-5Q
# 02: 5U-1Q
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

GPROM_BIN = '/home/oracle/pengyuan/gproms/gprom/src/command_line/gprom'
PSQL_BIN = '/home/oracle/pengyuan/postgres16/installed/bin/psql'
IS_TEST = False
PREFIX = 'tim01e1'
# log
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

def run_gprom_store_output(gprom_opts, inf, outf, repetitions):
    qFileOpt = ["-queryFile", f'{inf}']
    cmd = [ options.gprom ]  + gprom_opts + qFileOpt
    cc = ''
    for str in cmd:
        cc += (str + " ")
    log("run gprom_store_output cmd: " + cc + "\n")

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
    return [ options.psql ] + psql_connection_args() + [ "-c", "\\timing on" ] + [ '-f', cmd ]

def psql_file_to_string(f):
    cmd = psql_read_file_as_list(f)
    cc = ''
    for stt in cmd:
        cc += (stt + " ")
    log("run sql : " + cc + "\n")
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
'''
def gprom_time(infile, outfile, repetitions, direcDelta, updateTable, deltaTable, selectionPushDown, isJoinCopy, isJoinBF, updIdent, queryName):
    gprom_options = ['-backend', 'postgres', '-host', f'{options.host}', '-user', f'{options.user}', '-passwd', f'{options.password}', '-port', f'{str(options.port)}', '-db', f'{options.db}', '-loglevel', '0', '-Pexecutor','sql', '-ps_binary_search', 'TRUE', '-update_ps_direct_delta', 'TRUE', '-update_ps_updated_table', str(updateTable), '-update_ps_delta_table', str(deltaTable), '-timing', '-update_ps_selection_push_down', f'{selectionPushDown}', '-update_ps_copy_delta_join', 'TRUE', '-update_ps_join_using_bf', f'{isJoinBF}', '-update_ps_delta_table_updident', f'{updIdent}', '-update_ps_query_name', f'{queryName}']
    run_gprom_store_output(gprom_options, infile, outfile, repetitions)
'''
def gprom_time(infile, outfile, repetitions, direcDelta, updateTable, deltaTable, selectionPushDown, isJoinCopy, isJoinBF, updIdent, queryName, isDataStoreBack):
    if isDataStoreBack == 'FALSE':
        gprom_options = ['-backend', 'postgres', '-host', f'{options.host}', '-user', f'{options.user}', '-passwd', f'{options.password}', '-port', f'{str(options.port)}', '-db', f'{options.db}', '-loglevel', '0', '-Pexecutor','sql', '-ps_binary_search', 'TRUE', '-update_ps_direct_delta', 'TRUE', '-update_ps_updated_table', str(updateTable), '-update_ps_delta_table', str(deltaTable), '-timing', '-update_ps_selection_push_down', f'{selectionPushDown}', '-update_ps_copy_delta_join', 'TRUE', '-update_ps_join_using_bf', f'{isJoinBF}', '-update_ps_delta_table_updident', f'{updIdent}', '-update_ps_query_name', f'{queryName}', '-update_ps_store_new_state', f'{isDataStoreBack}']
        run_gprom_store_output(gprom_options, infile, outfile, repetitions)
    else:
        gprom_options = ['-backend', 'postgres', '-host', f'{options.host}', '-user', f'{options.user}', '-passwd', f'{options.password}', '-port', f'{str(options.port)}', '-db', f'{options.db}', '-loglevel', '0', '-Pexecutor','sql', '-ps_binary_search', 'TRUE', '-update_ps_direct_delta', 'TRUE', '-update_ps_updated_table', str(updateTable), '-update_ps_delta_table', str(deltaTable), '-update_ps_selection_push_down', f'{selectionPushDown}', '-update_ps_copy_delta_join', 'TRUE', '-update_ps_join_using_bf', f'{isJoinBF}', '-update_ps_delta_table_updident', f'{updIdent}', '-update_ps_query_name', f'{queryName}', '-update_ps_store_new_state', f'{isDataStoreBack}']
        run_gprom_store_output(gprom_options, infile, outfile, repetitions)


def gprom_time_batching(infile, outfile, repetitions, direcDelta, updateTable, deltaTable, selectionPushDown, isJoinCopy, isJoinBF, updIdent, queryName, isDataStoreBack, isBatch, batchStart, batchEnd):
    if isDataStoreBack == 'FALSE':
        gprom_options = ['-backend', 'postgres', '-host', f'{options.host}', '-user', f'{options.user}', '-passwd', f'{options.password}', '-port', f'{str(options.port)}', '-db', f'{options.db}', '-loglevel', '0', '-Pexecutor','sql', '-ps_binary_search', 'TRUE', '-update_ps_direct_delta', 'TRUE', '-update_ps_updated_table', str(updateTable), '-update_ps_delta_table', str(deltaTable), '-timing', '-update_ps_selection_push_down', f'{selectionPushDown}', '-update_ps_copy_delta_join', 'TRUE', '-update_ps_join_using_bf', f'{isJoinBF}', '-update_ps_delta_table_updident', f'{updIdent}', '-update_ps_query_name', f'{queryName}', '-update_ps_store_new_state', f'{isDataStoreBack}', '-update_ps_batching_update', 'TRUE', '-update_ps_begin_update_version', f'{str(batchStart)}', '-update_ps_end_update_version', f'{str(batchEnd)}']
        run_gprom_store_output(gprom_options, infile, outfile, repetitions)
    else:
        gprom_options = ['-backend', 'postgres', '-host', f'{options.host}', '-user', f'{options.user}', '-passwd', f'{options.password}', '-port', f'{str(options.port)}', '-db', f'{options.db}', '-loglevel', '0', '-Pexecutor','sql', '-ps_binary_search', 'TRUE', '-update_ps_direct_delta', 'TRUE', '-update_ps_updated_table', str(updateTable), '-update_ps_delta_table', str(deltaTable), '-update_ps_selection_push_down', f'{selectionPushDown}', '-update_ps_copy_delta_join', 'TRUE', '-update_ps_join_using_bf', f'{isJoinBF}', '-update_ps_delta_table_updident', f'{updIdent}', '-update_ps_query_name', f'{queryName}', '-update_ps_store_new_state', f'{isDataStoreBack}', '-update_ps_batching_update', 'TRUE', '-update_ps_begin_update_version', f'{str(batchStart)}', '-update_ps_end_update_version', f'{str(batchEnd)}']
        run_gprom_store_output(gprom_options, infile, outfile, repetitions)



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
    # print(infile)
    # print(outfile)
    if QorU == 'Q':
        psql_time(infile, outfile, 10)
        # x = 1
    else:
        psql_time(infile, outfile, 1)
        # x = 1

### Cap + Reuse
def capReuseRun(q, capIndFilePath):
    qDir = getQueryDir(q)
    capIndFile = open(capIndFilePath, 'r')
    capIndLines = capIndFile.readlines()
    capIndFile.close()
    seenBucket = {}
    for line in capIndLines:
        lines = line.strip().split(':')
        QorU = lines[0].strip().split('_')
        if QorU[0] == 'U':
            infile = f'{qDir}/nor_{QorU[1]}.sql'
            outfile = f'{options.resultdir}/runtime_normal_{q}_{QorU[1]}.csv'
            if IS_TEST == False:
                psql_time(infile, outfile, 1)
            seenBucket.clear()
            ffff=open('inforlog', 'a')
            ffff.write(f'q-{q}:U-{QorU[1]}:setLen:{str(len(seenBucket))}:CLEAR\n')
            ffff.close()

        else:
            bucketRanges = lines[2].strip()
            if bucketRanges in seenBucket:
                ffff=open('inforlog', 'a')
                ffff.write(f'q-{q}:Q-{QorU[1]}:setLen:{str(len(seenBucket))}:SEEN\n')
                ffff.close()
                # find the ps and reuse;
                reuseRun(q, line, bucketRanges)
            else:
                ffff=open('inforlog', 'a')
                ffff.write(f'q-{q}:Q-{QorU[1]}:setLen:{str(len(seenBucket))}:NOSEEN\n')
                ffff.close()
                # capture the ps and store;
                infileCap = f'./capFiles/cap_{bucketRanges}.sql'
                outfileCap =f'{options.resultdir}/runtime_capture_{q}_{QorU[1]}.csv'
                if IS_TEST == True:
                    psql_time(infileCap, outfileCap, 1)
                else:
                    psql_time(infileCap, outfileCap, 10)
                with open(f'./psFiles/ps_{bucketRanges}', 'w') as ff:
                    (rt,out,err) = psql_file_to_string(infileCap)
                    ff.write(out)
                reuseRun(q, line, bucketRanges)

def reuseRun(q, indLine, bucketRanges):
    lines = indLine.strip().split(':')
    QorU = lines[0].strip().split('_')
    bucketRanges = lines[2].strip()
    psFile = f'./psFiles/ps_{bucketRanges}'
    (whereClause, psCnt, psClauster) = readProvSketchAndBuildConditionListAndBuildWhereClause(q, psFile)
    if IS_TEST == True:
        print(f'where clause: {whereClause}')
    AvgLeftAndRight = lines[1].strip().split('_')
    query = buildReuseQuery(whereClause, str(AvgLeftAndRight[0].strip()), str(AvgLeftAndRight[1].strip()))
    reuseFile = f'./reuseFiles/reuse_{q}_{bucketRanges}.sql'
    ff = open(reuseFile, 'w')
    ff.write(query)
    ff.close()
    infile = reuseFile
    outfile = f'{options.resultdir}/runtime_reuse_{q}_{QorU[1]}.csv'
    if IS_TEST:
        psql_time(infile, outfile, 1)
    else:
        psql_time(infile, outfile, 10)

### reuse
def readProvSketchAndBuildConditionListAndBuildWhereClause(q, psFile):
    if IS_TEST:
        print(f"psFile: {psFile}")
    ps = readProvSketchString(q, psFile)

    if IS_TEST:
        print(f'ps: {ps}')
    provAttr = options.psAttrs[q][0]
    if IS_TEST:
        print(f'provAttr: {provAttr}')

    (conditionList, psCnt, psClauster) = buildWhereConditions(provAttr, ranges, ps)

    whereClause = buildWhereClause(conditionList)
    return (whereClause, psCnt, psClauster)

def readProvSketchString(q, inf):
    f = open(inf, 'r')
    lines = f.readlines()
    f.close()
    provSketch = ''
    for line in lines:
        line = line.strip()
        if len(line) == partitionSize[q]:
            isPS = True
            for ch in line:
                if ch != '0' and ch != '1':
                    isPS = False
                    break
            if isPS == True:
                provSketch = line

    return provSketch

def buildWhereConditions(psAttr, ranges, ps):
    psCnt = 0
    psClauster = 0
    conditionList = []
    startPos = -1
    count = 0
    for i in range(len(ps)):
        if ps[i] == '1':
            psCnt += 1
            if startPos == -1:
                startPos = i
                count = 1
            else:
                count += 1
        else :
            if count > 0:
                startPar = ranges[startPos]
                endPar = ranges[startPos + count]
                cond = f'{psAttr} >= {startPar} and {psAttr} < {endPar}'
                conditionList.append(cond)
                count = 0
                psClauster += 1
            startPos = -1
        if i == len(ps) - 1:
            if count > 0:
                startPar = ranges[startPos]
                endPar = ranges[startPos + count]
                cond = f"{psAttr} >= {startPar} and {psAttr} < {endPar}"
                conditionList.append(cond)
                psClauster += 1

    return (conditionList, psCnt, psClauster)

def buildWhereClause(conditionList):
    if len(conditionList) == 1:
        return f'({conditionList[0]})'

    WHERE = '('
    for i in range(len(conditionList)):
        if i > 0:
            WHERE += ' OR '
        WHERE += f'({conditionList[i]})'
    WHERE += ')'

    return WHERE

def buildReuseQuery(whereClause, left, right):
    q = f'select a, avg(c) as ac from edb1 where {whereClause} group by a having avg(c) > {left} and avg(c) < {right};'
    return q

def appendToFile(file, content):
    ff = open(file, 'a')
    ff.write(content + "\n")
    ff.close()


### incremental run
def incrementalRun(q, incIndFilePath):
    auxFile = f'seq_{q}'
    if IS_TEST == False:
        psql_run(f'create table if not exists {PREFIX}_delta_{q} as select * from edb1_backup limit 1;')
        psql_run(f'truncate {PREFIX}_delta_{q};')
        psql_run(f'alter table {PREFIX}_delta_{q} add column if not exists updident int;')
        psql_run(f'alter table {PREFIX}_delta_{q} add column if not exists updateversion int;')
        # psql_run(f'truncate {PREFIX}_delta_{q};')
    appendToFile(auxFile, f'create table if not exists {PREFIX}_delta_{q} as select * from edb1_backup limit 1;')
    appendToFile(auxFile, f'truncate {PREFIX}_delta_{q};')
    appendToFile(auxFile, f'alter table {PREFIX}_delta_{q} add column if not exists updident int;')
    appendToFile(auxFile, f'alter table {PREFIX}_delta_{q} add column if not exists updateversion int;')

    selectionPushDown = 'TRUE'
    isJoinCopy = 'TRUE'
    isJoinBF = 'TRUE'

    qDir = getQueryDir(q)
    incFile = open(incIndFilePath, 'r')
    incLines = incFile.readlines()
    incFile.close()

    incFile = open(incIndFilePath, 'r')
    incLinesBackup = incFile.readlines()
    incFile.close()
    needIncUpdate = set()
    #for two q between updates, they share the same ps;
    needIncBeforeUpdate = {}
    needIncForUpdateList = {}
    for line in incLines:
        incLine = line.strip()
        lineCells = incLine.strip().split(':')
        QorU = lineCells[0].strip().split("_")
        appendToFile(auxFile, f'OPERATION: {QorU[1]}')
        if lineCells[0][0] == 'U':
            updNum = lineCells[0][2:]
            updNumVal = updNum.strip()

            updWhich = lineCells[1].strip()

            # batch insert into delta;
            batchFile = f'./batchFiless/{q}_U_{updNumVal}.sql'
            bfOpen = open(batchFile, 'w')
            if updWhich[0] == '-':
                # bfOpen.write(f'insert into {PREFIX}_delta_{q} select *, -1, {updNumVal} from edb1 where a = {updWhich[1:]};\n')
                bfOpen.write(f'insert into {PREFIX}_delta_{q} select *, -1, {updNumVal} from edb1 where id = {updWhich[1:]};\n')
                appendToFile(auxFile, f'     insert into {PREFIX}_delta_{q} select *, -1, {updNumVal} from edb1 where id = {updWhich[1:]};\n')
            else:
                bfOpen.write(f'insert into {PREFIX}_delta_{q} select *, 1, {updNumVal} from edb1_backup where id = {updWhich[1:]};\n')
                # bfOpen.write(f'insert into {PREFIX}_delta_{q} select *, 1, {updNumVal} from edb1 where a = {updWhich[1:]};\n')
                # appendToFile(auxFile, f'     insert into {PREFIX}_delta_{q} select *, 1, {updNumVal} from edb1_backup where a = {updWhich[1:]};\n')
                appendToFile(auxFile, f'     insert into {PREFIX}_delta_{q} select *, 1, {updNumVal} from edb1_backup where id = {updWhich[1:]};\n')
            bfOpen.close()

            batchRunOutFile = f'{options.resultdir}/runtime_batch_{q}_U_{updNumVal}.csv'

            if IS_TEST == False:
                psql_time(batchFile, batchRunOutFile, 1)


            # add each bRange list an update value;

            setIncUpdatess = ''
            for key in needIncUpdate:
                needIncBeforeUpdate[key] = True
                needIncForUpdateList[key].append((int) (updNumVal))
                setIncUpdatess += f'  {key}'

            appendToFile(auxFile, '     ' + setIncUpdatess)
            appendToFile(auxFile, '     ' + f' add operation number: {updNumVal}: a = {updWhich[1:]}')
            updInfile = f'{qDir}/nor_{QorU[1]}.sql'
            updOutfile = f'{options.resultdir}/upd_dummy.csv'
            if IS_TEST == False:
                psql_time(updInfile, updOutfile, 1)

            appendToFile(auxFile, f'     update db')
        else:
            CorU = lineCells[3]
            bRange = lineCells[2].strip()
            if CorU == 'C':
                needIncUpdate.add(bRange)
                appendToFile(auxFile, f'     add to already seen')
                # build stats for inc query;
                incInfile = f'./incFiles/inc_{bRange}.sql'
                incOutfile = f'{options.resultdir}/runtime_incre_FIRST_{q}_{QorU[1]}.csv'
                deltaTblName = 'delta_general'
                storeName = f'{PREFIX}_{q}_{bRange}'
                if IS_TEST == False:
                    gprom_time(incInfile, incOutfile, 1, 'TRUE', f"{options.tables[q][0]}", f"{deltaTblName}", f'{selectionPushDown}', f'{isJoinCopy}', f'{isJoinBF}', 'updident', f'{storeName}', 'FALSE')

                appendToFile(auxFile, f'        build STATE for {bRange}')
                # this is false, due to no update, no inc update,
                needIncBeforeUpdate[bRange] = False

                appendToFile(auxFile, f'        add {bRange} to no need update before updates')
                # create a update version list for each range;
                needIncForUpdateList[bRange] = []
                appendToFile(auxFile, f'        build an empty upd list for {bRange}')


            elif CorU == 'U':
                if needIncBeforeUpdate[bRange] == False:
                    # only reuse, since we have this value, do nothing now.
                    appendToFile(auxFile, f'        no need to update inc')
                    continue;


                storeName = f'{PREFIX}_{q}_{bRange}'
                deltaTblName = f'{PREFIX}_delta_{q}'
                incInfile = f'./incFiles/inc_{bRange}.sql'
                incOutfile = f'{options.resultdir}/runtime_incre_{q}_{QorU[1]}.csv'

                batchStart = min(needIncForUpdateList[bRange])
                batchEnd = max(needIncForUpdateList[bRange])
                appendToFile(auxFile, f'     need update inc: {batchStart} to {batchEnd}')
                # since updated, need to refresh the list;
                needIncForUpdateList[bRange] = []
                appendToFile(auxFile, f'     {bRange} list to enpty')

                if IS_TEST == False:
                    gprom_time_batching(incInfile, incOutfile, 10, 'TRUE', f"{options.tables[q][0]}", f"{deltaTblName}", f'{selectionPushDown}', f'{isJoinCopy}', f'{isJoinBF}', 'updident', f'{storeName}', 'FALSE', 'TRUE', batchStart, batchEnd)

                incOutfile2 = f'{options.resultdir}/runtime_incre_{q}_{QorU[1]}_dmy.csv'
                if IS_TEST == False:
                    gprom_time_batching(incInfile, incOutfile2, 1, 'TRUE', f"{options.tables[q][0]}", f"{deltaTblName}", f'{selectionPushDown}', f'{isJoinCopy}', f'{isJoinBF}', 'updident', f'{storeName}', 'TRUE', 'TRUE', batchStart, batchEnd)


                # no need to inc update ps for queries use same ps between two updates.
                needIncBeforeUpdate[bRange] = False

                appendToFile(auxFile, f'        set to False when seen this range before update')

################################################################################
### Main function
def main(args):
    timefile = open('timeInfo', 'w')
    timefile.write(f'{datetime.datetime.now()};\n')
    timefile.close()

    seqFile = open('seq', 'w')
    seqFile.close()
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

    ffff = open('inforlog', 'w')
    ffff.close()
    totalQNum = 1000
    isRunNormal = False
    isRunCapReuse = False
    isRunIncremental = True
    # normal running
    if isRunNormal:
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

    # capture + reuse running
    if isRunCapReuse:
        for q in queries:
            tb = captureTables[q][0]

            if IS_TEST == False:
                psql_run(f"truncate {tb};")
                psql_run(f"insert into {tb} select * from {tb}_backup;")

            # cap + reuse;
            capIndFilePath = f'norInfo{str(q)}'
            capReuseRun(q, capIndFilePath)
    # incremental running
    if isRunIncremental:
        ffff = open('incinforlog', 'w')
        ffff.close()
        for q in queries:
            seqFile = open('seq_{q}', 'w')
            seqFile.close()
            tb = captureTables[q][0]
            if IS_TEST == False:
                psql_run(f"truncate {tb};")
                psql_run(f'select count(*) from {tb};')
                psql_run(f"insert into {tb} select * from {tb}_backup;")
                psql_run(f'select count(*) from {tb};')
            # return
            incIndFilePath = f'incInfo{str(q)}'
            incrementalRun(q, incIndFilePath)

    timefile = open('timeInfo', 'a')
    timefile.write(f'{datetime.datetime.now()};\n')
    timefile.close()




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






