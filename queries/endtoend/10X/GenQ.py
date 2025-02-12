import random


################################################################################
def genQInterval(qNum, bound, intervalW):
    intervals = []
    for i in range(qNum):
        start = random.randint(bound[0], bound[1] - 1)
        iW = random.randint(1, intervalW - 1)
        while start + iW > bound[1]:
            iW = random.randint(1, intervalW - 1)

        iS = []
        iS.append(start)
        iS.append(start + iW)
        intervals.append(iS)
    return intervals

def bucketChecks2(bound, intervalW, qs, bucketSize):
    bucketUses = 0
    bucketCntMap = {}
    for interval in qs:
        start = interval[0]
        end = interval[1]
        offset = (int) ((start - bound[0]) / bucketSize)
        bucketStart = bound[0] + (int) (offset * bucketSize)

        bucketEnd = bucketStart
        while bucketEnd < end:
            bucketEnd += bucketSize;
        bucketUsed = (int) ((bucketEnd - bucketStart) / bucketSize)
        print("bStart: " + str(bucketStart) + ", bEnd: " + str(bucketEnd) + ", bUse:" + str(bucketUsed));
        key = f'{str(bucketStart)}#{str(bucketEnd)}'
        if key in bucketCntMap:
            cnt = bucketCntMap[key]
            bucketCntMap[key] = cnt + 1
        else:
            bucketCntMap[key] = 1
    print(str(bucketCntMap))
    bucketUses= len(bucketCntMap)
    return bucketUses

def bucketCheck(intervals, intervalW, bucketSize, bound):
    bucketsss = {}
    for i in range(len(intervals)):
        start = intervals[i][0]
        end = intervals[i][1]
        print(f'{str(start)}_{str(end)}')
        offset = (int) ((start - bound[0]) / bucketSize)

        bucketStart = bound[0] + (int) (offset * bucketSize)
        bucketEnd = bucketStart
        while bucketEnd < end:
            bucketEnd += bucketSize;

        bucketsss[i] = str(bucketStart) + "_" + str(bucketEnd)
    return bucketsss
################################################################################
# Utils
def writeGenToFile(qNum, fname, intervals, ibMap, noUsed):
    ff = open(fname, 'w')
    for i in range(qNum):
        intval = intervals[i]
        maps = ibMap[i]
        ins = (int) (intval[0])
        ine = (int) (intval[1])
        bmaps = maps.strip().split("_")
        bs = (int) (bmaps[0])
        be = (int) (bmaps[1])

        if bs > ins or be < ine:
            print(f'error: \t intval:{str(intval)}: bucket: {maps}')

        if maps in noUsed:
            continue
        ff.write(f'Q_{str(i + 1)}:{str(intval[0])}_{str(intval[1])}:{str(maps)}\n')

    ff.close()
################################################################################
################################################################################
################################################################################
################################################################################
def Gen():
    bound = [1600000, 1990000]
    bSize = 30000
    iW = 10000
    qNum = 1200
    intervals = genQInterval(qNum, bound, iW)
    IBmap = bucketCheck(intervals, iW, bSize, bound)
    bUses = bucketChecks2(bound, iW, intervals, bSize)
    # print(f"intervals: \n \t{str(intervals)}")
    # print(f"IBMap: \n \t{str(IBmap)}")
    # print(f"buse: \n \t{str(bUses)}")
    print(f"bUsed : {str(bUses)}")
    noUsed = ['1930000_1960000']
    writeGenToFile(qNum, 'Qinfos', intervals, IBmap, noUsed)

# if __name__ == '__main__':
    # Gen()