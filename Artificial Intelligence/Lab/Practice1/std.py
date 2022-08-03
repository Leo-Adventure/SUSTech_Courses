# add your code here
from itertools import product
import numpy as np


class Snake:    # 🐍
    dire_bias = (
        np.array([-1, 0]), np.array([1, 0]),
        np.array([0, -1]), np.array([0, 1])
    )
    reverse_dire = (1, 0, 3, 2)

    def __init__(self, game_map):
        self.dead = False
        self.head_pos = np.array([0, 0])
        self.tail_pos = np.array([0, 0])
        self.dire_queue = []
        self.__find_head(game_map)
        self.__init_body(game_map)

    def __find_head(self, game_map):
        h, w = len(game_map), len(game_map[0])
        for i, j in product(range(h), range(w)):
            if game_map[i][j] == '@':
                self.head_pos = np.array([i, j])
                game_map[i][j] = '#'
                break

    def __init_body(self, game_map):
        h, w = len(game_map), len(game_map[0])
        position = self.head_pos
        visit = [[False] * w for _ in range(h)]
        while True:
            visit[position[0]][position[1]] = True
            find_next = False
            for dire in range(4):
                next_pos = position + Snake.dire_bias[dire]
                i, j = next_pos
                if visit[i][j] or not (0 <= i < h and 0 <= j < w):
                    continue
                if game_map[i][j] == '#':
                    self.dire_queue.append(Snake.reverse_dire[dire])
                    position = next_pos
                    find_next = True
                    break
            if not find_next:
                self.tail_pos = position
                break

    def update(self, game_map, direction):
        h, w = len(game_map), len(game_map[0])
        bias = Snake.dire_bias[direction]
        next_pos = self.head_pos + bias
        if 0 <= next_pos[0] < h and 0 <= next_pos[1] < w:
            i, j = next_pos
            if game_map[i][j] == '-':
                # next position is empty
                game_map[i][j] = '#'
                i, j = self.tail_pos
                game_map[i][j] = '-'
                tail_bias = Snake.dire_bias[self.dire_queue[-1]]
                self.head_pos = next_pos
                self.tail_pos = self.tail_pos + tail_bias
                self.dire_queue.insert(0, direction)
                self.dire_queue.pop()
                return ''
        return 'dead'


class GameWorld:
    def __init__(self, file_path):
        """ Object Type Table:
            -: empty
            #: snake body
            @: snake head
        """
        self.game_map = None
        self.__load_map(file_path)
        self.snake = Snake(self.game_map)
        self.bean_countdown = 0
        self.stone_countdown = 0
        self.bean_pos = [0, 0]
        self.stone_num = 0
        self.finish = False

    def update(self, direction):
        res = self.snake.update(self.game_map, direction)
        if res == 'dead':
            self.finish = True

    def __load_map(self, file_path):
        with open(file_path, 'r') as f:
            self.game_map = [list(line.strip()) for line in f.readlines()]

    # def display(self):
    #     if self.finish:
    #         print('game over')
    #         return
    #     for item in self.game_map:
    #         print(''.join(item))