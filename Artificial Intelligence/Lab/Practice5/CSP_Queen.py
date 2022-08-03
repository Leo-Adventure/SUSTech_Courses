def improving_bts(problem, start=(0, 0)):
    size = 8
    action_stack = []
    cnt = 0 # 列
    column = [0] * size
    while not problem.is_satisfy(action_stack):
        # print("action_stack = ", action_stack)
        # print("column = ", column) # 1 4 2 5 0 0
        # print("cnt = ", cnt)
        stack = action_stack.copy()
        
        stack.append((column[cnt], cnt))# 5 3
        if column[cnt] >= size:
            column[cnt] = 0
            cnt = cnt - 1
            action_stack.remove((column[cnt] - 1, cnt))
            continue
        # print("stack = ", stack)
        if problem.is_valid(stack):
            action_stack.append((column[cnt], cnt))
            column[cnt] = column[cnt] + 1
            cnt = cnt + 1
            # print("action_stack = ", action_stack)
        else:
            stack.remove((column[cnt], cnt))
            

            if column[cnt] == size - 1:
                column[cnt] = 0
                
                cnt = cnt - 1
                action_stack.remove((column[cnt] - 1, cnt))
            while column[cnt] < size - 1:
                column[cnt] = column[cnt] + 1
                stack.append((column[cnt], cnt))
                # print("In else, stack = ", stack)
                if problem.is_valid(stack):
                    action_stack.append((column[cnt], cnt))
                    column[cnt] = column[cnt] + 1
                    cnt = cnt + 1
                    break
                elif column[cnt] != size - 1:
                    stack.remove((column[cnt], cnt))
                elif column[cnt] >= size - 1:
                    column[cnt] = 0
                    cnt = cnt - 1
                    action_stack.remove((column[cnt] - 1, cnt))
                    # print("In size = 4, action_stack = ", action_stack)
                    break
                

                     
        yield action_stack
