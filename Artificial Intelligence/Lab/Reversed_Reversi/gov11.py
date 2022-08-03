import numpy as np
import random
import time
from collections import deque

total_search = 0
COLOR_BLACK = -1
COLOR_WHITE = 1
COLOR_NONE = 0
random.seed(0)
max_time = 4.8
directions = [(1, 0), (0, 1), (-1, 0), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
corners = [(0, 0), (0, 7), (7, 7), (7, 0)]
neighbour = [(0, 2), (2, 0), (0, 5), (2, 7), (7, 5), (5, 7), (5, 0), (7, 2)]
dangers = [(0, 1), (1, 0), (0, 6), (1, 7), (7, 6), (6, 7), (6, 0), (7, 1)]
most_dangers = [(1, 1), (1, 6), (6, 6), (6, 1)]
nw_se = [(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6)]
ne_sw = [(6, 1), (5, 2), (4, 3), (3, 4), (2, 5), (1, 6)]
dr_three = [(0, 1)]
dangers_weight = 3
corners_weight = 15
frontier_weight = 15
mobility_weight = 25
parity_weight = 40
count_weight = 20
bo_weight = 1
weight = [22, 7]
maxN = 5
M = 100000000
board_weight = np.array([
    [300, -65, 20, 15, 15, 20, -65, 300],
    [-65, -25, 10, 8, 8, 10, -25, -65],
    [20, 10, 9, 6, 6, 9, 15, 20],
    [15, 8, 6, 3, 3, 6, 8, 15],
    [15, 8, 6, 3, 3, 6, 8, 15],
    [20, 10, 9, 2, 2, 9, 15, 20],
    [-65, -25, 10, 8, 8, 10, -35, -65],
    [300, -65, 20, 15, 15, 20, -65, 300]
])

can = []
time_start = 0


# don't change the class name
class AI(object):

    # chessboard_size, color, time_out passed from agent
    def __init__(self, chessboard_size, color, time_out):
        self.chessboard_size = chessboard_size
        # You are white or black
        self.color = color
        self.time_out = time_out
        # You need add your decision into your candidate_list. System will get the end of your candidate_list as your decision .
        self.candidate_list = []
        self.board_list = []

    # The input is current chessboard.
    def go(self, chessboard):
        global time_start
        time_start = time.time()
        # Clear candidate_list, must do this step
        global can
        global maxN
        can = self.candidate_list
        # self.candidate_list.clear()
        global count_weight
        # global frontier_weight
        global mobility_weight
        global bo_weight
        stage = sum(sum(abs(chessboard)))
        if stage < 10:
            depth = 5
        elif stage >= 25:
            depth = 5

        elif stage >= 46:
            weight[0] = 14
            depth = 7
            maxN = 7

            mobility_weight = 25

        elif stage >= 36:

            depth = 6
            mobility_weight = 20
        else:
            maxN = 6
            depth = 6
        self.candidate_list, t = get_candidates(chessboard, self.color)

        depth = 1
        while time.time() - time_start < max_time - 0.2 and depth < 30:
            depth += 1
            if time.time() - time_start < random.random() / 1.5:
                depth += 1
            maxN = depth + 1
            if len(self.candidate_list) != 0:
                time_temp = time.time()

                v, ans = pvs(chessboard, -M, M, depth, self.color, self.color, depth)
                if time.time() - time_start < max_time:
                    print(
                        f"when depth={depth}，time cost {time.time() - time_temp}, total time {time.time() - time_start} pvs")
                    self.candidate_list.append(ans)
        print(f"search depth: {depth - 1}")

        print(time.time() - time_start)



def get_candidates(chessboard, color):
    global total_search
    time1 = time.time()
    candidate_list = []
    moves = []
    for i in range(8):
        for j in range(8):
            if chessboard[i][j] == 0:
                temp = chessboard.copy()
                if place_chess(temp, color, i, j):
                    candidate_list.append(temp)
                    moves.append((i, j))
    total_search += time.time() - time1
    return moves, candidate_list


def place_chess(board, color, x, y):
    flag = False
    board[x][y] = color
    for i in range(8):
        tx = x + directions[i][0]
        ty = y + directions[i][1]
        while 8 > tx >= 0 and 8 > ty >= 0 and board[tx][ty] == -color:
            tx += directions[i][0]
            ty += directions[i][1]
        if 8 > tx >= 0 and 8 > ty >= 0 and board[tx][ty] == color:
            tx -= directions[i][0]
            ty -= directions[i][1]
            while tx != x or ty != y:
                board[tx][ty] = color
                tx -= directions[i][0]
                ty -= directions[i][1]
                flag = True
    return flag


outer_danger = [()]


def evaluation_stable(chessboard, color):
    score = 0
    stable = np.zeros([8, 8], dtype=np.int8)
    stable_points_number = 0
    stage = sum(sum(abs(chessboard)))
    for cn in corners:
        if chessboard[cn] == 0:
            for j in range(len(most_dangers)):
                score -= dangers_weight * (
                        chessboard[dangers[2 * j][0]][dangers[2 * j][1]] +
                        chessboard[dangers[2 * j + 1][0]][dangers[2 * j + 1][1]]
                        + 0.5 * chessboard[most_dangers[j][0]][most_dangers[j][1]]
                )
        else:
            score += corners_weight * chessboard[cn[0]][cn[1]]
            stable_points_number += chessboard[cn[0]][cn[1]]
            stable[cn[0]][cn[1]] = True
    for i in range(8):
        if chessboard[dangers[i]] == 0:
            score -= dangers_weight * chessboard[neighbour[i]]
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


def stability(chessboard, now_color):
    my_stability = 0
    op_stability = 0
    size = 8
    steady_board = np.zeros((8, 8))
    pq = deque([(0, 0), (7, 0), (0, 7), (7, 7)])

    def check_steady(y, x):
        if x < 0 or x >= 8 or y < 0 or y >= 8:
            return 3
        if abs(steady_board[y, x]) == 1:
            return steady_board[y, x]
        return 2

    while pq:
        y, x = pq.popleft()
        if x < 0 or x >= size or y < 0 or y >= size:
            continue
        if steady_board[y, x] != 0:
            continue
        color = chessboard[y, x]
        if color == 0:
            steady_board[y, x] = 2
            continue
        for dy, dx in [(0, 1), (1, 1), (1, 0), (1, -1)]:
            dir1 = check_steady(y + dy, x + dx)
            dir2 = check_steady(y - dy, x - dx)
            one_side_empty = dir1 == 3 or dir2 == 3
            one_side_steady = dir1 == color or dir2 == color
            two_side_enemy_steady = dir1 == -color and dir2 == -color
            if not (one_side_empty or one_side_steady or two_side_enemy_steady):
                steady_board[y, x] = 2
                break
        if steady_board[y, x] == 0:
            steady_board[y, x] = color
            if color == now_color:
                my_stability += 1
            if color == -now_color:
                op_stability += 1
        pq.extend([(y + 1, x), (y - 1, x), (y, x + 1), (y, x - 1)])

    return 60 * (my_stability - op_stability) // (my_stability + op_stability + 1)


def frontiers(board):
    num = 0
    for m in range(1, 7):
        for j in range(1, 7):
            if board[m][j] == 0:
                continue
            else:
                for d in directions:
                    tx = m + d[0]
                    ty = j + d[1]
                    if board[tx][ty] == 0:
                        num -= board[m][j]
                        break
    return num


def cal_score(board, color, last_mobility): # 重点在于估值函数
    stage = sum(sum(abs(board)))
    stage2 = sum(sum(board))
    score = 0
    candidates, boards = get_candidates(board, -color)
    if stage >= 25:
        score += evaluation_stable(board, color) # 后期开始计算稳定子
    parity = 0

    if stage > 46:
        if stage % 2 == 0:
            parity = -color
        else:
            parity = color
    if abs(stage2) == stage:
        score += color * 100 * stage2
    if (last_mobility == 0 and len(candidates) == 0) or stage == 64: # 棋局结束返回极大值
        if stage2 * color > 0:
            return -10000000
        elif stage2 == 0:
            return 1000
        else:
            return 10000000

    if candidates in dangers:
        score += 40
    for i in range(4):
        if board[corners[i]] != color and board[most_dangers[i]] == color and board[dangers[2 * i]] == color and board[
            dangers[2 * i + 1]] == color:
            score -= 70
            if board[neighbour[2 * i]] * board[neighbour[2 * i + 1]] == 0 and board[neighbour[2 * i]] == -color or \
                    board[neighbour[
                        2 * i + 1]] == -color:
                score += 30
            elif board[neighbour[2 * i]] == 0 and board[neighbour[2 * i + 1]] == 0:
                score -= 10
            else:
                score -= 90
        elif board[corners[i]] != color and board[dangers[2 * i]] == color and board[
            dangers[2 * i + 1]] == color:
            score -= 50
        elif board[dangers[2 * i]] == -color or board[dangers[2 * i + 1]] == -color:
            score += 20
        # elif board[dangers[2 * i]] == -color and board[dangers[2 * i + 1]] == -color:
        #     score += 40
    temp_dan = [(0, 1), (0, 6), (1, 7), (6, 7), (7, 6), (7, 1), (6, 0), (1, 0)]
    if board[temp_dan[0]] != color and board[temp_dan[1]] != color:
        score += sum(board[0, 1:6]) * color * 20
    if board[temp_dan[2]] != color and board[temp_dan[3]] != color:
        score += sum(board[1:6, 7]) * color * 20
    if board[temp_dan[4]] != color and board[temp_dan[5]] != color:
        score += sum(board[7, 1:6]) * color * 20
    if board[temp_dan[6]] != color and board[temp_dan[7]] != color:
        score += sum(board[1:6, 0]) * color * 20
    if stage >= 30:
        score += weight[0] * stability(board, color)
    score += frontiers(board) * frontier_weight * color
    score += stage2 * color * count_weight
    score += parity * parity_weight * color
    score -= (last_mobility - len(candidates)) * mobility_weight
    score += sum(sum(board * board_weight)) * color * bo_weight
    if last_mobility == 0:
        score -= 300
    return -score


def pvs(board, alpha, beta, depth, now_color, my_color, max_depth):
    if time.time() - time_start > max_time:
        return 0, (-1. - 1)
    best_value = -M
    best_move = []
    moves, board_list = get_candidates(board, now_color)
    if depth == 0 or len(moves) == 0:
        return cal_score(board, now_color, len(moves)), []

    if depth >= max_depth - 2 and max_depth != 2 and max_depth != 3 and sum(sum(abs(board))) < 50:
        new_moves = []
        for i in range(len(board_list)):
            move = moves[i]
            chessboard = board_list[i]
            value, best = alphabeta(chessboard, 1, -M, M, -now_color, my_color, max_depth)

            if (move == (1, 1) or move == (6, 6)) and chessboard[0, 0] != my_color and chessboard[
                7, 7] != my_color:
                for diag in nw_se:
                    if diag != move and chessboard[diag] != my_color:
                        value += 20
                        break

            elif (move == (1, 6) or move == (6, 1)) and chessboard[0, 7] != my_color and chessboard[
                7, 0] != my_color:
                for diag in ne_sw:
                    if diag != move and chessboard[diag] != my_color:
                        value += 20
                        break

            new_moves.append(value)
        ind = np.argsort(new_moves)
        moves = [moves[i] for i in ind[0:maxN]]
        board_list = [board_list[i] for i in ind[0:maxN]]

    for i in range(len(moves)):
        now_board = board_list[i]
        if best_value == -M:
            score, move = pvs(now_board, - beta, -alpha, depth - 1, -now_color, my_color, max_depth)
            score = -score
        else:
            score, move = pvs(now_board, -alpha - 1, -alpha, depth - 1, -now_color, my_color, max_depth)
            score = -score
            if alpha < score < beta:
                alpha = score
                score, move = pvs(now_board, -beta, -alpha, depth - 1, -now_color, my_color, max_depth)
                score = -score
        if score >= beta:
            if time.time() - time_start > 4.9:
                return 0, (-1. - 1)
            else:
                return score, moves[i]
        if score > best_value:
            best_value = score
            best_move = moves[i]
            if score > alpha:
                alpha = score
    if time.time() - time_start > 4.9:
        return 0, (-1. - 1)
    else:
        return best_value, best_move


def alphabeta(board, depth, alpha, beta, now_color, my_color, max_depth):
    if time.time() - time_start > max_time:
        return 0, (-1. - 1)
    moves, board_list = get_candidates(board, now_color)
    if depth == 0:
        return cal_score(board, now_color, len(moves)), []
    if len(moves) == 0:
        return cal_score(board, now_color, len(moves)), []
    if depth >= max_depth - 2 and max_depth != 2 and max_depth != 3 and sum(sum(abs(board))) < 50:
        new_moves = []
        for i in range(len(board_list)):
            move = moves[i]
            chessboard = board_list[i]
            value, best = alphabeta(board_list[i], 1, -M, M, -now_color, my_color, max_depth)

            if (move == (1, 1) or move == (6, 6)) and chessboard[0, 0] != my_color and chessboard[
                7, 7] != my_color:
                for diag in nw_se:
                    if diag != move and board_list[i][diag] != my_color:
                        value += 20
                        break

            elif (move == (1, 6) or move == (6, 1)) and chessboard[0, 7] != my_color and chessboard[
                7, 0] != my_color:
                for diag in ne_sw:
                    if diag != move and board_list[i][diag] != my_color:
                        value += 20
                        break

            new_moves.append(value)
        ind = np.argsort(new_moves)
        moves = [moves[i] for i in ind[0:maxN]]
        board_list = [board_list[i] for i in ind[0:maxN]]
    best = []
    max_score = -M
    for i in range(len(board_list)):
        score, t = alphabeta(board_list[i], depth - 1, -beta, -max(alpha, max_score), -now_color, my_color,
                             max_depth)
        score = -score
        if score > max_score:
            max_score = score
            best = moves[i]
            if max_score > beta:
                if time.time() - time_start > 4.9:
                    return 0, (-1. - 1)
                else:
                    return max_score, best
    if time.time() - time_start > 4.9:
        return 0, (-1. - 1)
    else:
        return max_score, best
