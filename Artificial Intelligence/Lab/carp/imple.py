import numpy as np
from random import randint
import time, sys, getopt
import multiprocessing
import random
from queue import PriorityQueue

import copy

class routeInfo:

    def __init__(self, route, res, cost):
        self.route = route
        self.res = res
        self.cost = cost



    def __repr__(self):
        return "(%s, %s, %s)\n" % (
                repr(self.route),
                repr(self.res),
                repr(self.cost))

class Dijkstra:
    def __init__(self, graph):
        self.graph = graph
        # Shortest path tree as a dictionary.
        self.parent = dict((node, None) for node in self.graph.iternodes())
        self.distance = dict((node, float("inf")) for node in self.graph.iternodes())
        self.source = None
        self._in_queue = dict((node, True) for node in self.graph.iternodes())
        self._pq = PriorityQueue()

    def run(self, source):
        self.source = source
        self.distance[source] = 0
        for node in self.graph.iternodes():
            self._pq.put((self.distance[node], node))
        while not self._pq.empty():
            _, node = self._pq.get()
            if self._in_queue[node]:
                self._in_queue[node] = False
            else:
                continue
            for edge in self.graph.iteroutedges(node):
                if self._in_queue[edge.target] and self._relax(edge):
                    self._pq.put((self.distance[edge.target], edge.target))

    def _relax(self, edge):
        alt = self.distance[edge.source] + edge.cost
        if self.distance[edge.target] > alt:
            self.distance[edge.target] = alt
            self.parent[edge.target] = edge.source
            return True
        return False

    def path(self, target):
        if self.source == target:
            return [self.source]
        elif self.parent[target] is None:
            raise ValueError("no path to target")
        else:
            return self.path(self.parent[target]) + [target]


class Edge:
    def __init__(self, source, target, cost=1, demand=0):
        self.source = source
        self.target = target
        self.cost = cost
        self.demand = demand

    def __repr__(self):
        if self.cost == 1:
            return "%s(%s, %s)" % (
                self.__class__.__name__,
                repr(self.source),
                repr(self.target))
        else:
            return "%s(%s, %s, %s, %s)" % (
                self.__class__.__name__,
                repr(self.source),
                repr(self.target),
                repr(self.cost),
                repr(self.demand))

    def __cmp__(self, other):
        # Check costs.
        if self.cost > other.cost:
            return 1
        if self.cost < other.cost:
            return -1
        # Check the first node.
        if self.source > other.source:
            return 1
        if self.source < other.source:
            return -1
        # Check the second node.
        if self.target > other.target:
            return 1
        if self.target < other.target:
            return -1
        return 0

    def __hash__(self):
        # return hash(repr(self))
        return hash((self.source, self.target, self.cost, self.demand))

    def __invert__(self):
        return self.__class__(self.target, self.source, self.cost, self.demand)

    inverted = __invert__


class UndirectedEdge(Edge):

    def __init__(self, source, target, cost=1):
        if source > target:
            self.source = target
            self.target = source
        else:
            self.source = source
            self.target = target
        self.cost = cost

    def __invert__(self):
        return self

class Graph(dict):
    def __init__(self, n=0, directed=False):
        self.n = n
        self.directed = directed
        # Structures defining a topological graph.
        self.edge_next = None
        self.edge_prev = None

    def is_directed(self):
        return self.directed

    def v(self):
        return len(self)

    def e(self):
        edges = sum(len(self[node]) for node in self)
        return (edges if self.is_directed() else edges / 2)

    def f(self):
        if not self.edge_next or not self.edge_prev:
            raise ValueError("run planarity test first")
        return self.e() + 2 - self.n  # Euler's formula

    def iterfaces(self):
        if not self.edge_next or not self.edge_prev:
            raise ValueError("planar embedding not calculated")
        used = set()
        for edge in self.edge_next:
            if edge in used:
                continue
            used.add(edge)
            face = [edge]
            edge = self.edge_next[~edge]
            while edge not in used:
                used.add(edge)
                face.append(edge)
                edge = self.edge_next[~edge]
            yield face

    def add_node(self, node):
        if node not in self:
            self[node] = dict()

    def has_node(self, node):
        return node in self

    def del_node(self, node):
        # The dictionary changes size during iteration.
        for edge in list(self.iterinedges(node)):
            self.del_edge(edge)
        if self.is_directed():
            for edge in list(self.iteroutedges(node)):
                self.del_edge(edge)
        del self[node]

    def add_edge(self, edge):
        if edge.source == edge.target:
            raise ValueError("loops are forbidden")
        self.add_node(edge.source)
        self.add_node(edge.target)
        if edge.target not in self[edge.source]:
            self[edge.source][edge.target] = edge
        else:
            raise ValueError("parallel edges are forbidden")
        if not self.is_directed():
            if edge.source not in self[edge.target]:
                self[edge.target][edge.source] = ~edge
            else:
                raise ValueError("parallel edges are forbidden")

    def del_edge(self, edge):
        del self[edge.source][edge.target]
        if not self.is_directed():
            del self[edge.target][edge.source]

    def has_edge(self, edge):
        return edge.source in self and edge.target in self[edge.source]

    def cost(self, edge):
        if edge.source in self and edge.target in self[edge.source]:
            return self[edge.source][edge.target].cost
        else:
            return 0

    def iternodes(self):
        return self.iterkeys()

    def iteradjacent(self, source):
        return self[source].iterkeys()

    def iteroutedges(self, source):
        for target in self[source]:
            yield self[source][target]

    def iterinedges(self, source):
        if self.is_directed():  # O(V) time
            for target in self.iternodes():
                if source in self[target]:
                    yield self[target][source]
        else:
            for target in self[source]:
                yield self[target][source]

    def iteredges(self):
        for source in self.iternodes():
            for target in self[source]:
                if self.is_directed() or source < target:
                    yield self[source][target]

    def show(self):
        for source in self.iternodes():
            print(source, ":")
            for edge in self.iteroutedges(source):
                print("%s(%s,%s)" % (edge.target, edge.cost, edge.demand))
            print()

    def copy(self):
        new_graph = Graph(n=self.n, directed=self.directed)
        for node in self.iternodes():
            new_graph[node] = dict(self[node])
        return new_graph

    def transpose(self):
        new_graph = Graph(n=self.n, directed=self.directed)
        for node in self.iternodes():
            new_graph.add_node(node)
        for edge in self.iteredges():
            new_graph.add_edge(~edge)
        return new_graph

    def complement(self):
        new_graph = Graph(n=self.n, directed=self.directed)
        for node in self.iternodes():
            new_graph.add_node(node)
        for source in self.iternodes():
            for target in self.iternodes():
                if source != target:  # no loops
                    edge = Edge(source, target)
                    if not self.has_edge(edge) and not new_graph.has_edge(edge):
                        new_graph.add_edge(edge)
        return new_graph

    def subgraph(self, nodes):
        node_set = set(nodes)
        if any(not self.has_node(node) for node in node_set):
            raise ValueError("nodes not from the graph")
        new_graph = Graph(n=len(node_set), directed=self.directed)
        for node in node_set:
            new_graph.add_node(node)
        for edge in self.iteredges():
            if (edge.source in node_set) and (edge.target in node_set):
                new_graph.add_edge(edge)
        return new_graph

    def degree(self, source):
        if self.is_directed():
            raise ValueError("the graph is directed")
        return len(self[source])

    def outdegree(self, source):
        return len(self[source])

    def indegree(self, source):
        if self.is_directed():  # O(V) time
            counter = 0
            for target in self.iternodes():
                if source in self[target]:
                    counter += 1
            return counter
        else:  # O(1) time
            return len(self[source])

    def __eq__(self, other):
        if self.is_directed() is not other.is_directed():
            # print "directed and undirected graphs"
            return False
        if self.v() != other.v():
            # print "|V1| != |V2|"
            return False
        for node in self.iternodes():  # O(V) time
            if not other.has_node(node):
                # print "V1 != V2"
                return False
        if self.e() != other.e():  # inefficient, O(E) time
            # print "|E1| != |E2|"
            return False
        for edge in self.iteredges():  # O(E) time
            if not other.has_edge(edge):
                # print "E1 != E2"
                return False
            if edge.cost != other.cost(edge):
                return False
        return True

    def __ne__(self, other):
        return not self == other

    def add_graph(self, other):
        if self.is_directed() is not other.is_directed():
            raise ValueError("directed vs undirected")
        for node in other.iternodes():
            self.add_node(node)
        for edge in other.iteredges():
            self.add_edge(edge)

    def save(self, file_name, name="Graph"):
        afile = open(file_name, "w")
        afile.write("# NAME=%s\n" % name)
        afile.write("# DIRECTED=%s\n" % self.is_directed())
        afile.write("# V=%s\n" % self.v())
        afile.write("# E=%s\n" % self.e())
        for edge in self.iteredges():
            afile.write("%s %s %s %s\n" % (edge.source, edge.target, edge.cost, edge.demand))
        afile.close()

    @classmethod
    def load(cls, file_name):
        afile = open(file_name, "r")
        n = 1
        is_directed = False
        for line in afile:
            if line[0] == "#":
                if "# NAME=" in line:
                    name = line[7:-1]
                elif line == "# DIRECTED=False\n":
                    is_directed = False
                elif line == "# DIRECTED=True\n":
                    is_directed = True
                elif "# V=" in line:
                    n = int(line[4:-1])
                else:  # ignore other
                    graph = cls(n, is_directed)
            else:
                # alist = [int(x) for x in line.split()]
                # alist = [eval(x) for x in line.split()]
                alist = line.split()
                if len(alist) == 3:
                    alist[-1] = eval(alist[-1])
                graph.add_edge(Edge(*alist))
        afile.close()
        return graph

    def save_lgl(self, file_name="graph.lgl"):
        if self.is_directed():
            raise ValueError("the graph is directed")
        afile = open(file_name, "w")
        for edge in self.iteredges():
            afile.write("%s %s %s %s\n" % (edge.source, edge.target, edge.cost, edge.demand))
        afile.close()

    def save_ncol(self, file_name="graph.ncol"):
        if self.is_directed():
            raise ValueError("the graph is directed")
        afile = open(file_name, "w")
        for node in self.iternodes():
            afile.write("# %s\n" % str(node))
            for edge in self.iteroutedges(node):
                if edge.source < edge.target:
                    afile.write("%s %s\n" % (edge.target, edge.cost))
        afile.close()


def initialization_v3(alpha):
    INIT_R = []
    INIT_COST = []
    INIT_LOAD = []
    avg_demand = td / REQUIRED_EDGES
    avg_cost_on_demand = TOTAL_COST_OF_REQUIRED_EDGES / REQUIRED_EDGES
    free = []
    free_inv = []
    for e in G.iteredges():
        if e.demand != 0:
            free.append([e.source, e.target])
            free_inv.append([e.target, e.source])
    all_task = free + free_inv
    while True:
        # Tasks and inverse tasks
        task = all_task[:]
        R = []
        COST = []
        LOAD = []
        while True:
            route = []
            load = 0
            cost = 0
            current = DEPOT
            while True:
                d = np.inf
                candidate = np.inf
                candidates = []
                flag = False
                for u in task:
                    if CAPACITY - load > alpha * avg_demand:
                        if shortestPath[current][u[0]] < candidate:
                            candidate = shortestPath[current][u[0]]
                            candidates = [u]
                        elif shortestPath[current][u[0]] == candidate:
                            candidates.append(u)
                    else:
                        if shortestPath[current][u[0]] + shortestPath[u[0]][u[1]] + shortestPath[u[1]][DEPOT] <= avg_cost_on_demand + shortestPath[u[0]][DEPOT]:
                            if shortestPath[current][u[0]] < candidate:
                                candidate = shortestPath[current][u[0]]
                                candidates = [u]
                            elif shortestPath[current][u[0]] == candidate:
                                candidates.append(u)
                if not candidates:
                    break
                for u in candidates:
                    if load + G[u[0]][u[1]].demand > CAPACITY:
                        flag = False
                    else:
                        flag = True
                        break
                if flag:
                    for u in task:
                        if shortestPath[current][u[0]] < d:
                            if load + G[u[0]][u[1]].demand <= CAPACITY:
                                d = shortestPath[current][u[0]]
                                current_task = u
                        elif shortestPath[current][u[0]] == d:
                            if load + G[u[0]][u[1]].demand <= CAPACITY:
                                rand = randint(0, 1)
                                if rand == 0:
                                    current_task = u
                    if d != np.inf:
                        route.append(current_task)
                        task.remove(current_task)
                        task.remove(current_task[::-1])
                        load += G[current_task[0]][current_task[1]].demand
                        cost += G[current_task[0]][current_task[1]].cost + d
                        current = current_task[1]
                    if not task or d == np.inf:
                        break
                else:
                    break
            cost += shortestPath[current][DEPOT]
            R.append(route)
            LOAD.append(load)
            COST.append(cost)
            if not task:
                break
        if sum(INIT_COST) == 0 or sum(COST) <= sum(INIT_COST):
            INIT_R = R
            INIT_COST = COST
            INIT_LOAD = LOAD
        if time.time() - start >= init_termination:
            break
    return INIT_R, INIT_COST, INIT_LOAD


def find_break_point(route):
    pre = DEPOT
    breakpoint = []
    for i in range(len(route)):
        this_task = route[i]
        if this_task[0] != pre:
            breakpoint.append(i)
        pre = this_task[1]

    if DEPOT != pre:
        breakpoint.append(i+1)
    return breakpoint


def find_double_edge(route):
    double_edge=[]
    for i in range(len(route)-1):
        if(route[i][1]==route[i+1][0]):
            double_edge.append(i)
    return double_edge


def TSA (init_solution):

    b_solution = init_solution
    bf_solution = init_solution
    solution = init_solution
    p = 1
    b_score = score_function(init_solution,p)
    bf_score = score_function(init_solution, p)
    k = 0
    k_b = 0
    k_bf = 0
    k_f = 0
    k_i = 0
    tabu_list = []
    t = REQUIRED_EDGES/2
    f_si = 1
    f_di = 1

    while True:
        flag = 0
        score = float("inf")
        solution = solution
        remove_tb=[]
        for tb in tabu_list:
            tb[1]=tb[1]-1
            if tb[1]==0:
                remove_tb.append(tb)
        for rtb in remove_tb:
            tabu_list.remove(rtb)

        #  find the neighbourhood, until find the solution better than the current one
        while True:
            all_neighbor = []

            # single insertion
            if k%f_si ==0:
                all_neighbor.append(SI_neighbor(solution, score, p, tabu_list))
            # double insertion
            if k%f_di ==0:
                all_neighbor.append(DI_neighbor(solution, score, p, tabu_list))

            sorted(all_neighbor, key= lambda item:item[1])
            (new_solution,new_socre)=all_neighbor[0]

            if new_solution != None:

                if (isfeasible(new_solution)):
                    new_flag = 2
                    k_i = k_i -1
                else:
                    k_f = k_f -1
                    new_flag = 1

                solution = new_solution
                score = new_socre
                if new_socre < b_score:
                    b_score = new_socre
                    b_solution = new_solution
                    flag = 1
                if new_flag == 2 and new_socre<bf_score:
                    bf_score = new_socre
                    bf_solution = new_solution
                    flag = 2
                if flag!=0:
                    break;
            else:
                break

        if flag == 1:
            tabu_list.append([b_solution, t])
            k_b = 0
        elif flag == 2:
            tabu_list.append([bf_solution, t])
            k_b = 0
            k_bf = 0

        if k % 10 == 0:
            if k_f == 10:
                p = p / 2
            if k_i == 10:
                p = 2 * p
            k_f = 0
            k_i = 0

        k = k + 1
        k_b = k_b + 1
        k_bf = k_bf + 1
        k_f = k_f + 1
        k_i = k_i + 1
        if time.time() >= start + termination - 1:
            break
    return bf_solution, bf_score


def SI_neighbor(solution, score, p, tabu_list):
    best_neighbor = None
    best_neighbor_score= score
    breakpoints=[]
    for s in solution:
        breakpoints.append(find_break_point(s.route))

    neighbor = copy.deepcopy(solution)
    for i1 in range(len(neighbor)):
                s_removed = neighbor[i1]
                prev = DEPOT
                for i2 in range(len(s_removed.route)):
                    if i2 == len(s_removed.route)-1:
                        next = DEPOT
                    else:
                        next = s_removed.route[i2+1][0]
                    t = s_removed.route[i2]
                    t_i = t[::-1]
                    prev_cost1 = s_removed.cost
                    prev_res1 = s_removed.res
                    s_removed.cost = s_removed.cost - shortestPath[prev][t[0]] - G[t[0]][t[1]].cost - shortestPath[t[1]][next]\
                                     + shortestPath[prev][next]
                    s_removed.res = s_removed.res + G[t[0]][t[1]].demand
                    s_removed.route.pop(i2)

                    for i3 in list(range(0, i1) + range(i1+1, len(neighbor))):
                        breakpoint = breakpoints[i3]
                        f = neighbor[i3]
                        for bp in breakpoint:
                            for add_t in (t, t_i):
                                f.route.insert(bp, add_t)
                                if bp == 0:
                                    prev2 = DEPOT
                                    next2 = f.route[1][0]
                                elif bp == len(f.route)-1:
                                    prev2 = f.route[bp - 1][1]
                                    next2 = DEPOT
                                else:
                                    prev2 = f.route[bp - 1][1]
                                    next2 = f.route[bp + 1][0]
                                prev_cost = f.cost
                                prev_res = f.res
                                f.cost = f.cost + shortestPath[prev2][add_t[0]] + G[add_t[0]][add_t[1]].cost + \
                                         shortestPath[add_t[1]][next2] - \
                                         shortestPath[prev2][next2]
                                f.res = f.res - G[add_t[0]][add_t[1]].demand
                                score_neighbor = score_function(neighbor,p)
                                if score_neighbor < best_neighbor_score:
                                    if tabu_list.__contains__(neighbor) == False:
                                        best_neighbor = copy.deepcopy(neighbor)
                                        best_neighbor_score = score_neighbor

                                f.route.pop(bp)
                                f.cost = prev_cost;
                                f.res = prev_res;

                    s_removed.route.insert(i2, t)
                    s_removed.cost = prev_cost1
                    s_removed.res = prev_res1
                    prev = s_removed.route[i2][1]

    return best_neighbor, best_neighbor_score


def DI_neighbor(solution, score, p, tabu_list):
    best_neighbor = None
    best_neighbor_score = score
    breakpoints = []
    double_edge=[]
    for s in solution:
        breakpoints.append(find_break_point(s.route))
        double_edge.append(find_double_edge(s.route))

    neighbor = copy.deepcopy(solution)
    for i1 in range(len(neighbor)):
        s_removed = neighbor[i1]
        de = double_edge[i1]
        for i2 in de:
            if i2 == 0:
                prev = DEPOT
            else:
                prev = s_removed.route[i2 - 1][1]
            if i2 == len(s_removed.route) - 2:
                next = DEPOT
            else:
                next = s_removed.route[i2 + 2][0]
            t = s_removed.route[i2]
            t2 = s_removed.route[i2+1]
            t_i = t[::-1]
            t2_i= t2[::-1]
            prev_cost1 = s_removed.cost
            prev_res1 = s_removed.res

            s_removed.cost = s_removed.cost - shortestPath[prev][t[0]] - G[t[0]][t[1]].cost - G[t2[0]][t2[1]].cost - shortestPath[t2[1]][next] \
                             + shortestPath[prev][next]
            s_removed.res = s_removed.res + G[t[0]][t[1]].demand + G[t2[0]][t2[1]].demand
            s_removed.route.pop(i2)
            s_removed.route.pop(i2)

            for i3 in list(range(0, i1) + range(i1 + 1, len(neighbor))):
                breakpoint = breakpoints[i3]
                f = neighbor[i3]
                for bp in breakpoint:
                    for add_t in ((t, t2), (t2_i, t_i)):
                        f.route.insert(bp, add_t[0])
                        f.route.insert(bp+1, add_t[1])
                        if bp == 0:
                            prev2 = DEPOT
                            next2 = f.route[2][0]
                        elif bp == len(f.route) - 2:
                            prev2 = f.route[bp - 1][1]
                            next2 = DEPOT
                        else:
                            prev2 = f.route[bp - 1][1]
                            next2 = f.route[bp + 2][0]
                        prev_cost = f.cost
                        prev_res = f.res
                        f.cost = f.cost + shortestPath[prev2][add_t[0][0]] + G[add_t[0][0]][add_t[0][1]].cost + G[add_t[1][0]][add_t[1][1]].cost + \
                                 shortestPath[add_t[1][1]][next2] - \
                                 shortestPath[prev2][next2]
                        f.res = f.res - G[add_t[0][0]][add_t[0][1]].demand - G[add_t[1][0]][add_t[1][1]].demand
                        score_neighbor = score_function(neighbor, p)
                        if score_neighbor < best_neighbor_score:
                            if not tabu_list.__contains__(neighbor):
                                best_neighbor = copy.deepcopy(neighbor)
                                best_neighbor_score = score_neighbor

                        f.route.pop(bp)
                        f.route.pop(bp)
                        f.cost = prev_cost
                        f.res = prev_res

            s_removed.route.insert(i2, t)
            s_removed.route.insert(i2+1, t2)
            s_removed.cost = prev_cost1
            s_removed.res = prev_res1

    return best_neighbor, best_neighbor_score


def score_function(solution, p):
    c, r, over = total_info(solution)
    return c+p*max(-over, 0)


def isfeasible(solution):
    for s in  solution:
        if(s.res<0):
            return  False
    return True


def total_info(routes):
    c = 0
    r = 0
    over = 0
    # Add the cost in every router
    for route in routes:
        c = c+route.cost
        r = r+route.res
        if route.res<0:
            over=over+route.res
    return c,r,over


def find_result_improve(seed):
    # use the path scanning many times, choose the best result, get the initial result
    random.seed(seed)
    for i in range(1000):
        solution1 = INIT_ROUTE
        all_solution.append(solution1)
        cost = total_info(solution1)[0]
        all_cost.append(cost)
        if i % 100 == 0:
            if time.time()-start >= termination:
                break

    # Find the minimum cost one
    index = all_cost.index(min(all_cost))
    init_solution = all_solution[index]
    init_cost = all_cost[index]

    # Use tabu search to improve the initial result
    final_solution, final_socre = TSA(init_solution)
    return final_solution,final_socre


def output(S, cost):
    out = 's '
    for R in S:
        out = out + '0,'
        for i in range(0, len(R)):
            pair = '({},{}),'.format(R[i][0], R[i][1])
            out = out + pair
        out = out + '0,'
    out = out[:-1]
    print(out)
    print('q {}'.format(cost))
    return


start = time.time()

info = np.zeros(7)
f = open(sys.argv[1])
opts, args = getopt.getopt(sys.argv[2:], 't:s:')

for (opt, val) in opts:
    if opt == '-t':
        termination = float(val)
    elif opt == '-s':
        random_seed = float(val)
lines = f.readlines()

random.seed(random_seed)
init_termination = .4 * termination
for i in range(1, 8):
    info[i-1] = lines[i].strip().split()[-1]
f.close()
info = info.astype(int)
info = info.tolist()

VERTICES = info[0]
DEPOT = info[1]
REQUIRED_EDGES = info[2]
NON_REQUIRED_EDGES = info[3]
VEHICLES = info[4]
CAPACITY = info[5]
TOTAL_COST_OF_REQUIRED_EDGES = info[6]
# Build the graph
G = Graph(n=VERTICES, directed=False)
td = 0

for i in range(9, REQUIRED_EDGES + NON_REQUIRED_EDGES + 9):
    G.add_edge(Edge(int(lines[i].strip().split()[0]),
                    int(lines[i].strip().split()[1]),
                    int(lines[i].strip().split()[2]),
                    int(lines[i].strip().split()[3])))
    td += int(lines[i].strip().split()[3])

# Initialize a shortest path matrix
shortestPath = np.zeros((VERTICES + 1, VERTICES + 1))
shortestPath = np.int_(shortestPath)
for i in range(1, VERTICES+1):
    algorithm = Dijkstra(G)
    algorithm.run(i)
    for j in range(i, VERTICES+1):
        shortestPath[i][j] = algorithm.distance[j]
shortestPath = np.maximum(shortestPath, shortestPath.transpose())
shortestPath = shortestPath.tolist()

results = multiprocessing.Pool(8).map(initialization_v3, np.linspace(0.5, 2.99, num=8))
best_init_cost = np.inf
index = -1
for i in range(8):
    if best_init_cost > sum(results[i][1]):
        best_init_cost = sum(results[i][1])
        index = i
INIT_R = results[index][0]
INIT_COST = results[index][1]
INIT_LOAD = results[index][2]
INIT_ROUTE = []
for i in range(0, len(INIT_COST)):
    INIT_ROUTE.append(routeInfo(INIT_R[i], CAPACITY - INIT_LOAD[i], INIT_COST[i]))
all_solution = []
all_cost = []
results = multiprocessing.Pool(8).map(find_result_improve, [random_seed, random_seed+1, random_seed+2, random_seed+3, random_seed+4, random_seed+5, random_seed+6, random_seed+7])
results = sorted(results, key=lambda item: item[1])

final_solution = results[0][0]
final_score = results[0][1]
FINAL_R = []
FINAL_COST = []
for i in range(0, len(final_solution)):
    FINAL_R.append(final_solution[i].route)
    FINAL_COST.append(final_solution[i].cost)
output(FINAL_R, sum(FINAL_COST))