import queue
def AStarSearch(Graph,start,end,distances):
    """
    Write your AStar Searh in python and get familar with python dictionary structure

    Args
    - Graph: a node dict contains all edges and their weights. keys are nodes' names. values are tuple (End_node,weight).
    - eg: Graph["S"]:[('R', '80'), ('F', '99')]
    - means there is an edge from S to R with weight 80 and an edge from S to F with weight 99
    - start: start node in graph
    - end: end node in graph
    - distances: straight line distance dict from each node to end node
    - eg: distances["S"]: 20.0
    - means the straight line distance from node S to end node is 20.0
    Returns
    - do not need to return,but don't forget to yield the list
    - eg. queue:['S']

    """
    q = [(distances[start], start)]
    dist_map = {}
    dist_map[start] = 0
    visited = []
    while q:
        q.sort()
        city = q[0][1]
        while city in visited:
            del q[0]
            city = q[0][1]
        yield [i[1] for i in q]
        del q[0]
        visited.append(city)
        if city == end:
            break
        child_list = Graph[city]
        for i in child_list:
            if i[0] not in dist_map:
                dist_map[i[0]] = dist_map[city] + i[1]
            else:
                dist_map[i[0]] = min(dist_map[city] + i[1], dist_map[i[0]])
            q.append((dist_map[i[0]] + distances[i[0]], i[0]))

