## AI 期末复习

> Author: MQ-Adventure
>
> Duration:  Summer Semester
### 考点回顾

刚刚考完期末考试，来回顾一波考点

SVM一道大题，考软硬间隔的函数表示，核函数对时间空间复杂度的影响，对偶问题的优势

感知机和神经元：讲一下感知机原理，画出神经网络的拓扑图

cluster聚类，写出数学表示（formulation），两种和聚类相关的算法以及伪代码

逻辑一道大题，考的很简单，主要涉及一阶逻辑的表示以及 CNF 的化简

搜索，各种搜索（BFS,DFS,UCS, A*）跑一遍图

AC3算法的伪代码以及时间复杂度

混淆矩阵！

零和博弈，考ab剪枝



贝叶斯和决策树竟然没考？！气抖冷

[TOC]

### Intelligence Agents

#### Agent

Agent: perceiving and acting according to environment

running cycle: (1) perceive (2) think (3) act

**Agent = Architeture + Program**

Agent function: mapping from **percepts** to **actions**

#### Rational Agent

对每个可能的感知序列，根据已知的感知序列提供的证据和 Agent 具有的先验知识，理性 Agent 选择使其性能度量最大化的行动(maximize its expected performance)

#### PEAS

定义理性智能体时，使用 PEAS: 

- Performance（性能）
- Environment（环境）
- Actuators（执行器）
- Sensors（传感器）

#### Environment Types

完全可观测（Fully Observable）

确定性（Deterministic）

连续性（Episodic）

静态（Static）：环境是否会在决策时变化

离散（Discrete）

单/多智能体（Single/ multi）

已知（known）

#### Agent Types

- Simple Reflex Agents（环境必须是完全可观测）

- Model-Based Reflex Agents（根据感知历史序列来处理部分可观测的环境）
- Goal-Based Agents（以目标为行动指引，结合目标以及环境模型考虑未来状态进行决策）
- Utility-Based Agents（在目标之外，还追求效益）

#### Learning Agents

Four conceptual components

1. Learning element（负责做出改进）
2. Performance element（负责选择行动）
3. Critic（评价智能体做得多好）
4. Problem generator（使得智能体进行探索）（牺牲短期性能，使得长期更好）

#### Agent states

- Atomic Representation （原子表示）（只关心智能体位置，不关心内部状态）
- Factored Representation （要素化表示）（每个状态有属性值）
- Structured Representation（结构化表示）（能够表示对象之间的关系）

### Uninformed Search

#### Problem Formulation

- Initial state
- State
- Actions
- Transition model
- Goal test
- Path cost

#### Search

树搜：没有重复的状态

图搜：有重复的状态，需要进行记录

#### Search Strategies

b - 搜索树的最大分支系数

d - 解的深度（最浅深度）

m - 状态空间的最大深度，可能是无限

#### BFS

使用队列维护节点，先扩展最浅的节点

![](picture\BFS.png)

时间复杂度：$O(b^d)$

空间复杂度：$O(b^d)$

#### DFS

使用栈维护节点

时间复杂度：$O(b^m)$

空间复杂度：$O(bm)$

#### DLS(Depth-limited search)

有深度限制的 DFS

![](picture\DFS.png)

#### IDS(Iterative deepening search)

结合了 BFS 和 DFS

DLS with increasing depth limits

#### UCS(Uniform-cost search)

使用边代价为深度估计的 BFS，使用**优先队列**对边权进行排序，每次挑选边权最小的进行扩展

![](picture\UCS.png)

### Informed Search & Local Search

有信息和无信息的区别在于全局信息

#### Greedy Search

维护优先队列，每次挑选与自己相邻的与终点距离最近的往下走

![](picture\Greedy.png)



#### A* Search

除了考虑当前节点距离终点的距离，在启发函数当中还考虑从起始节点到当前节点的历史距离。

![](picture\A_star.png)

和 `Greedy`算法的区别只在于启发函数的不同。

#### Local Search

若到达目标的路径不重要，则可以考虑使用局部搜索

并且如果希望找到纯最优解，则也可以考虑使用局部搜索

##### Hill Climbing 爬山算法

也叫做贪心局部搜索，只会看相邻的邻居节点会不会更优。

在到达顶峰的时候终止

优点：

- 不用维护搜索树
- 几乎不用内存
- 常常可以在一个连续或更大的状态空间当中找到一个足够好的解

![](picture\Climb.png)

##### Genetic Algorithm(GA)

后继状态来自于两个父代的结合，而不是来自单一状态的调整

从 `k`个随机产生的状态开始（称为种群），每个状态都是一个个体

目标函数称为 fitness function，更好的状态有着更高的目标函数的值

在当前种群中选择两个父本，进行字符串的杂交之后产生子代，放入到新的种群当中，直到种群中的个体表现很优秀或者时间到了，此时选择种群当中最好的子代返回。

![](picture\GA.png)

##### Simulated Annealing

由爬山算法演变而来，即使是在邻近解比当前解差的情况下，也会有$e^{-\Delta E/T}$的概率移动到邻近解。

![](picture\SA.png)

### Adversarial Search

发生在多智能体的竞争性环境当中

零和博弈：一方最大化一个值，一方最小化一个值。对于不同的结果，智能体有不同的

#### Minimax

对博弈树进行深度优先搜索，假设双方都在的每一个节点采纳在未来当中对自己最有利的节点。

- 如果当前节点是 终止节点，则此时返回对当前状态的评估值
- 如果当前节点是 MAX 节点，那么返回所有子节点当中状态评估值最大的节点。
- 如果当前节点是 MIN 节点，那么返回所有子节点中状态评估值最小的节点的值

![image-20220801140532506](picture\MINIMAX.png)

时间复杂度：$O(b^m)$

空间复杂度：$O(bm)$

Minimax 的复杂度比较高，通常有以下的优化方法：

- 使用对非终止节点状态的评估去替换终止状态的评估
- 使用迭代加深搜索（IDS）
- 使用剪枝，删除决策树中的比较大的节点

#### $\alpha \beta 剪枝$

只在$Max$节点更新 $\alpha$，只在 $Min$节点更新$\beta$

在 $\alpha \ge \beta$ 的时候进行剪枝

![image-20220801142013207](picture\ab.png)

在最坏情况下，没有剪枝发生，时间复杂度和 $Minimax$一样，都是 $O(b^m)$

在理想情况下，一般可以被剪枝，时间复杂度为 $O(b^{m/2})$

如何寻找一个合适的遍历顺序：

- 记住浅层节点的最优 move
- 使用领域的知识（domain knowledge）
- 记录状态，因为他们可能重复

Real-Time Decisions: 使用评估函数，对实时的状态进行评估，而不是终局

在实际运用当中，使用以下策略可以提高效率：

- Pruning
- Bookkeeping
- Evaluation heuristics
- node re-ordering
- IDS

### Constraint Satisfaction Problems(CSP)

#### 定义

对于搜索问题，使用原子表示智能体，每个状态都是一个黑盒

对于 CSP 问题，使用 factored representation，每个智能体都有一些 domain 对应的值，目标检测是需要找到一个拥有一组满足对应值的约束（constraint）的状态

#### 约束种类

硬约束：一元约束，二元约束，全局约束（三个及以上变量的约束）

软约束：也叫做偏好，比如说红色比绿色好

#### BTS

一次只对一个变量赋值，然后检查边界条件，类似于 DFS

优化方法：

- Minimum Remaining Value(MRV)
- Least Constraining Value(LCV)
- Forward Checking

![image-20220801150236317](picture\BTS.png)

#### Type of Consistency

- Node consistency(unary constraints) 
- Arc consistency(binary constraints): 对X 任意取值，都与 Y 里面的某个取值相容
- Path consistency and k consistency

#### **AC3 算法**

好像会考默写，note 一下...

![image-20220801153339539](picture\AC3.png)

AC3 算法复杂度分析：

假设有 n 个变量，d 是域大小

则最多有 $n(n-1)$ 条弧，$O(n^2)$

每条弧都最多会被放进队列 d 次，$O(d)$

每次检验一条弧之间是否满足约束，$O(d^2)$

总的复杂度：$O(n^2d^3)$

#### Backtracking w/inference

在原有 csp 的基础上增加了一层推理

![image-20220801154726950](picture\BTS_w.png)

### Logical Agents

一个基于知识的智能体（knowledge-based agent）包括以下两个方面：

1. Knowledge base: domain specific content
2. Inference mechanism: domain-independent algorithms

建立一个智能体需要：

1. 加入新的知识，高速智能体什么是需要知道的
2. 询问什么是已知的，答案需要来自 Knowledge-Based

Wumpus 游戏

#### 逻辑

**Knowledge Base(KB)**: a set of sentences in a **formal representation**, logic

Logical entailment: is a relationship between sentences. It means that a sentence follow logically from other sentences.

#### propositions

- Negation $\neg p$

- Conjunction $p \wedge q$

- Disjunction $p\vee q$

- Exclusive or $p \oplus q$

- Implication $p \rightarrow q$

- Biconditional $p\leftarrow \rightarrow q$

#### 逻辑等价

$p\equiv q$

#### Tautology and contradiction

永真式就是永远成立的命题

矛盾式就是永远为假的命题

contingency 是既不是永真式也不是永假式的命题

#### Contrapositive, inverse, etc.

给定一个蕴含$p\rightarrow q$

逆命题(converse): $q \rightarrow p$

逆否命题(contrapositive): $\neg q \rightarrow \neg p$

反命题（inverse）：$\neg p \rightarrow \neg q$

#### Modus Ponens

$p \wedge(p\rightarrow q) \rightarrow q$

**Horn clauses**: a proposition of the form: $p_1 \wedge ... \wedge p_n \rightarrow q$ 使用 Modus Ponens 表示：

$\frac{p_1, ..., p_n \ \ (p_1\wedge ... \wedge p_n) \rightarrow q}{q} $

#### Modus Tollens

$\neg q \wedge (p \rightarrow q) \rightarrow \neg p$

#### Validity and Satisfiability

满足所有模型叫做 valid

满足 some models 叫做 satisfiable

$KB |= \alpha \ \ IFF \ \ (KB => \alpha)$ is valid

$KB |= \alpha \ \ IFF \ \ (KB \wedge \neg \alpha)$ is unsatisfiable

#### CNF

Conjunctive Normal Form(CNF)  is conjunction of disjunction of literals.由析取组成的合取

#### Forward Chaining and Backward Chaining

#### 一阶谓词逻辑

#### Resolution Problem

![image-20220801174942080](picture\resolution.png)

#### DPLL 算法

![image-20220801180607223](picture\DPLL.png)

讲解链接

https://blog.csdn.net/weixin_42695737/article/details/123361318?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522165934744416781685382660%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fall.%2522%257D&request_id=165934744416781685382660&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~first_rank_ecpm_v1~pc_rank_34-4-123361318-null-null.142^v37^pc_rank_34&utm_term=DPLL&spm=1018.2226.3001.4187

比枚举算法的改进：

- 单元子句的启发性（单元子句是指子句中除了某个文字外其他文字都是假的子句。可知单元子句中的文字必须为真。单元子句可以优先进行赋值，需要已知某个值为真。）
- 纯符号启发性（纯符号是某个文字在所有的子句中都是正或者负（只有一种情况）。找到纯符号可以通过对纯符号的赋值使语句为真，即只要进行一次赋值就可以把带有纯符号的所有子句全部消掉。纯符号可以优先进行赋值。）
- 及早终止（如果其中任意一个文字为真则一个子句是真；如果搜索的文字都为假则一个子句为假）

### Machine Learning Concepts

#### 数据科学的步骤

1. 收集数据
2. 预处理数据
3. EDA(Exploratory Data Analysis)
4. 机器学习
5. 可视化

#### KNN

利用样本之间的相似性（欧氏距离）来进行分类

优点：

- 容易实现
- 实际中表现好
- 不需要模型，调参
- 可扩展性好

缺点:

- 慢

#### Train, Validation and Test Set

Training set : is a set of examples used fo learning a model

Validation set : is a set of examples that cannot be used for learning the model but can help **tune model parameters**. helping to control overfitting

Test set: is used to assess the performance of the final model and provide an estimation of the test error.

![image-20220801200006775](picture\set.png)

#### K-fold Cross Validation

将数据集等分，并且每次将一部分拿出来用作测试集，剩余的部分用来训练，之后将每一次的误差进行求和

#### 混淆矩阵与评估标准

![image-20220801194929961](picture\matrix.png)

### Linear Regression and Logistic Regression

线性回归：$f(x) = \beta_0 + \sum_{j=1}^{d}\beta_{j}x_{j}$

损失函数：$R = \frac{1}{2n}\sum_{i=1}^{n}(y_i - f(x_i))^2$

梯度下降：

$\beta_0 = \beta_0 - \alpha \frac{\part R(\beta_0, \beta_1)}{\part \beta_0}$

$\beta_1 = \beta_1 - \alpha \frac{\part R(\beta_0, \beta_1)}{\part \beta_1}$

逻辑回归：$g(z) = e^z/(1+e^z) = 1/(1+e^{-z})$

$g^{'}(z)= g(z)*(1-g(z))$

$f(x) = g(\sum_{j=1}^d\beta_jx_j)$

$Loss(f(x),y) =-y\log(f(x)) - (1-y)\log(1-f(x))$

### Perceptron & Neural Networks

Code:

![image-20220801214232447](C:\大二课程\操作系统\picture\1.png)
