import sys
import queue
import time

time_limit = 5
random_seed = 5
input_file = ''

node_num = 0
depot_ptr = 0
required_edges_num = 0
non_required_edges_num = 0
vehicle_num = 0
capacity = 0
total_cost_of_required_edges = 0

nodes = []

distance_array = []
free_list = []


class Node:
    neighbours = []
    idx = 0
    cost_list = []
    demand_list = []
    capacity = capacity

    def __init__(self):
        self.neighbours = []
        self.idx = 0
        self.cost_list = []
        self.demand_list = []
        self.capacity = capacity


# 读取文件，初始化参数
def initialization():
    consoles = sys.argv
    global input_file, time_limit, random_seed
    global nodes, node_num, depot_ptr, required_edges_num, non_required_edges_num, \
        vehicle_num, capacity, total_cost_of_required_edges

    if len(consoles) < 2:
        print("Lack of file name, can not execute normally.\n")
        exit(1)
    elif len(consoles) < 6:
        input_file = consoles[1]
        print("Lack of parameters\n")
    else:
        input_file = consoles[1]
        time_limit = consoles[3]
        random_seed = consoles[5]

    with open(input_file, 'r') as file:
        line = file.readline()
        while line:
            str_list = line.split()
            if str_list[0] == 'VERTICES':
                node_num = int(str_list[2])
                for i in range(node_num):
                    nodes.append(Node())
                    nodes[i].idx = i
            elif str_list[0] == 'DEPOT':
                depot_ptr = int(str_list[2])
            elif str_list[0] == 'REQUIRED':
                required_edges_num = int(str_list[3])
            elif str_list[0] == 'NON-REQUIRED':
                non_required_edges_num = int(str_list[3])
            elif str_list[0] == 'VEHICLES':
                vehicle_num = int(str_list[2])
            elif str_list[0] == 'CAPACITY':
                capacity = int(str_list[2])
            elif str_list[0] == 'TOTAL':
                total_cost_of_required_edges = int(str_list[6])
            elif str_list[0].isdigit():
                # 为了编号方便，idx 统一从零开始
                from_node_idx = int(str_list[0]) - 1
                to_node_idx = int(str_list[1]) - 1
                cost = int(str_list[2])
                demand = int(str_list[3])
                nodes[from_node_idx].neighbours.append(to_node_idx)
                nodes[from_node_idx].cost_list.append(cost)
                nodes[from_node_idx].demand_list.append(demand)
                nodes[to_node_idx].neighbours.append(from_node_idx)
                nodes[to_node_idx].cost_list.append(cost)
                nodes[to_node_idx].demand_list.append(demand)

                if demand != 0: # 有任务需求的边，将 正反边 加入 free_list
                    free_list.append((from_node_idx, to_node_idx))
                    free_list.append((to_node_idx,from_node_idx))

            elif str_list[0] == 'END':
                break
            line = file.readline()


# 计算两点之间的最短开销
def dijkstra(src_node: Node, dst_node: Node) -> int:
    src = src_node.idx
    dst = dst_node.idx
    distance = [sys.maxsize] * node_num
    distance[src] = 0
    visited = []
    pq = queue.PriorityQueue()
    pq.put([0, src])
    while not pq.empty():

        term = pq.get()
        curr_cost = term[0]
        curr_idx = term[1]
        if curr_idx in visited:
            continue
        visited.append(curr_idx)

        for i in range(len(nodes[curr_idx].neighbours)):
            neigh_idx = nodes[nodes[curr_idx].neighbours[i]].idx
            new_cost = curr_cost + nodes[curr_idx].cost_list[i]

            if distance[neigh_idx] > new_cost:
                distance[neigh_idx] = new_cost
                pq.put([new_cost, neigh_idx])

    return distance[dst]

def path_scanning():
    routes = []
    while free_list != []:
        route = []
        residual = capacity
        end = depot_ptr
        for edge in free_list:
            from_node = edge[0]



    pass

if __name__ == "__main__":
    start = time.time() # start time
    initialization()
    # 记忆化
    distance_array = [[0 for i in range(node_num)] for j in range(node_num)]
    for i in range(node_num):
        for j in range(node_num):
            if i != j:
                distance_array[i][j] = dijkstra(nodes[i], nodes[j])

    end = time.time() # end time

    print("Using {}s".format(end-start))

