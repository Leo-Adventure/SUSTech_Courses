# for i in range(20): 
#     print(i)

def generate(): 
    for i in range(20): 
        yield i

x = generate() 
for i in x: 
    print(i)