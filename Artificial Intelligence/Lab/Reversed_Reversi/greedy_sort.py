import numpy as np
import random
import time
import functools

COLOR_BLACK=-1
COLOR_WHITE=1
COLOR_NONE=0
random.seed(0)

direction_x = [-1, 1, 0, 0, -1, -1, 1, 1]
direction_y = [0, 0, -1, 1, -1, 1, -1, 1]

weighted_graph = [[500,-25,10,5,5,10,-25,500],
                    [-25,-45,1,1,1,1,-45,-25],
                    [10,1,3,2,2,3,1,10],
                    [5,1,2,1,1,2,1,5],
                    [5,1,2,1,1,2,1,5],
                    [10,1,3,2,2,3,1,10],
                    [-25,-45,1,1,1,1,-45,-25],
                    [500,-25,10,5,5,10,-25,500]]

# don't change the class name
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
        black_idx = []
        white_idx = []
        none_idx = []
        self.candidate_list.clear()
        #==================================================================
        #Write your algorithm here
        #Here is the simplest sample:Random decision

        # 找出所有黑棋以及白棋的位置信息
        for i in range(self.chessboard_size):
            for j in range(self.chessboard_size):
                if chessboard[i][j] == COLOR_BLACK:
                    black_idx.append((i, j))
                elif chessboard[i][j] == COLOR_WHITE:
                    white_idx.append((i, j))
                else:
                    none_idx.append((i, j))
        if self.color == COLOR_BLACK:
            self.idx = black_idx
            self.oppose_idx = white_idx
        else:
            self.idx = white_idx
            self.oppose_idx = black_idx

        cnt_map = {}

        for i in self.idx:
            for j in range(8):
                my_x = i[0] + direction_x[j]
                my_y = i[1] + direction_y[j]
                cnt = 0
                see_oppose = False
                while (my_x, my_y) in self.oppose_idx:
                    see_oppose = True
                    cnt = cnt + 1
                    my_x = my_x + direction_x[j]
                    my_y = my_y + direction_y[j]
                if self.judge(my_x, my_y) and (my_x, my_y) in none_idx and see_oppose:
                    self.candidate_list.append((my_x, my_y))
                    cnt_map[(my_x, my_y)] = cnt

        def cmp(a, b):
            if cnt_map[a] == cnt_map[b]:
                return weighted_graph[a[0]][a[1]] - weighted_graph[b[0]][b[1]]
            return cnt_map[a] - cnt_map[b]

        self.candidate_list.sort(key=functools.cmp_to_key(cmp), reverse = True)


        # for i in self.candidate_list:
        #     dist = i[0] + i[1]
        #     dist = min(dist, abs(i[0] - self.chessboard_size) + i[1])
        #     dist = min(dist, abs(i[1] - self.chessboard_size) + abs(i[0] - self.chessboard_size))
        #     dist = min(dist, i[0] + abs(self.chessboard_size - i[1]))
        #     dist_map[i] = dist



    def judge(self, x: int, y: int) -> bool:
        if x >= 0 and x < self.chessboard_size and y >= 0 and y < self.chessboard_size:
            return True


    #==============Find new pos========================================
    # Make sure that the position of your decision in chess board is empty.
    # If not, the system will return error.
    # Add your decision into candidate_list, Records the chess board
    # You need add all the positions which is valid
    # candidate_list example: [(3,3),(4,4)]
    # You need append your decision at the end of the candidate_list,
    # we will pick the last element of the candidate_list as the position you choose
    # If there is no valid position, you must return an empty list
# #
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
#         [[0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0],
#          [0, 0, 0, -1, 1, 1, 0, 0], [0, 0, 0, 1, -1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0],
#          [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0]]
#
#     ai = AI(8, -1, 5000)
#
#     # score_m = ai.point_eva(5, 11, 1)
#     # score_e = ai.point_eva(10, 11, 1)
#     # print(score_m, score_e)
#     list = ai.go(board2)
#     print(ai.candidate_list)