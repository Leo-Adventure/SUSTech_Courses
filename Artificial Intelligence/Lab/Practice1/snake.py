# add your code here
from queue import Queue
from re import T

test_case = 4

head_x = 0
head_y = 0
#10 11 32
tail_list = []
stone_list = []
with open(f'test_cases/{test_case}-map.txt', 'r') as f:
    game_map = [list(line.strip()) for line in f.readlines()]

border_x = len(game_map)
border_y = len(game_map[0])


def judge() -> bool:
    if head_x < 0 or head_x >= border_x or head_y < 0 or head_y >= border_y:
        return True
    if (head_x, head_y) in stone_list:
        
        return True
    if (head_x, head_y) in tail_list:
        return True
    # print(tail_list)
    
    return False

with open(f'./test_cases/{test_case}-actions.txt', 'r') as f:
    actions = [*map(int, f.read().split(' '))]

for i in range(len(game_map)):
    for j in range(len(game_map[0])):
        if game_map[i][j] == 'x':
            stone_list.append((i, j))
        elif game_map[i][j] == '@':
            head_x = i
            head_y = j
        elif game_map[i][j] == '#':
            tail_list.append((i, j))

dist_map = {}
for i in range(len(tail_list)):
    dist_map[tail_list[i]] = abs(tail_list[i][0] - head_x) + abs(tail_list[i][1] - head_y)


for i in range(len(tail_list)):
    for j in range(len(tail_list) - 1):
        if dist_map[tail_list[j]] > dist_map[tail_list[j + 1]]:
            tmp = tail_list[j]
            tail_list[j] = tail_list[j+ 1]
            tail_list[j + 1] = tmp

flag = True

for cnt in range(len(actions)):
    action = actions[cnt]
    if action == 0: # 向上走
        for i in range(len(tail_list) - 1, -1, -1):
            if i == 0:
                tail_list[i] = (head_x, head_y)
            else:
                tail_list[i] = tail_list[i - 1]

        head_x = head_x - 1
        if judge():
            print(cnt)
            flag = False
            break
  
    elif action == 1: # 向下走
        
        for i in range(len(tail_list) - 1, -1, -1):
            if i == 0:
                tail_list[i] = (head_x, head_y)
            else:
                tail_list[i] = tail_list[i - 1]
        head_x = head_x + 1        
        if judge():
            print(cnt)
            flag = False
            break
    elif action == 2: # 向左走
        
        for i in range(len(tail_list) - 1, -1, -1):
            if i == 0:
                tail_list[i] = (head_x, head_y)
            else:
                tail_list[i] = tail_list[i - 1]
        head_y = head_y - 1       
        if judge():
            print(cnt)
            flag = False
            break
    else: # 向右走
        
        for i in range(len(tail_list) - 1, -1, -1):
            if i == 0:
                tail_list[i] = (head_x, head_y)
            else:
                tail_list[i] = tail_list[i - 1]    
        head_y = head_y + 1
        if judge():
            print(cnt)
            flag = False
            break
if flag:

    print('%d %d' % (head_x, head_y))

