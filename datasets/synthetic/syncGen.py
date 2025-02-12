import random
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime



def genScript(size, attrList, attrType, tblName, idAttr):
    ff = open(f'create_load.sql', 'a')
    ff.write(f"-- create and load {tblName}\n")
    ff.write(f'create table {tblName} (')
    for i in range(len(attrList)):
        if i > 0 :
            ff.write(",")
        ff.write(f"{attrList[i]} {attrType[i]}")
    ff.write(");\n")
    ff.write(f"-- COPY {tblName} FROM 'path/to/{tblName}/csv' DELIMITER ',' CSV HEADER;\n")
    if idAttr != '':
        ff.write(f'-- ALTER TABLE {tblName} ADD PRIMARY KEY({idAttr});\n')
    ff.write(f"-- create table {tblName}_backup as select * from {tblName};\n\n")

def genR500():
    # GENERATE ~500M DATA
    # ###################################
    print("DATA SIZE: 0.5 GB")
    print("START TIME: ", datetime.now().strftime("%H:%M:%S"))

    dataArr = []
    for row in range(1, 10000001):
        rand = random.randint(1, 5000)
        val = {
            # 'id' : row,
            'a' : rand,
            'b' : list(2 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'c' : list(3 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'd' : list(4 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'e' : list(3 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'f' : list(2 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'g' : list(5 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'h' : list(6 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'i' : list(7 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'j' : list(8 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            # 'k' : list(3 * rand + 1000 * np.random.normal(0, 0.3, 1))[0],
        }
        dataArr.append(val)

    dataFrame = pd.DataFrame(dataArr)
    # all to int;
    dataFrame['b'] = dataFrame['b'].astype('int')
    dataFrame['c'] = dataFrame['c'].astype('int')
    dataFrame['d'] = dataFrame['d'].astype('int')
    dataFrame['e'] = dataFrame['e'].astype('int')
    dataFrame['f'] = dataFrame['f'].astype('int')
    dataFrame['g'] = dataFrame['g'].astype('int')
    dataFrame['h'] = dataFrame['h'].astype('int')
    dataFrame['i'] = dataFrame['i'].astype('int')
    dataFrame['j'] = dataFrame['j'].astype('int')

    # store
    dataFrame.to_csv("r500.csv", index = False)

    print("END TIME: ", datetime.now().strftime("%H:%M:%S"))

def genGroups(distinctG, tblName):
    print("START TIME: ", datetime.now().strftime("%H:%M:%S"))
    print(f"GEN {tblName}: distinct group : {distinctG}")

    dataArr = []
    for row in range(1, 10000001):
        rand = random.randint(1, distinctG)
        val = {
            'id' : row,
            'a' : rand,
            'b' : list(2 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'c' : list(3 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'd' : list(4 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'e' : list(3 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'f' : list(2 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'g' : list(5 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'h' : list(6 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'i' : list(7 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'j' : list(8 * rand + 100 * np.random.normal(0, 0.3, 1))[0],
            'k' : list(3 * rand + 1000 * np.random.normal(0, 0.3, 1))[0],
        }
        dataArr.append(val)

    dataFrame = pd.DataFrame(dataArr)
    dataFrame['b'] = dataFrame['b'].astype('int')
    dataFrame['c'] = dataFrame['c'].astype('int')
    dataFrame['d'] = dataFrame['d'].astype('int')
    dataFrame['e'] = dataFrame['e'].astype('int')
    # dataFrame['f'] = dataFrame['f'].astype('int')
    # dataFrame['g'] = dataFrame['g'].astype('int')
    # dataFrame['h'] = dataFrame['h'].astype('int')
    # dataFrame['i'] = dataFrame['i'].astype('int')
    # dataFrame['j'] = dataFrame['j'].astype('int')

    # store
    dataFrame.to_csv(f"{tblName}.csv", index = False)

    print("END TIME: ", datetime.now().strftime("%H:%M:%S"))



def main():
    ff = open("create_load.sql", 'w')
    ff.close()
    attrList = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']
    attrType = ['int', 'int', 'int', 'int', 'int', 'int', 'int', 'int', 'int', 'int']
    # genScript(1, attrList, attrType, 'r500', '')
    genScript(1, ['id', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'], ['int', 'int', 'int', 'int', 'int', 'int', 'float', 'float', 'float', 'float', 'float', 'float'] , 't1gb50g', 'id')
    genScript(1, ['id', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'], ['int', 'int', 'int', 'int', 'int', 'int', 'float', 'float', 'float', 'float', 'float', 'float'] , 't1gb1000g', 'id')
    genScript(1, ['id', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'], ['int', 'int', 'int', 'int', 'int', 'int', 'float', 'float', 'float', 'float', 'float', 'float'] , 't1gb5000g', 'id')
    genScript(1, ['id', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'], ['int', 'int', 'int', 'int', 'int', 'int', 'float', 'float', 'float', 'float', 'float', 'float'] , 't1gb500000g', 'id')
    genScript(1, ['ttid', 'aa', 'bb', 'cc', 'dd', 'ee', 'ff', 'gg', 'hh', 'ii', 'jj', 'kk'], ['int', 'int', 'int', 'int', 'int', 'int', 'float', 'float', 'float', 'float', 'float', 'float'] , 'tjoinhelp', 'ttid')
    # genR500()
    genGroups(50, "t1gb50g")
    genGroups(1000, "t1gb1000g")
    genGroups(5000, "t1gb5000g")
    genGroups(500000, "t1gb500000g")
    genGroups(5000, "tjoinhelp")





if __name__ == '__main__':
    main()
