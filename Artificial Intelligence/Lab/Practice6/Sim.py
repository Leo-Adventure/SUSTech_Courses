import random

import numpy as np
import time
import math


# making a problem instance
def make_grid_python(n):
    grid = np.empty((n ** 2, n ** 2), int)
    x = 0
    for i in range(n):
        for j in range(n):
            for k in range(n ** 2):
                grid[n * i + j, k] = x % (n ** 2) + 1
                x += 1
            x += n
        x += 1
    return grid


def make_grid_numpy(n):
    return np.fromfunction(lambda i, j: (i * n + i // n + j) % (n ** 2) + 1, (n ** 2, n ** 2), dtype=int)


# a comparison between native python and numpy
# vary n to see their performances
N = 4
n = N

# %timeit make_grid_python(n)
# %timeit make_grid_numpy(n)

# test
grid = make_grid_numpy(N)
grid


class Sudoku:
    @classmethod
    def create(cls, n, seed=303):
        rng = np.random.default_rng(seed)
        init_grid = make_grid_numpy(n)

        # randomly mask out some cells to create a problem instance
        # cells marked by *1* is given and fixed
        mask = rng.integers(0, 2, size=init_grid.shape)
        grid = init_grid * mask

        return cls(n, mask, grid, seed)

    def __init__(self, n, mask, grid, seed) -> None:
        self.seed = seed
        self.mask = mask
        self.grid = grid
        self.n = n
        self.all = set(range(1, n ** 2 + 1))

    def evaluate_value(self, line):
        num = [1] * (n ** 2)
        for val in line:
            num[val - 1] = 0
        ans = 0
        for i in range(n ** 2):
            ans = ans + num[i]
        return ans

    def value(self):
        # TODO: evaluate the current state, return a scalar value
        ans = 0
        for i in range(n ** 2):
            a = []
            b = []
            for j in range(n ** 2):
                # print(self.grid)
                a.append(self.grid[i][j])
                b.append(self.grid[j][i])
            ans = ans + self.evaluate_value(a) + self.evaluate_value(b)
        return ans

    def local_search(self):
        # TODO: apply your neighborhood search operator to get the next state
        test = self.grid.copy()
        i = random.randint(0, n - 1)
        j = random.randint(0, n - 1)
        pos1 = (random.randint(0, n - 1), random.randint(0, n - 1))
        pos2 = (random.randint(0, n - 1), random.randint(0, n - 1))
        test[i * n + pos1[0]][j * n + pos1[1]], test[i * n + pos2[0]][j * n + pos2[1]] = \
            test[i * n + pos2[0]][j * n + pos2[1]], test[i * n + pos1[0]][j * n + pos1[1]]
        next_state = Sudoku(self.n, self.mask, test, self.seed)
        return next_state

    def init_solution(self):
        rng = np.random.default_rng(self.seed)
        n = self.n
        grid = self.grid.reshape(n, n, n, n).transpose(0, 2, 1, 3)
        for I in np.ndindex(n, n):
            idx = grid[I] == 0
            grid[I][idx] = rng.permutation(list(self.all - set(grid[I].flat)))
        return self

    def __repr__(self) -> str:
        return self.grid.__repr__()


# test
sudoku = Sudoku.create(N)
sudoku.init_solution()
sudoku, sudoku.value()


def simulated_annealing(initial: Sudoku, schedule, halt, log_interval=200):
    state = initial.init_solution()
    t = 0  # time step
    T = schedule(t)  # temperature
    f = [state.value()]  # a recording of values
    while not halt(T):
        T = schedule(t)
        new_state = state.local_search()
        new_value = new_state.value()
        # TODO: implement the replacement here
        if new_value < state.value():
            state = new_state
        elif math.exp(1 * (state.value() - new_value) / T) > random.random():
            state = new_state
        # update time and temperature
        if t % log_interval == 0:
            print(f"step {t}: T={T}, current_value={state.value()}")
        t += 1
        T = schedule(t)
    print(f"step {t}: T={T}, current_value={state.value()}")
    return state, f


import matplotlib.pyplot as plt

# define your own schedule and halt condition
# run the algorithm on different n with different settings
n = N
solution, record = simulated_annealing(
    initial=Sudoku.create(n),
    schedule=lambda t: 0.999 ** t,
    halt=lambda T: T < 1e-7
)
solution, solution.value()

# visualize the curve
plt.plot(record)
plt.xlabel("time step")
plt.ylabel("value")

