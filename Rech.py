import numpy

list_1 = []
list_2 = []

def Py_Rech(w_i):
    for n in w_i:
        if n!= '0' and n!= '1' and n!= '2' and n!= '3' and n!= '4' and n!= '5' and n!= '6' and n!= '7' and n!= '8' and n!= '9':
            #print(n)
            ind = w_i.index('/')
            #print(w_i.index('/'))
            
    for n in range(len(w_i)):
        if n != ind:
            if n < ind:
                list_1.append(int(w_i[n]))
                #print(list_1)
            if n > ind:
                #pass
                list_2.append(int(w_i[n]))
                #print(list_2)
    #print(list_1)
    #print(list_2)
    
    Num_1 = map(str, list_1)   # ['1','2','3']
    Num_1 = ''.join(Num_1)          # '123'
    Num_1 = int(Num_1)              # 123
    #print(Num_1)
    
    Num_2 = map(str, list_2)   # ['1','2','3']
    Num_2 = ''.join(Num_2)          # '123'
    Num_2 = int(Num_2)              # 123
    #print(Num_2)
    
    solution = Num_1/Num_2
    
    #print(solution)
    
    return solution