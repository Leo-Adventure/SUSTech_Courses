# ver2.0 single point evaluation, reduce time complexity

import time
import random
import numpy as np

COLOR_BLACK = -1
COLOR_WHITE = 1
COLOR_NONE = 0
r_2 = 30  # 冲二
l_2 = 100  # 活二
tc_3 = 300  # 跳冲三
r_3 = 50  # 冲三
l_3 = 450  # 活三
tc_4 = 250  # 跳冲四
r_4 = 300  # 冲四
l_4 = 2000  # 活四
l_5 = 20000  # 活五


class AI(object):
    def __init__(self, chessboard_size, color, time_out):
        self.chessboard_size = chessboard_size
        self.color = color
        self.chessboard = None
        self.time_out = time_out
        self.candidate_list = []

    def go(self, chessboard):
        stime = time.time()
        self.chessboard = chessboard
        self.candidate_list.clear()
        self.numMAX = 5
        self.global_max = -10000000
        self.pre_depth = 4
        self.empty = [[0 for i in range(self.chessboard_size)] for i in range(self.chessboard_size)]
        self.score = [[0 for i in range(self.chessboard_size)] for i in range(self.chessboard_size)]
        self.myScore = [[0 for i in range(self.chessboard_size)] for i in range(self.chessboard_size)]
        self.enScore = [[0 for i in range(self.chessboard_size)] for i in range(self.chessboard_size)]
        self.pos = [[0 for i in range(self.chessboard_size)] for i in range(self.chessboard_size)]
        for i in range(self.chessboard_size):  # 给棋盘划分层，最外为0，向内increment
            row = [self.chessboard_size // 2 - max(abs(i - self.chessboard_size // 2),
                                                   abs(j - self.chessboard_size // 2))
                   for j in range(self.chessboard_size)]
            self.pos[i] = row


        if self.is_empty():
            self.candidate_list.append((7, 7))
        else:
            self.minmax(self.color, self.pre_depth)
        print(time.time() - stime)

    def is_empty(self):
        res = True
        for i in range(self.chessboard_size):
            for j in range(self.chessboard_size):
                if self.chessboard[i][j] != COLOR_NONE:
                    res = False
        return res


    def minmax(self, color, depth, alpha=-1000000, beta=1000000):
        if depth <= 0:
            return self.global_eva()
        moves = self.next_move()
        if color == self.color:
            mscore = 0
            escore = 0
            go = tuple()
            for i in range(len(moves)):
                x = moves[i][0]
                y = moves[i][1]
                if mscore < self.myScore[x][y]:
                    mscore = self.myScore[x][y]
                    go = (x, y)
                if escore < self.enScore[x][y]:
                    escore = self.enScore[x][y]
            if mscore >= escore and mscore >= 2000:
                alpha = l_5
                if depth == self.pre_depth:
                    self.global_max = l_5
                    self.candidate_list.append(go)
                return alpha
            elif escore > mscore and escore >= 2000:
                for i in range(len(moves)):
                    x = moves[i][0]
                    y = moves[i][1]
                    if escore == self.enScore[x][y]:
                        self.chessboard[x][y] = color
                        self.score_mod(x, y)
                        score = self.minmax(-color, depth - 1, alpha, beta)
                        if depth == self.pre_depth and score > self.global_max:
                            self.candidate_list.append((x, y))
                            self.global_max = score
                        self.chessboard[x][y] = COLOR_NONE
                        self.score_mod(x, y)
                        if score > alpha:
                            alpha = score
                        if alpha >= beta:
                            return alpha
                return alpha
            for i in range(len(moves)):
                x = moves[i][0]
                y = moves[i][1]
                self.chessboard[x][y] = color
                self.score_mod(x, y)
                score = self.minmax(-color, depth - 1, alpha, beta)
                if depth == self.pre_depth and score > self.global_max:
                    self.candidate_list.append((x, y))
                    self.global_max = score
                self.chessboard[x][y] = COLOR_NONE
                self.score_mod(x, y)
                if score > alpha:
                    alpha = score
                if alpha >= beta:
                    return alpha
            return alpha
        else:
            mscore = 0
            escore = 0
            for i in range(len(moves)):
                x = moves[i][0]
                y = moves[i][1]
                if mscore < self.myScore[x][y]:
                    mscore = self.myScore[x][y]
                if escore < self.enScore[x][y]:
                    escore = self.enScore[x][y]
            if mscore <= escore and escore >= 2000:
                beta = -l_5
                return beta
            elif mscore > escore and mscore >= 2000:
                for i in range(len(moves)):
                    x = moves[i][0]
                    y = moves[i][1]
                    if mscore == self.myScore[x][y]:
                        self.chessboard[x][y] = color
                        self.score_mod(x, y)
                        score = self.minmax(-color, depth - 1, alpha, beta)
                        self.chessboard[x][y] = COLOR_NONE
                        self.score_mod(x, y)
                        if score < beta:
                            beta = score
                        if alpha >= beta:
                            return beta
                return beta
            for i in range(len(moves)):
                x = moves[i][0]
                y = moves[i][1]
                self.chessboard[x][y] = color
                self.score_mod(x, y)
                # if x == 13 and y == 7 and depth == 3:
                #     debug = -1
                score = self.minmax(-color, depth - 1, alpha, beta)
                self.chessboard[x][y] = COLOR_NONE
                self.score_mod(x, y)
                if score < beta:
                    beta = score
                if alpha >= beta:
                    return beta
            return beta

    def point_eva(self, x, y, color):
        score = 0
        mapp = {
            'r_2': 0,  # 冲二
            'tc_3': 0,  # 跳冲三
            'l_2': 0,  # 活二
            'r_3': 0,  # 冲三
            'l_3': 0,  # 活三
            'tc_4': 0,  # 跳冲四
            'r_4': 0,  # 冲四
            'l_4': 0,  # 活四
            'l_5': 0  # 活五
        }
        self.evaluate_horizon(x, y, mapp, color)
        self.evaluate_vertical(x, y, mapp, color)
        self.evaluate_left_diag(x, y, mapp, color)
        self.evaluate_right_diag(x, y, mapp, color)
        count_4 = mapp['r_4'] + mapp['tc_4']
        count_3 = mapp['l_3'] + mapp['tc_3']
        if mapp['l_5'] >= 1:
            return l_5
        elif mapp['l_4'] >= 1 or count_4 >= 2 or (count_4 and count_3):
            return l_4 + 100
        elif count_3 >= 2:
            # 降低双三优先级，双三两步必杀，沖四活三，双沖四一步必杀
            return l_4
        else:
            score = mapp['r_2'] * r_2 + mapp['l_2'] * l_2 + mapp['r_3'] * r_3 + \
                    mapp['tc_3'] * tc_3 + mapp['l_3'] * l_3 + mapp['r_4'] * r_4 + mapp['tc_4'] * tc_4 + \
                    mapp['l_4'] * l_4 + mapp['l_5'] * l_5
        return score

    def global_eva(self):
        summation = 0
        for i in range(self.chessboard_size):
            for j in range(self.chessboard_size):
                if self.chessboard[i][j] == COLOR_NONE:
                    summation += self.myScore[i][j] - self.enScore[i][j]
        return summation

    def evaluate_horizon(self, x, y, mapp, color):
        line = [0 for i in range(self.chessboard_size)]
        for p in range(self.chessboard_size):
            line[p] = self.chessboard[x][p]
        self.evaluate_line(line, self.chessboard_size, y, mapp, color)

    def evaluate_vertical(self, x, y, mapp, color):
        line = [0 for i in range(self.chessboard_size)]
        for p in range(self.chessboard_size):
            line[p] = self.chessboard[p][y]
        self.evaluate_line(line, self.chessboard_size, x, mapp, color)

    def evaluate_left_diag(self, x, y, mapp, color):
        line = [0 for i in range(self.chessboard_size)]
        maxx = self.chessboard_size - 1
        i = j = 0
        if x < y:
            i = y - x
            j = 0
        else:
            i = 0
            j = x - y
        k = 0
        while k < self.chessboard_size:
            if i + k > maxx or j + k > maxx:
                break
            line[k] = self.chessboard[j + k][i + k]
            k += 1
        self.evaluate_line(line, k, y - i, mapp, color)

    def evaluate_right_diag(self, x, y, mapp, color):
        line = [0 for i in range(self.chessboard_size)]
        i = j = 0
        if self.chessboard_size - 1 - x < y:
            i = y - self.chessboard_size + 1 + x
            j = self.chessboard_size - 1
        else:
            i = 0
            j = x + y
        k = 0
        while k < self.chessboard_size:
            if i + k > self.chessboard_size - 1 or j - k < 0:
                break
            line[k] = self.chessboard[j - k][i + k]
            k += 1
        self.evaluate_line(line, k, y - i, mapp, color)

    def evaluate_line(self, line, num, pos, mapp, color):
        if num < 5:
            return
        for i in range(num, self.chessboard_size):
            line[i] = 0xf
        stone = color
        l_c = [0, 0]
        l_e = [0, 0]
        r_c = [0, 0]
        r_e = [0, 0]
        pointer1 = pos
        pointer1 -= 1
        while pointer1 >= 0 and line[pointer1] == stone:
            pointer1 -= 1
            l_c[0] += 1
        while pointer1 >= 0 and line[pointer1] == COLOR_NONE:
            pointer1 -= 1
            l_e[0] += 1
        while pointer1 >= 0 and line[pointer1] == stone:
            pointer1 -= 1
            l_c[1] += 1
        while pointer1 >= 0 and line[pointer1] == COLOR_NONE:
            pointer1 -= 1
            l_e[1] += 1
        pointer2 = pos
        pointer2 += 1
        while pointer2 < num and line[pointer2] == stone:
            pointer2 += 1
            r_c[0] += 1
        while pointer2 < num and line[pointer2] == COLOR_NONE:
            pointer2 += 1
            r_e[0] += 1
        while pointer2 < num and line[pointer2] == stone:
            pointer2 += 1
            r_c[1] += 1
        while pointer2 < num and line[pointer2] == COLOR_NONE:
            pointer2 += 1
            r_e[1] += 1
        _range = l_c[0] + r_c[0] + 1
        if _range >= 5:
            mapp['l_5'] += 1
        elif _range == 4:
            if l_e[0] >= 1 and r_e[0] >= 1:
                mapp['l_4'] += 1
            elif l_e[0] >= 1 or r_e[0] >= 1:
                mapp['r_4'] += 1
        elif _range == 3:
            tc_4_flag = False
            if (l_e[0] == 1 and l_c[1] >= 1) or (r_e[0] == 1 and r_c[1] >= 1):
                mapp['tc_4'] += 1
                tc_4_flag = True
            if (not tc_4_flag) and (l_e[0] + r_e[0] >= 3) and l_e[0] >= 1 and r_e[0] >= 1:
                mapp['l_3'] += 1
            elif l_e[0] + r_e[0] >= 1:
                mapp['r_3'] += 1
        elif _range == 2:
            tc_4_flag = False
            if (l_e[0] == 1 and l_c[1] >= 2) or (r_e[0] == 1 and r_c[1] >= 2):
                mapp['tc_4'] += 1
                tc_4_flag = True
            if (not tc_4_flag) and ((l_c[1] == 1 and l_e[0] == 1 and r_e[0] >= 1 and l_e[1] >= 1) or
                                    (r_c[1] == 1 and r_e[0] == 1 and l_e[0] >= 1 and r_e[1] >= 1)):
                mapp['tc_3'] += 1
            elif (l_e[0] == 1 and l_c[1] == 1 and r_e[0] + l_e[1] >= 1) or \
                    (r_e[0] == 1 and r_c[1] == 1 and r_e[1] + l_e[0] >= 1):
                mapp['r_3'] += 1
            if l_e[0] + r_e[0] >= 4 and l_e[0] >= 1 and r_e[0] >= 1:
                mapp['l_2'] += 1
        elif _range == 1:
            tc_4_flag = False
            if (l_e[0] == 1 and l_c[1] >= 3) or (r_e[0] == 1 and r_c[1] >= 3):
                mapp['tc_4'] += 1
                tc_4_flag = True
            if (not tc_4_flag) and (l_e[0] == 1 and l_c[1] == 2 and l_e[1] >= 1 and r_e[0] >= 1) or \
                    (r_e[0] == 1 and r_c[1] == 2 and r_e[1] >= 1 and l_e[0] >= 1):
                mapp['tc_3'] += 1
            elif (r_e[0] == 1 and r_c[1] == 2 and l_e[0] + r_e[1] >= 1) or \
                    (l_e[0] == 1 and l_c[1] == 2 and r_e[0] + l_e[1] >= 1):
                mapp['r_3'] += 1
            if (l_e[0] == 1 and l_c[1] == 1 and r_e[0] + l_e[1] >= 3 and r_e[0] >= 1 and l_e[
                1] >= 1) or (r_e[0] == 1 and r_c[1] == 1 and l_e[0] + r_e[1] >= 3 and l_e[0] >= 1
                             and r_e[1] >= 1):
                mapp['r_2'] += 1
            if (l_e[0] == 2 and l_c[1] == 1 and r_e[0] >= 1 and l_e[1] >= 1) or \
                    (r_e[0] == 2 and r_c[1] == 1 and l_e[0] >= 1 and r_e[1] >= 1):
                mapp['r_2'] += 1

    def next_move(self):
        # 产生下一步走的点集
        move_list = list()
        sort_list = list()
        if self.score == self.empty:
            for i in range(0, self.chessboard_size):
                for j in range(0, self.chessboard_size):
                    if self.chessboard[i][j] == COLOR_NONE:
                        if i == 9 and j == 4:
                            s = 'debug'
                        mscore = self.point_eva(i, j, self.color)
                        escore = self.point_eva(i, j, -self.color)
                        self.score[i][j] = mscore + escore
                        self.myScore[i][j] = mscore
                        self.enScore[i][j] = escore
                        sort_list.append((self.score[i][j] + self.pos[i][j], i, j))
        else:
            for i in range(0, self.chessboard_size):
                for j in range(0, self.chessboard_size):
                    if self.chessboard[i][j] == COLOR_NONE:
                        sort_list.append((self.score[i][j] + self.pos[i][j], i, j))
        sort_list.sort()
        sort_list.reverse()
        number = 0
        for i in range(len(sort_list)):
            if number == self.numMAX:
                break
            if self.chessboard[sort_list[i][1]][sort_list[i][2]] == COLOR_NONE:
                move_list.append((sort_list[i][1], sort_list[i][2]))
                number = number + 1
        return move_list

    def score_mod(self, x, y):
        # 向八个方向拓展更新
        dir = [[1, 0], [0, 1], [-1, 0], [0, -1], [1, -1], [-1, 1], [1, 1], [-1, -1]]
        for i in range(len(dir)):
            _x = x + dir[i][0]
            _y = y + dir[i][1]
            while 0 <= _x < self.chessboard_size and 0 <= _y < self.chessboard_size:
                num = 0
                if num >= 5:
                    break
                if self.chessboard[_x][_y] == COLOR_NONE:
                    myscore = self.point_eva(_x, _y, self.color)
                    escore = self.point_eva(_x, _y, -self.color)
                    self.score[_x][_y] = myscore + escore
                    self.myScore[_x][_y] = myscore
                    self.enScore[_x][_y] = escore
                    num += 1
                _x = _x + dir[i][0]
                _y = _y + dir[i][1]


if __name__ == '__main__':
    board = \
        [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 1, -1, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 1, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, -1, -1, -1, 1, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 1, -1, -1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

    board2 = \
        [[0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, -1, 1, 0, 0, 0], [0, 0, 0, 1, -1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0]]
    ai = AI(8, -1, 5000)
    # score_m = ai.point_eva(5, 11, 1)
    # score_e = ai.point_eva(10, 11, 1)
    # print(score_m, score_e)
    list = ai.go(board2)
    print(ai.candidate_list)