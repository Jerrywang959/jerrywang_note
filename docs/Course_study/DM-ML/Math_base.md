机器学习的数学基础


## Orthogonal Matrices
如果一个矩阵$$Q\in R^{n\times n} $$满足
$$
Q^TQ=I
$$
则它为正交矩阵


## Tall Matrices with Orthonormal Columns

具有正交列的高矩阵

## General Matrix Norms
一般的矩阵范数

## Eigenvalue Decomposition
矩阵特征值

### Singular Value Decomposition
奇异值分解

## Newton’s Method

牛顿法求解最值问题

**思路：从一个点出发，寻找它附近的导数为0的点**

一个点$$x_0$$附近的另外一个点$$x$$可以写成如下的二阶泰勒近似形式
$$
f(x) \approx f(x-x_0)+\nabla f(x-x_0)^{\top} (x-x_0)+\frac{1}{2} (x-x_0)^{\top} \nabla^{2} f(x-x_0) (x-x_0)
$$
如果令$$\approx$$变成$$=$$，对两边同时对$$x$$求梯度，则有
$$
\nabla(f(x))= \nabla f(x_0)^{\top} + \nabla^{2} f(x_0) (x-x_0)
$$






$$
x=-\left[\nabla^{2} f(x_0)\right]^{-1} \nabla f(x_0)
$$



若要$$f(x)$$处于极值状态，则要求$$x+v=x$$，即
$$
x_{t+1}=x_t+v_t
$$
其中$$v_t$$为无穷小量，带入$$v_t$$,可得
$$
x_{t+1}=x_{t}-\left[\nabla^{2} f\left(x_{t}\right)\right]^{-1} \nabla f\left(x_{t}\right)
$$

# 参考文献

1. [理解牛顿法](<https://zhuanlan.zhihu.com/p/37588590>)