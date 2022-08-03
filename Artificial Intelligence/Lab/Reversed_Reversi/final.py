import numpy as np
import random
import time
import math
import functools
import copy


COLOR_BLACK=-1
COLOR_WHITE=1
COLOR_NONE=0



# 上，下，左，右，左上，右下，左下，右上（判断方向）
direction_x = [-1, 1, 0, 0, -1, 1, 1, -1]
direction_y = [0, 0, -1, 1, -1, 1, -1, 1]

# 角位置
corners = [(0, 0), (7, 7), (0, 7), (7, 0)]

# 角周围

most_important = [(1, 1), (1, 6), (6, 6), (6, 1)]
important = [(0, 1), (1, 0), (0, 6), (1, 7), (7, 6), (6, 7), (6, 0), (7, 1)]
less_important = [(0, 2), (2, 0), (0, 5), (2, 7), (7, 5), (5, 7), (5, 0), (7, 2)]

# 对角线位置

pos_diag = [(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]
neg_diag = [(6, 1), (5, 2), (4, 3), (3, 4), (2, 5), (1, 6)]


# 权重来自 github
weighted_graph1 = [
    [3000, -65, -30, 15, 15,-30, -65, 3000],
    [-65, -40, 10, 8, 8, 10, -40, -65],
    [-30, -30, -30, 6, 6, -30, -30, -30],
    [15, 8, 6, 3, 3, 6, 8, 15],
    [15, 8, 6, 3, 3, 6, 8, 15],
    [-30, -30, -30, 2, 2, -30, -30, -30],
    [-65, -40, -30, 8, 8, -30, -40, -65],
    [3000, -65, -30, 15, 15, -30, -65, 3000]
    ]

important_weight = 3
corners_weight = 15
weight = [22, 7]

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
                if (move == (1, 1) or move == (6, 6)) and chessboard[0, 0] != target_color and chessboard[
                    7, 7] != target_color:
                    for diag in pos_diag:
                        if diag != move and chessboard[diag] != target_color:
                            next_value += 20
                            break

                elif (move == (1, 6) or move == (6, 1)) and chessboard[0, 7] != target_color and chessboard[
                    7, 0] != target_color:
                    for diag in neg_diag:
                        if diag != move and chessboard[diag] != target_color:
                            next_value += 20
                            break

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
                if (move == (1, 1) or move == (6, 6)) and chessboard[0, 0] != target_color and chessboard[
                    7, 7] != target_color:
                    for diag in pos_diag:
                        if diag != move and chessboard[diag] != target_color:
                            next_value += 20
                            break

                elif (move == (1, 6) or move == (6, 1)) and chessboard[0, 7] != target_color and chessboard[
                    7, 0] != target_color:
                    for diag in neg_diag:
                        if diag != move and chessboard[diag] != target_color:
                            next_value += 20
                            break

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


    def cal_stable(self, chessboard, color):
        chessboard = np.array(chessboard)
        score = 0
        stable = np.zeros([8, 8], dtype=np.int8)
        stable_points_number = 0
        stage = sum(sum(abs(chessboard)))
        for cn in corners:
            if chessboard[cn] == 0:
                for j in range(len(most_important)):
                    score -= important_weight * (
                            chessboard[important[2 * j][0]][important[2 * j][1]] +
                            chessboard[important[2 * j + 1][0]][important[2 * j + 1][1]]
                            + 0.5 * chessboard[most_important[j][0]][most_important[j][1]]
                    )
            else:
                score += corners_weight * chessboard[cn[0]][cn[1]]
                stable_points_number += chessboard[cn[0]][cn[1]]
                stable[cn[0]][cn[1]] = True
        for i in range(8):
            if chessboard[important[i]] == 0:
                score -= important_weight * chessboard[less_important[i]]

        direction = [(0, 1), (0, -1), (1, 0), (-1, 0), (0, -1), (0, 1), (-1, 0), (1, 0)]
        four_dir = [(0, -1), (-1, -1), (-1, 0), (-1, 1)]
        corners_temp = [(0, 0), (0, 7), (0, 7), (7, 7), (7, 7), (7, 0), (7, 0), (0, 0)]
        if stage >= 35:
            for i in range(4):  ## 搜索顶点出发四个边界的稳定子
                x = corners_temp[2 * i][0]
                y = corners_temp[2 * i][1]

                corner_color = chessboard[x][y]
                flag = False
                temp = 0
                for j in range(1, 7):
                    same = True
                    tx = x + j * direction[2 * i][0]
                    ty = y + j * direction[2 * i][1]
                    t = chessboard[tx][ty]
                    if t == 0:
                        break
                    elif same and t == corner_color:
                        stable_points_number += t
                        stable[tx][ty] = True
                    else:
                        same = False
                        temp += t
                    if j == 6:
                        flag = True
                if not (flag and chessboard[corners_temp[2 * i + 1][0]][corners_temp[2 * i + 1][1]] != 0):
                    x = corners_temp[2 * i + 1][0]
                    y = corners_temp[2 * i + 1][1]

                    corner_color = chessboard[x][y]
                    for j in range(1, 7):
                        same = True
                        temp = 0
                        tx = x + j * direction[2 * i + 1][0]
                        ty = y + j * direction[2 * i + 1][1]
                        t = chessboard[tx][ty]
                        if t == 0:
                            break
                        elif same and t == corner_color:
                            stable_points_number += t
                            stable[tx][ty] = True
                        else:
                            same = False
                            temp += t
                else:
                    stable_points_number += temp

        return (stable_points_number * weight[0] / 2 + sum(sum(stable)) * weight[0] / 2 + score * weight[1]) * color

    # 位置权重计算，稳定子计算，行动力计算并加权
    def calculate_value(self, chessboard, color):
        new_chessboard = np.array(chessboard)
        which_win = sum(sum(new_chessboard))
        stage = sum(sum(abs(new_chessboard)))

        total_score = 0


        #位置权重计算，以及行动力计算
        location_weight = 0
        my_move = 0
        oppo_move = 0
        my_stable = 0
        oppo_stable = 0

        move, boards = self.get_next_board_and_move(chessboard, color=color)

        # 棋盘结束状态，直接返回胜利值
        if len(move) == 0 or stage == 64:
            if (which_win > 0 and color == COLOR_WHITE) or (which_win < 0 and color == COLOR_BLACK):
                return 100000
            elif (which_win > 0 and color == COLOR_BLACK) or (which_win < 0 and color == COLOR_WHITE):
                return -100000
            else:
                return 100

        if stage > 35:
            total_score = total_score + self.cal_stable(chessboard=chessboard, color= color)

        for i in move:
            if i in important:
                total_score = total_score + 40

        for i in range(4):
            if new_chessboard[corners[i]] != color and new_chessboard[most_important[i]] == color and new_chessboard[important[2 * i]] == color and \
                    new_chessboard[
                        important[2 * i + 1]] == color:
                total_score = total_score - 70
                if new_chessboard[less_important[2 * i]] * new_chessboard[less_important[2 * i + 1]] == 0 and new_chessboard[less_important[2 * i]] == -color or \
                        new_chessboard[less_important[
                            2 * i + 1]] == -color:
                    total_score = total_score + 30
                elif new_chessboard[less_important[2 * i]] == 0 and new_chessboard[less_important[2 * i + 1]] == 0:
                    total_score = total_score - 10
                else:
                    total_score = total_score - 90
            elif new_chessboard[corners[i]] != color and new_chessboard[important[2 * i]] == color and new_chessboard[
                important[2 * i + 1]] == color:
                total_score = total_score - 50
            elif new_chessboard[important[2 * i]] == -color or new_chessboard[important[2 * i + 1]] == -color:
                total_score = total_score - 20



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

        total_score = total_score + location_weight


        return 0.8 * total_score + -15 * (my_stable - oppo_stable) + 10 * (my_move - oppo_move)

