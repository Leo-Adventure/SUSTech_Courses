import numpy as np
import random
import time
import math
import functools
import copy
import random

COLOR_BLACK = -1
COLOR_WHITE = 1
COLOR_NONE = 0
random.seed(0)

# 上，下，左，右，左上，右下，左下，右上
direction_x = [-1, 1, 0, 0, -1, 1, 1, -1]
direction_y = [0, 0, -1, 1, -1, 1, -1, 1]

# 权重来自 github
# weighted_graph0 = [[500, -250, 10, 5, 5, 10, -250, 500],
#                    [-250, -450, 1, 1, 1, 1, -450, -250],
#                    [10, 1, 3, 2, 2, 3, 1, 10],
#                    [5, 1, 2, 1, 1, 2, 1, 5],
#                    [5, 1, 2, 1, 1, 2, 1, 5],
#                    [10, 1, 3, 2, 2, 3, 1, 10],
#                    [-250, -450, 1, 1, 1, 1, -450, -250],
#                    [500, -250, 10, 5, 5, 10, -250, 500]]
weighted_graph0 = [[500, -250, -100, 5, 5, -100, -250, 500],
                   [-250, -450, -100, 1, 1, -100, -450, -450],
                   [-100, -100, 30, 2, 2, 30, -100, 10],
                   [5, 1, 2, 1, 1, 2, 1, 5],
                   [5, 1, 2, 1, 1, 2, 1, 5],
                   [-100, -100, 30, 2, 2, 30, -100, -100],
                   [-250, -450, -100, 1, 1,  -100, -450, -250],
                   [500, -250, -100, 5, 5, -100, -250, 500]]

# weighted_graph1 = [[600, -100, 10, 5, 5, 10, -100, 600],
#                    [-100, -120, 1, 1, 1, 1, -120, -100],
#                    [10, 1, 30, 2, 2, 30, 1, 10],
#                    [5, 1, 2, 1, 1, 2, 1, 5],
#                    [5, 1, 2, 1, 1, 2, 1, 5],
#                    [10, 1, 30, 2, 2, 30, 1, 10],
#                    [-100, -120, 1, 1, 1, 1, -120, -100],
#                    [600, -100, 10, 5, 5, 10, -100, 600]]

weighted_graph1 = [[500, -250, -100, 5, 5, -100, -250, 500],
                   [-250, -450, -100, 1, 1, -100, -450, -450],
                   [-100, -100, 30, 2, 2, 30, -100, 10],
                   [5, 1, 2, 1, 1, 2, 1, 5],
                   [5, 1, 2, 1, 1, 2, 1, 5],
                   [-100, -100, 30, 2, 2, 30, -100, -100],
                   [-250, -450, -100, 1, 1,  -100, -450, -250],
                   [500, -250, -100, 5, 5, -100, -250, 500]]

# 权重来自 CSDN
weighted_graph2 = [
    [700, -100, 20, 20, 20, 20, -100, 700],
    [-100, -120, 5, 5, 5, 5, -120, -100],
    [20, 5, 20, 1, 1, 20, 5, 20],
    [20, 5, 1, 1, 1, 1, 5, 20],
    [20, 5, 1, 1, 1, 1, 5, 20],
    [20, 5, 1, 20, 1, 1, 5, 20],
    [-100, -120, 5, 5, 5, 20, -120, -100],
    [700, -100, 20, 20, 20, 20, -100, 700]]

stage = 0


class AI(object):
    # chessboard_size, color, time_out passed from agent
    chessboard_size = 0
    color = COLOR_NONE
    time_out = 5
    candidate_list = []
    my_idx = []
    oppose_idx = []

    def __init__(self, chessboard_size, color, time_out):
        self.chessboard_size = chessboard_size
        # You are white or black
        self.color = color
        # the max time you should use, your algorithm's run time must not exceed the time limit.
        self.time_out = time_out
        # You need add your decision into your candidate_list. System will get the end of your candidate_list as your decision .
        self.candidate_list = []

    # The input is current chessboard.

    def go(self, chessboard):
        # Clear candidate_list, must do this step
        self.candidate_list.clear()
        # 判断目前处于的时期
        stage = 0
        for i in range(self.chessboard_size):
            for j in range(self.chessboard_size):
                if self.judge(i, j) and chessboard[i][j] == 0:
                    stage = stage + 1
        value, move = 0, []
        # begin = time.time()

        depth = 4
        if stage < 10:
            value, move = self.alphabeta(chessboard=chessboard, depth=depth + 2, act_color=self.color,
                                         target_color=self.color)
        elif stage >= 10 and stage < 45:
            value, move = self.alphabeta(chessboard=chessboard, depth=depth + 1, act_color=self.color,
                                         target_color=self.color)
        else:
            value, move = self.alphabeta(chessboard=chessboard, depth=depth, act_color=self.color,
                                         target_color=self.color)
        # end = time.time()


        self.candidate_list = move

    # 判断是否越界
    def judge(self, x: int, y: int) -> bool:
        if x >= 0 and x < self.chessboard_size and y >= 0 and y < self.chessboard_size:
            return True

    # 计算并返回可以走的点以及对应下一步的棋盘状态集合
    def get_next_board_and_move(self, chessboard, color):

        move = []
        new_chessboard_list = []



        for i in range(8):
            for j in range(8):
                if chessboard[i][j] == color:

                    for direction in range(8): # 8 个方向
                        see_oppo = False
                        x = i + direction_x[direction]
                        y = j + direction_y[direction]
                        while self.judge(x, y) and chessboard[x][y] == -color:
                            see_oppo = True
                            x = x + direction_x[direction]
                            y = y + direction_y[direction]

                        if self.judge(x, y) and chessboard[x][y] == 0 and (x, y) not in move and see_oppo:
                            move.append((x, y))


                            new_chessboard = copy.deepcopy(chessboard)
                            new_chessboard[x][y] = color


                            for z in range(8):
                                curr_x = x + direction_x[z]
                                curr_y = y + direction_y[z]
                                reverse_color_list = []  # 要吃的对手棋子
                                while self.judge(curr_x, curr_y) and chessboard[curr_x][curr_y] == -color:
                                    reverse_color_list.append((curr_x, curr_y))
                                    curr_x = curr_x + direction_x[z]
                                    curr_y = curr_y + direction_y[z]

                                if self.judge(curr_x, curr_y) and new_chessboard[curr_x][curr_y] == color:
                                    for idx in reverse_color_list:
                                        new_chessboard[idx[0]][idx[1]] = color


                            new_chessboard_list.append(new_chessboard)


        return move, new_chessboard_list

    def print(self, chessboard):
        for i in range(8):
            for j in range(8):
                print(chessboard[i][j], end=" ")
            print("")
        print("----------------------------------------------------------")

    # 传入现有的棋盘、期望搜索的深度、alpha上限、beta下限以及行动方颜色和己方颜色（用来确定是 max 还是 min 决策），返回最优评分以及对应决策
    def alphabeta(self, chessboard, depth, act_color, target_color):

        def maxvalue(chessboard, alpha, beta, act_color, depth, target_color):  # 更新 alpha 值

            move, chessboard_list = self.get_next_board_and_move(chessboard=chessboard,
                                                                 color=act_color)  # 站在当前的棋盘状态下，我可以看见的可走步数以及相应的棋局

            if depth == 0 or len(move) == 0:  # 走不动了
                return self.calculate_value(chessboard=chessboard, color=target_color), move

            value, current_move = -math.inf, move[0]
            idx = -1
            for i in range(len(chessboard_list)):
                next_value, next_move = minvalue(chessboard=chessboard_list[i], alpha=alpha, beta=beta,
                                                 act_color=-act_color, target_color=target_color, depth=depth - 1)
                if next_value > value:
                    value = next_value
                    idx = i
                    current_move = move[i]
                    alpha = max(alpha, value)
                if alpha >= beta:
                    return value, current_move

            move_len = len(move)
            tmp = move[move_len - 1]
            move[move_len - 1] = current_move
            move[idx] = tmp

            return value, move

        def minvalue(chessboard, alpha, beta, act_color, depth, target_color):  # 更新 beta 值

            move, chessboard_list = self.get_next_board_and_move(chessboard=chessboard,
                                                                 color=act_color)  # 当前节点我所能看见的可走步数以及下之后对应的棋局
            if depth == 0 or len(move) == 0:
                return self.calculate_value(chessboard=chessboard, color=target_color), move

            current_value, current_move = math.inf, None
            idx = -1
            for i in range(len(chessboard_list)):
                next_value, next_move = maxvalue(chessboard=chessboard_list[i], alpha=alpha, beta=beta,
                                                 act_color=-act_color, target_color=target_color, depth=depth - 1)

                if next_value < current_value:
                    idx = i
                    current_value = next_value
                    current_move = move[i]
                    beta = min(beta, current_value)
                if beta <= alpha:
                    return current_value, current_move

            move_len = len(move)
            tmp = move[move_len - 1]
            move[move_len - 1] = current_move
            move[idx] = tmp

            return current_value, move

        return maxvalue(chessboard=chessboard, alpha=-math.inf, beta=math.inf, act_color=act_color,
                        target_color=target_color, depth=depth)


    # 位置权重计算，稳定子计算，行动力计算并加权
    def calculate_value(self, chessboard, color):


        # 位置权重计算，以及行动力计算
        location_weight = 0
        my_move = 0
        oppo_move = 0
        my_stable = 0
        oppo_stable = 0

        my_cnt = 0
        oppo_cnt = 0

        for i in range(8):
            for j in range(8):
                if stage < 10:

                    location_weight = location_weight + chessboard[i][j] * weighted_graph2[i][j]
                elif stage >= 10 and stage < 45:
                    location_weight = location_weight + chessboard[i][j] * weighted_graph1[i][j]
                else:
                    location_weight = location_weight + chessboard[i][j] * weighted_graph0[i][j]



        if color == COLOR_WHITE:
            location_weight = -location_weight


        if stage < 10: # 后期
            return location_weight #+ -15 * (my_stable - oppo_stable) + 10 * (my_move - oppo_move)# + -10 * (my_cnt - oppo_cnt)

        elif stage >= 10 and stage <= 50:
            return location_weight #+ -15 * (my_stable - oppo_stable) + 10 * (my_move - oppo_move)

        else: # 前期
            return location_weight #+ -15 * (my_stable - oppo_stable) + 10 * (my_move - oppo_move)



#
# if __name__ == '__main__':
#     board = \
#         [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
#          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
#          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
#          [0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 1, -1, 0, 0, 0, 0, 0, 0, 0],
#          [0, 0, 0, 0, 1, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, -1, -1, -1, 1, 0, 0, 0, 0, 0, 0],
#          [0, 0, 0, 0, 1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0],
#          [0, 0, 0, 0, 0, 0, 1, -1, -1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
#          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
#     board2 = \
#         [[0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 0, 1, 0, 1, 0, 1], [-1, 0, -1, 0, -1, 0, -1, 0],
#          [0, 1, 0, 1, 0, 1, 0, 1], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0],
#          [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0]]
#
#     board3 = \
#     [[0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 0, 1, 0, 1, 0, 1], [-1, 0, -1, 0, -1, 0, -1, 0], [0, 1, 0, 1, 0, 1, 0, 1],
#      [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0,0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0]]
#
#     board4 = \
#     [[1, 1, 1, 1, -1, -1, 0, 0], [1, 1, 1, 1, -1, 0, 0, 0], [1, 1, 1, -1, 0, -1, 0, 0], [-1, -1, -1, -1, 0, 0, 0, 0],
#      [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0]]
#
#     ai = AI(8, -1, 5000)
#
#     list = ai.go(board3)
#     print(ai.candidate_list)