def BFS(Graph,start,end):
    """
    Write your BFS in python and get familar with python dictionary structure

    Args
    - Graph: a node dict contains all edges and their weights. keys are nodes' names. values are tuple (End_node,weight).
    - eg: Graph["S"]:[('R', '80'), ('F', '99')]
    - means there is an edge from S to R with weight 80 and an edge from S to F with weight 99
    - start: start node in graph
    - end: end node in graph
    Returns
    - do not need to return,but don't forget to yield the list
    - eg. queue:['S']
    """
    # yield [start] 
    queue = [start]
    # queue.append(start)
    print(Graph[start])
    vis = { start }
    # vis.append(start)
    while True:
        # vis.append(queue[0])
        if not queue: 
          return 
        child_list = Graph[queue[0]]
        yield queue
        del queue[0]
        # child_list = sorted(child_list)
        child_list.sort()
        print(child_list)
        # for i in range(len(child_list)):
        #   if child_list[i] not in vis:
        #     queue.append(child_list[i][0])
        for i in child_list:
          if i[0] not in vis: 
            queue.append(i[0])
            vis.add(i[0]) 
    