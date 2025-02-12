import random



def genRandom(total, min, max):
    randList = []
    randSet = set()
    while True:
        randVal = (int) (random.randint(min, max))
        if randVal in randSet:
            continue
        randList.append(randVal)
        randSet.add(randVal)
        if len(randList) - 100 >= total:
            break

    # print(str(randList))
    randList = sorted(randList)

    # verify
    errorCount = 0
    errorIdxs = []
    for idx in range(1, len(randList), 1):
        if randList[idx] - randList[idx - 1] <= 150:
            errorCount += 1
            errorIdxs.append(idx)

    print(f'error count: {errorCount}')

    # remove error ones
    newRandList = []
    for idx in range(0, len(randList), 1):
        if idx in errorIdxs:
            continue
        else:
            newRandList.append(randList[idx])

    # reverify
    errorCount = 0
    errorIdxs = []
    for idx in range(1, len(newRandList), 1):
        if newRandList[idx] - newRandList[idx - 1] <= 150:
            errorCount += 1
            errorIdxs.append(newRandList[idx])

    print(f'error count: {errorCount}')

    with open('randlistV3.txt', 'w') as randF:
        for idx in range(len(randList)):
            if idx > 0:
                randF.write(',')
            randF.write(str(randList[idx]))
    # randList = sorted(randList)

    verifySet = set()
    DUPLICATE = False
    for val in randList:
        if val in verifySet:
            print("DUPLICATE")
            DUPLICATE = True
            break
    print(f"IS DUPLICATE CONTAINS: {DUPLICATE}")
    print(f'RAND LENGTH: {len(randList)}')
    # removeIdx = []
    # for idx in range(len(randList)):
        # if idx > 0:
            # print(rangeList[idx] - rangeList[idx - 1])
            # if randList[idx] - randList[idx - 1] <= 20:
                # removeIdx.append(idx)
                # print("idx: " + str(idx))

def genSeq(filename, total):
    randList = []
    randF = open(filename, 'r')
    randC = randF.readlines()
    randF.close()
    if (len(randC) != 1):
        print("LENGTH ERROR")
    randLine = randC[0]
    randCells = randLine.strip().split(",")
    for cell in randCells:
        randList.append(cell.strip())

    with open('seq_indicator', 'w') as seqF:
        for idx in range(1, total + 1, 1):
            seqF.write(f'{idx}:{randList[idx - 1]}\n')

def shuffleAList(filename):

    randList = []
    randF = open(filename, 'r')
    randC = randF.readlines()
    randF.close()
    if (len(randC) != 1):
        print("LENGTH ERROR")
    randLine = randC[0]
    randCells = randLine.strip().split(",")
    for cell in randCells:
        randList.append(cell.strip())
    print('before shuffle')
    print(f' {randList}')
    random.shuffle(randList)
    print('after shuffle')

    print(randList)

    with open('randlistV3.txt', 'w') as randF:
        for idx in range(len(randList)):
            if idx > 0:
                randF.write(',')
            randF.write(str(randList[idx]))




def main():
    # genRandom(1000, 1, 9000000)
    shuffleAList('randListV3.txt')
    genSeq('randListV3.txt', 1000)



if __name__ == '__main__':
    main()