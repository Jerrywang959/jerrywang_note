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

**思路：从一个点出发，寻找它附近的比它更接近导数为0的点的点**

任意一个函数$f(x)$可以写成如下的形式：
$$
f(x) \approx f(x-x_k)+\nabla f(x-x_k)^{\top} (x-x_k)+\frac{1}{2} (x-x_k)^{\top} \nabla^{2} f(x-x_k) (x-x_k)
$$
如果令$\approx$变成$=$，对上式的右边求导数，并令其为0（即，使$f\prime(x)=0$)则有
$$
\nabla f(x_k)^{\top} + \nabla^{2} f(x_k) (x-x_k)=0
$$

整理得到


$$
x=x_k-\left[\nabla^{2} f(x_0)\right]^{-1} \nabla f(x_0)
$$

这个式子表明，在近似情况下，$x$是比$x_k$更接近于使得$f\prime(x)$为0的点

因此我们可以得到如下的迭代过程
$$
x_{k+1}=x_k-\left[\nabla^{2} f(x_0)\right]^{-1} \nabla f(x_0)
$$
牛顿法的一般迭代步骤如下：

1. 给定终止误差值$0\leq\epsilon\ll1$，初始点$x\in R_n$，$k=0$
2. 计算$g_{k}=\nabla f\left(x_{k}\right)$，若$\left\|g_{k}\right\| \leq \varepsilon$，则终止迭代
3. 计算$G_{k}=\nabla^2 f\left(x_{k}\right)$，并求解线性方程组得解$d_{k}: G_{k} d=-g_{k}$
4. 令$x_{k+1}=x_{k}+d_{k}, k=k+1$，并转2。

# 参考文献

1. [理解牛顿法](<https://zhuanlan.zhihu.com/p/37588590>)
2. [优化算法——牛顿法(Newton Method)](<https://blog.csdn.net/google19890102/article/details/41087931>)