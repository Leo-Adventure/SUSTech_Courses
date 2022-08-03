import numpy as np
import random
import time
import math
import functools
import copy


COLOR_BLACK=-1
COLOR_WHITE=1
COLOR_NONE=0



# 上，下，左，右，左上，右下，左下，右上
direction_x = [-1, 1, 0, 0, -1, 1, 1, -1]
direction_y = [0, 0, -1, 1, -1, 1, -1, 1]

# 权重来自 github
weighted_graph1 = [[500,-25,10,5,5,10,-25,500],
                    [-25,-45,1,1,1,1,-45,-25],
                    [10,1,3,2,2,3,1,10],
                    [5,1,2,1,1,2,1,5],
                    [5,1,2,1,1,2,1,5],
                    [10,1,3,2,2,3,1,10],
                    [-25,-45,1,1,1,1,-45,-25],
                    [500,-25,10,5,5,10,-25,500]]

# 权重来自 CSDN
weighted_graph2 = [
        [70, -20, 20, 20, 20, 20, -15, 70],
	    [-20,-30,5,5,5,5,-30,-15],
	    [20,5,1,1,1,1,5,20],
	    [20,5,1,1,1,1,5,20],
	    [20,5,1,1,1,1,5,20],
        [20,5,1,1,1,1,5,20],
	    [-20,-30,5,5,5,5,-30,-15],
	    [70,-15,20,20,20,20,-15,70]]

stage = 0


class AI(object):

    #chessboard_size, color, time_out passed from agent
    chessboard_size = 0
    color = COLOR_NONE
    time_out = 5
    candidate_list = []
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
        # 判断目前处于的时期
        stage = 0
        for i in range(self.chessboard_size):
            for j in range(self.chessboard_size):
                if self.judge(i, j) and chessboard[i][j] == 0:
                    stage = stage + 1
        value, move = 0, []
        begin = time.time()

        depth = 3
        if stage < 5:
            value, move = self.alphabeta(chessboard=chessboard, depth=depth + 2, act_color=self.color,
                                         target_color=self.color)
        elif stage < 10:
            value, move = self.alphabeta(chessboard=chessboard, depth=depth + 2, act_color = self.color, target_color=self.color)
        elif stage >= 10 and stage < 50:
            value, move = self.alphabeta(chessboard=chessboard, depth = depth , act_color = self.color, target_color=self.color)
        else:
            value, move = self.alphabeta(chessboard=chessboard, depth=depth, act_color = self.color, target_color=self.color)
        end = time.time()
        print("time = {} s".format(end - begin))

        self.candidate_list = move

    # 判断是否越界
    def judge(self, x: int, y: int) -> bool:
        if x >= 0 and x < self.chessboard_size and y >= 0 and y < self.chessboard_size:
            return True

    # 计算并返回可以走的点以及对应下一步的棋盘状态集合
    def get_next_board_and_move(self, chessboard, color):
        # original_chessboard = copy.deepcopy(chessboard)

        move = []
        new_chessboard_list = []


        for i in range(8):
            for j in range(8):
                if chessboard[i][j] == color:
                    for direction in range(8):
                        see_oppo = False
                        x = i + direction_x[direction]
                        y = j + direction_y[direction]
                        while self.judge(x, y) and chessboard[x][y] == -color:
                            see_oppo = True
                            x = x + direction_x[direction]
                            y = y + direction_y[direction]

                        if self.judge(x, y) and chessboard[x][y] == 0 and (x, y) not in move and see_oppo:
                            move.append((x, y))
                            # print("original one")

                            new_chessboard = copy.deepcopy(chessboard)
                            new_chessboard[x][y] = color

                            for z in range(8):
                                curr_x = x + direction_x[z]
                                curr_y = y + direction_y[z]
                                reverse_color_list = [] # 要吃的对手棋子
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

        def maxvalue(chessboard, alpha, beta, act_color, depth, target_color): # 更新 alpha 值


            move, chessboard_list = self.get_next_board_and_move(chessboard=chessboard, color = act_color) # 站在当前的棋盘状态下，我可以看见的可走步数以及相应的棋局


            if depth == 0 or len(move) == 0: # 走不动了
                return self.calculate_value(chessboard=chessboard, color = target_color), move

            value, current_move = -math.inf, move[0]
            idx = -1
            for i in range(len(chessboard_list)):
                next_value, next_move = minvalue(chessboard=chessboard_list[i], alpha=alpha, beta = beta, act_color = -act_color, target_color=target_color,depth = depth - 1)
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

        def minvalue(chessboard, alpha, beta, act_color, depth, target_color): # 更新 beta 值

            move, chessboard_list = self.get_next_board_and_move(chessboard=chessboard, color = act_color) # 当前节点我所能看见的可走步数以及下之后对应的棋局
            if depth == 0 or len(move) == 0:
                return self.calculate_value(chessboard=chessboard, color=target_color), move

            current_value, current_move = math.inf, None
            idx = -1
            for i in range(len(chessboard_list)):
                next_value, next_move = maxvalue(chessboard=chessboard_list[i], alpha = alpha, beta = beta, act_color= -act_color, target_color=target_color, depth=depth - 1)

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

        return maxvalue(chessboard=chessboard, alpha = -math.inf, beta = math.inf, act_color=act_color, target_color=target_color,depth = depth)

    # 判断棋局是否结束
    def is_terminated(self, chessboard, color) -> bool:
        has_black = False
        has_white = False
        can_move = False
        cnt = 0
        for i in range(self.chessboard_size):
            for j in range(self.chessboard_size):
                if not has_white and chessboard[i][j] == COLOR_WHITE:
                    has_white = True
                if not has_black and chessboard[i][j] == COLOR_BLACK:
                    has_black = True
                if chessboard[i][j] != 0:
                    cnt = cnt + 1

                if chessboard[i][j] == color:

                    for dir in range(8):
                        see_oppo = False
                        x = i + direction_x[dir]
                        y = j + direction_y[dir]
                        while self.judge(x, y) and chessboard[x][y] == -color:
                            x = x + direction_x[dir]
                            y = y + direction_y[dir]
                            see_oppo = True
                        if self.judge(x, y) and see_oppo and chessboard[x][y] == 0:
                            can_move = True
                            break

        if not has_black or not has_white or cnt == self.chessboard_size * self.chessboard_size or not can_move:
            return True

        return False

    # 位置权重计算，稳定子计算，行动力计算并加权
    def calculate_value(self, chessboard, color):


        #位置权重计算，以及行动力计算
        location_weight = 0
        my_move = 0
        oppo_move = 0
        my_stable = 0
        oppo_stable = 0



        for i in range(len(chessboard)):
            for j in range(len(chessboard[0])):

                location_weight = location_weight + chessboard[i][j] * weighted_graph1[i][j]

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


                    for z in [0, 2, 4, 6]: # 判断稳定子
                        bound1_x = i + direction_x[z]
                        bound1_y = j + direction_y[z]
                        bound2_x = i + direction_x[z + 1]
                        bound2_y = j + direction_y[z + 1]
                        bound1_flag = False
                        bound2_flag = False
                        while self.judge(bound1_x , bound1_y) and chessboard[bound1_x][bound1_y] == color:
                            bound1_x = bound1_x + direction_x[z]
                            bound1_y = bound1_y + direction_y[z]
                        if not self.judge(bound1_x, bound1_y) or (self.judge(bound1_x, bound1_y) and chessboard[bound1_x][bound1_y] == 0):
                            bound1_flag = True


                        while self.judge(bound2_x, bound2_y) and chessboard[bound2_x][bound2_y] == color:
                            bound2_x = bound2_x + direction_x[z + 1]
                            bound2_y = bound2_y + direction_y[z + 1]
                        if not self.judge(bound2_x, bound2_y) or (self.judge(bound2_x, bound2_y) and chessboard[bound2_x][bound2_y] == 0):
                            bound2_flag = True

                        if bound1_flag and bound2_flag:
                            my_stable = my_stable + 1


                elif chessboard[i][j] == -color: # 敌方行动力，敌方稳定子
                    for z in range(8):
                        oppo_x = i + direction_x[z]
                        oppo_y = j + direction_y[z]
                        see_oppose = False
                        while self.judge(oppo_x, oppo_y) and chessboard[oppo_x][oppo_y] == color:
                            see_oppose = True
                            oppo_x = oppo_x + direction_x[j]
                            oppo_y = oppo_y + direction_y[j]
                        if self.judge(oppo_x, oppo_y) and chessboard[oppo_x][oppo_y] == 0 and see_oppose:
                            oppo_move = oppo_move + 1

                    for z in [0, 2, 4, 6]:
                        bound1_x = i + direction_x[z]
                        bound1_y = j + direction_y[z]
                        bound2_x = i + direction_x[z + 1]
                        bound2_y = j + direction_y[z + 1]
                        bound1_flag = False
                        bound2_flag = False
                        while self.judge(bound1_x, bound1_y) and chessboard[bound1_x ][bound1_y] == -color:
                            bound1_x = bound1_x + direction_x[z]
                            bound1_y = bound1_y + direction_y[z]

                        if not self.judge(bound1_x, bound1_y) or (self.judge(bound1_x, bound1_y) and chessboard[bound1_x][bound1_y] == 0):
                            bound1_flag = True


                        while self.judge(bound2_x, bound2_y) and chessboard[bound2_x][bound2_y] == -color:
                            bound2_x = bound2_x + direction_x[z + 1]
                            bound2_y = bound2_y + direction_y[z + 1]
                        if not self.judge(bound2_x, bound2_y) or (
                                self.judge(bound2_x, bound2_y) and chessboard[bound2_x][bound2_y] == 0):
                            bound2_flag = True

                        if bound1_flag and bound2_flag:
                            oppo_stable = oppo_stable + 1

        if color == COLOR_WHITE:
            location_weight = -location_weight

        front_score = self.frontier(chessboard=chessboard, color=color)*15

        # if stage < 10:
        #     return location_weight + -20 * (my_stable - oppo_stable) + -10 * (my_move - oppo_move)
        return location_weight + -15 * (my_stable - oppo_stable) + 10 * (my_move - oppo_move) + front_score

    def frontier(self, chessboard, color):
        my_cnt = 0
        oppo_cnt = 0
        for i in range(8):
            for j in range(8):
                if chessboard[i][j] == color:
                    for z in range(8):
                        if self.judge(i + direction_x[z], j +direction_y[z]) and chessboard[i + direction_x[z]][j +direction_y[z]] == 0:
                            my_cnt = my_cnt + 1
                elif chessboard[i][j] == -color:
                    for z in range(8):
                        if self.judge(i + direction_x[z], j +direction_y[z]) and chessboard[i + direction_x[z]][j +direction_y[z]] == 0:
                            oppo_cnt = oppo_cnt + 1

        return my_cnt - oppo_cnt




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