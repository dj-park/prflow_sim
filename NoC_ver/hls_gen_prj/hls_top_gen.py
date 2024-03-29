counter = 0
with open('./host.cpp', 'r') as file:
    for line in file:
        line = line.strip()
        if(line.startswith('in1')):
            line = line.split('.')[1]
            line = 'tmp1.' + line
            print(line)
            counter = counter + 1
        test_word = line.split('.range')
        if(len(test_word)>1):
            test_word = test_word[1]
            if(test_word.startswith('(31,')):
                print('Output_1.write(tmp1);')
        # if(counter!=0 and counter%2==0):
        #     print('Output_1.write(tmp1)')

print(counter/2)