import numpy as np
import random
import time
import math
import functools
import copy
import random

COLOR_BLACK=-1
COLOR_WHITE=1
COLOR_NONE=0
random.seed(0)

# 上，下，左，右，左上，右下，左下，右上
direction_x = [-1, 1, 0, 0, -1, 1, 1, -1]
direction_y = [0, 0, -1, 1, -1, 1, -1, 1]

# 权重来自 github
weighted_graph0 = [[500,-25,10,5,5,10,-25,500],
                    [-25,-45,1,1,1,1,-45,-25],
                    [10,1,3,2,2,3,1,10],
                    [5,1,2,1,1,2,1,5],
                    [5,1,2,1,1,2,1,5],
                    [10,1,3,2,2,3,1,10],
                    [-25,-45,1,1,1,1,-45,-25],
                    [500,-25,10,5,5,10,-25,500]]



class AI(object):
    #chessboard_size, color, time_out passed from agent
    chessboard_size = 0
    color = COLOR_NONE
    time_out = 5
    candidate_list = []
    start = 0
    my_idx = []
    oppose_idx = []
    def __init__(self, chessboard_size, color, time_out):
        self.chessboard_size = chessboard_size
    #You are white or black
        self.color = color
    #the max time you should use, your algorithm's run time must not exceed the time limit.
        self.time_out = time_out
    # You need add your decision into your candidate_list. System will get the end of your candidate_list as your decision .
        self.candidate_list = []
    # The input is current chessboard.


    def go(self, chessboard):
        # Clear candidate_list, must do this step
        self.candidate_list.clear()
        self.start = time.time()

        # 判断目前处于的时期
        stage = 0
        for i in range(self.chessboard_size):
            for j in range(self.chessboard_size):
                if self.judge(i, j) and chessboard[i][j] == 0:
                    stage = stage + 1
        value, move = 0, []


        depth = 3
        if stage < 7:
            value, move = self.alphabeta(chessboard=chessboard, depth=depth + 3, act_color=self.color,
                                         target_color=self.color, stage = stage)
        elif stage < 10:
            value, move = self.alphabeta(chessboard=chessboard, depth=depth + 2, act_color = self.color, target_color=self.color, stage = stage)
        elif stage < 50:
            value, move = self.alphabeta(chessboard=chessboard, depth = depth, act_color = self.color, target_color=self.color, stage = stage)
        else:
            value, move = self.alphabeta(chessboard=chessboard, depth=depth, act_color = self.color, target_color=self.color, stage = stage)


        self.candidate_list = move

    # 判断是否越界
    def judge(self, x: int, y: int) -> bool:
        if x >= 0 and x < self.chessboard_size and y >= 0 and y < self.chessboard_size:
            return True

    # 计算并返回可以走的点以及对应下一步的棋盘状态集合
    def get_next_board_and_move(self, chessboard, color):
        original_chessboard = copy.deepcopy(chessboard)

        move = []
        new_chessboard_list = []


        for i in range(8):
            for j in range(8):
                if original_chessboard[i][j] == color:
                    for direction in range(8):
                        see_oppo = False
                        x = i + direction_x[direction]
                        y = j + direction_y[direction]
                        while self.judge(x, y) and original_chessboard[x][y] == -color:
                            see_oppo = True
                            x = x + direction_x[direction]
                            y = y + direction_y[direction]

                        if self.judge(x, y) and original_chessboard[x][y] == 0 and (x, y) not in move and see_oppo:
                            move.append((x, y))

                            new_chessboard = copy.deepcopy(original_chessboard)
                            new_chessboard[x][y] = color

                            for z in range(8):
                                curr_x = x + direction_x[z]
                                curr_y = y + direction_y[z]
                                reverse_color_list = [] # 要吃的对手棋子
                                while self.judge(curr_x, curr_y) and original_chessboard[curr_x][curr_y] == -color:
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
    def alphabeta(self, chessboard, depth, act_color, target_color, stage):


        def maxvalue(chessboard, alpha, beta, act_color, depth, target_color, stage, last_step): # 更新 alpha 值


            move, chessboard_list = self.get_next_board_and_move(chessboard=chessboard, color = act_color) # 站在当前的棋盘状态下，我可以看见的可走步数以及相应的棋局

            if depth == 0 or len(move) == 0:
                if last_step == 0:
                # 走不动了
                    return self.calculate_value(chessboard=chessboard, color = target_color, stage = stage), move
                else:
                    return self.last_cal(chessboard = chessboard, color = target_color), move

            value, current_move = -math.inf, move[0]
            idx = -1
            for i in range(len(chessboard_list)):
                next_value, next_move = minvalue(chessboard=chessboard_list[i], alpha=alpha, beta = beta, act_color = -act_color, target_color=target_color,depth = depth - 1, stage = stage - 1, last_step=last_step)

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

        def minvalue(chessboard, alpha, beta, act_color, depth, target_color, stage, last_step): # 更新 beta 值

            move, chessboard_list = self.get_next_board_and_move(chessboard=chessboard, color = act_color) # 当前节点我所能看见的可走步数以及下之后对应的棋局

            if depth == 0 or len(move) == 0:
                if last_step == 0:
                # 走不动了
                    return self.calculate_value(chessboard=chessboard, color=target_color, stage=stage), move
                else:
                    return self.last_cal(chessboard=chessboard, color=target_color), move

            current_value, current_move = math.inf, None
            idx = -1
            for i in range(len(chessboard_list)):
                next_value, next_move = maxvalue(chessboard=chessboard_list[i], alpha = alpha, beta = beta, act_color= -act_color, target_color=target_color, depth=depth - 1, stage = stage - 1, last_step=last_step)

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

        if stage < 6:
            return maxvalue(chessboard=chessboard, alpha = -math.inf, beta = math.inf, act_color=act_color, target_color=target_color,depth = depth, stage = stage, last_step=1)
        else:
            return maxvalue(chessboard=chessboard, alpha=-math.inf, beta=math.inf, act_color=act_color,
                            target_color=target_color, depth=depth, stage=stage, last_step=0)

    def last_cal(self, chessboard, color):
        my_cnt = 0
        oppo_cnt = 0

        win = 100

        for i in range(8):
            for j in range(8):
                if chessboard[i][j] == color:
                    my_cnt = my_cnt +1
                elif chessboard[i][j] == -color:
                    oppo_cnt = oppo_cnt + 1
                else:
                    win = 0

        if win == 100:
            return win
        else:
            return -my_cnt + oppo_cnt

    # 位置权重计算，稳定子计算，行动力计算并加权
    def calculate_value(self, chessboard, color, stage):


        #位置权重计算，以及行动力计算
        location_weight = 0
        my_move = 0
        oppo_move = 0

        oppo_stable_list = []
        my_stable_list = []

        for i in range(len(chessboard)):
            for j in range(len(chessboard[0])):

                location_weight = location_weight + chessboard[i][j] * weighted_graph0[i][j]

                if chessboard[i][j] == color: # 己方行动力，己方稳定子
                    for z in range(8):
                        my_x = i + direction_x[z]
                        my_y = j + direction_y[z]
                        see_oppose = False
                        while self.judge(my_x, my_y) and chessboard[my_x][my_y] == -color:
                            see_oppose = True
                            my_x = my_x + direction_x[z]
                            my_y = my_y + direction_y[z]
                        if self.judge(my_x, my_y) and chessboard[my_x][my_y] == 0 and see_oppose:
                            my_move = my_move + 1 # 己方行动力 + 1

                        if z < 2 and (j == 0 or j == 7):  # 看第一列以及最后一列的边角情况是否有稳定子
                            if (i == 0 or i == 7):
                                my_stable_list.append((i, j))
                            else:
                                my_x = i + direction_x[z]
                                my_y = j + direction_y[z]

                                while self.judge(my_x, my_y) and chessboard[my_x][my_y] == color and (
                                        my_x, my_y) not in my_stable_list:
                                    my_x = my_x + direction_x[z]
                                    my_y = my_y + direction_y[z]

                                if not self.judge(my_x, my_y) or (my_x, my_y) in my_stable_list:
                                    my_stable_list.append((i, j))
                        elif z >= 2 and z < 4 and (i == 0 or i == 7):  # 看第一排以及最后一排的边角情况是否有稳定子
                            if (j == 0 or j == 7):
                                my_stable_list.append((i, j))
                            else:
                                my_x = i + direction_x[z]
                                my_y = j + direction_y[z]

                                while self.judge(my_x, my_y) and chessboard[my_x][my_y] == color and (
                                        my_x, my_y) not in my_stable_list:
                                    my_x = my_x + direction_x[z]
                                    my_y = my_y + direction_y[z]

                                if not self.judge(my_x, my_y) or (my_x, my_y) in my_stable_list:
                                    my_stable_list.append((i, j))


                elif chessboard[i][j] == -color: # 敌方行动力，敌方稳定子
                    for z in range(8):
                        oppo_x = i + direction_x[z]
                        oppo_y = j + direction_y[z]
                        see_oppose = False
                        while self.judge(oppo_x, oppo_y) and chessboard[oppo_x][oppo_y] == color:
                            see_oppose = True
                            oppo_x = oppo_x + direction_x[z]
                            oppo_y = oppo_y + direction_y[z]
                        if self.judge(oppo_x, oppo_y) and chessboard[oppo_x][oppo_y] == 0 and see_oppose:
                            oppo_move = oppo_move + 1

                            if z < 2 and (j == 0 or j == 7):  # 看第一列以及最后一列的边角情况是否有稳定子
                                if (i == 0 or i == 7):
                                    oppo_stable_list.append((i, j))
                                else:
                                    oppo_x = i + direction_x[z]
                                    oppo_y = j + direction_y[z]

                                    while self.judge(oppo_x, oppo_y) and chessboard[oppo_x][
                                        oppo_y] == -color and (
                                            oppo_x, oppo_y) not in my_stable_list:
                                        oppo_x = oppo_x + direction_x[z]
                                        oppo_y = oppo_y + direction_y[z]

                                    if not self.judge(oppo_x, oppo_y) or (oppo_x, oppo_y) in oppo_stable_list:
                                        oppo_stable_list.append((i, j))

                            elif z >= 2 and z < 4 and (i == 0 or i == 7):  # 看第一排以及最后一排的边角情况是否有稳定子
                                if (j == 0 or j == 7):
                                    oppo_stable_list.append((i, j))
                                else:
                                    oppo_x = i + direction_x[z]
                                    oppo_y = j + direction_y[z]

                                    while self.judge(oppo_x, oppo_y) and chessboard[oppo_x][
                                        oppo_y] == -color and (
                                            oppo_x, oppo_y) not in my_stable_list:
                                        oppo_x = oppo_x + direction_x[z]
                                        oppo_y = oppo_y + direction_y[z]

                                    if not self.judge(oppo_x, oppo_y) or (oppo_x, oppo_y) in oppo_stable_list:
                                        oppo_stable_list.append((i, j))

        my_stable = len(my_stable_list)
        oppo_stable = len(oppo_stable_list)

        if color == COLOR_WHITE:
            location_weight = -location_weight


        return location_weight + -15 * (my_stable - oppo_stable) + 10 * (my_move - oppo_move)

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
#     initial = \
#     [[0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, -1, 0, 0, 0],
#      [0, 0, 0, -1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0]]
#
#
#
#     ai = AI(8, -1, 5000)
#
#     list = ai.go(board3)
#     print(ai.candidate_list)
#
# # 判断是否越界
# def judge(self, x: int, y: int) -> bool:
#     if x >= 0 and x < 8 and y >= 0 and y < 8:
#         return True
#
#
# def get_next_board(chessboard, move, color):
#     x = move[0]
#     y = move[1]
#     next_board = copy.deepcopy(chessboard)
#     next_board[x][y] = color
#
#     for z in range(8):
#         curr_x = x + direction_x[z]
#         curr_y = y + direction_y[z]
#         reverse_color_list = []  # 要吃的对手棋子
#         while judge(curr_x, curr_y) and next_board[curr_x][curr_y] == -color:
#             reverse_color_list.append((curr_x, curr_y))
#             curr_x = curr_x + direction_x[z]
#             curr_y = curr_y + direction_y[z]
#
#         if judge(curr_x, curr_y) and next_board[curr_x][curr_y] == color:
#             for idx in reverse_color_list:
#                 next_board[idx[0]][idx[1]] = color
#
#     return next_board
#
#
# # 判断棋局是否结束
# def is_terminated(self, chessboard, color) -> bool:
#     has_black = False
#     has_white = False
#     can_move = False
#     cnt = 0
#     for i in range(self.chessboard_size):
#         for j in range(self.chessboard_size):
#             if not has_white and chessboard[i][j] == COLOR_WHITE:
#                 has_white = True
#             if not has_black and chessboard[i][j] == COLOR_BLACK:
#                 has_black = True
#             if chessboard[i][j] != 0:
#                 cnt = cnt + 1
#
#             if chessboard[i][j] == color:
#
#                 for dir in range(8):
#                     see_oppo = False
#                     x = i + direction_x[dir]
#                     y = j + direction_y[dir]
#                     while judge(x, y) and chessboard[x][y] == -color:
#                         x = x + direction_x[dir]
#                         y = y + direction_y[dir]
#                         see_oppo = True
#                     if judge(x, y) and see_oppo and chessboard[x][y] == 0:
#                         can_move = True
#                         break
#             if chessboard[i][j] == -color:
#
#                 for dir in range(8):
#                     see_oppo = False
#                     x = i + direction_x[dir]
#                     y = j + direction_y[dir]
#                     while judge(x, y) and chessboard[x][y] == color:
#                         x = x + direction_x[dir]
#                         y = y + direction_y[dir]
#                         see_oppo = True
#                     if judge(x, y) and see_oppo and chessboard[x][y] == 0:
#                         can_move = True
#                         break
#
#     if not has_black or not has_white or cnt == 64 or not can_move:
#         return True
#
#     return False