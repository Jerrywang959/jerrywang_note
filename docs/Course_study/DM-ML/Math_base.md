# 机器学习的数学基础


## Orthogonal Matrices
如果一个矩阵$$Q\in R^{n\times n} $$满足
$$
Q^TQ=I
$$
则它为正交矩阵


## Tall Matrices with Orthonormal Columns

具有正交列的高矩阵

如果一个矩阵$Q\in\mathbb{R}^{n\times m},(m>n)$并具有正交列，满足

1. $Q^\top Q=I$
2. $QQ^\top\not=I$

则它为具有正交列的高矩阵

## General Matrix Norms

一个范数——norm是一个函数$\|\cdot\|$，满足：

1. $\|A\|\geq0$，当且仅当$A=0$时等号成立
2. $\|A+B\|\le\|A\|+\|B\|$
3. $\|\alpha A\|=|a|\|A\|$

### p-范数诱导的矩阵范数

向量$\mathbf{x}$的p-范数
$$
\|\mathbf{x}\|_{p}=\left(\left|x_{1}\right|^{p}+\left|x_{2}\right|^{p}+\cdots+\left|x_{n}\right|^{p}\right)^{1 / p}
$$
矩阵的p范数
$$
\|\mathbf{A}\|_{p}=\max _{\mathbf{x} \neq 0} \frac{\|\mathbf{A} \mathbf{x}\|_{p}}{\|\mathbf{x}\|_{p}}
$$
例如，1-范数为
$$
\|\mathbf{A}\|_{1}=\max _{j} \sum_{i=1}^{n}\left|a_{i j}\right|
$$
这种由矢量范数诱导的矩阵范数称为 算子范数（operator norm）。

### **弗罗贝尼乌斯范数**(Frobenius norm)

矩阵$A\in\mathbb{R}^{m\times n}$的弗罗贝尼乌斯范数为

$$
\|\mathbf{A}\|_{F}=\left(\sum_{i=1}^{m} \sum_{j=1}^{n}\left|a_{i j}\right|^{2}\right)^{1 / 2}
$$

一些性质
$$
\|\mathbf{A}\|_{F}^{2}=\operatorname{trace}\left(\mathbf{A}^{\top} \mathbf{A}\right) \\
\|\mathbf{A B}\|_{F}=\|\mathbf{A}\|_{F}\|\mathbf{B}\|_{F}
$$
正交乘法下不变性
$$
\|\mathbf{Q A}\|_{2}=\|\mathbf{A}\|_{2} \quad\|\mathbf{Q A}\|_{F}=\|\mathbf{A}\|_{F}
$$
其中$Q$是一个正交矩阵

## Eigenvalue Decomposition

矩阵特征分解

对于一个方阵$A\in\mathbb{R}^{m\times n}$，我们称非0向量$\mathbf{x}\in\mathbb{R^n}$是其特征值$\lambda$对应的一个特征向量，如果：
$$
\mathbf{A x}=\lambda \mathbf{x}
$$
方针$A$的特征值分解为
$$
A=X \Lambda X^{-1}
$$
其中，$\mathbf{X}$是一个非奇异矩阵，且由$A$矩阵的特征向量组成；$\mathbf{\Lambda}$是一个对角线上的值为$A$矩阵的特征值的对角矩阵。

Note:

1. 不是所有的矩阵都有特征分解，一个矩阵有特征分解当且仅当它是可对角化的(diagonalizable)。
2. 实对称矩阵的特征值都是实数，且它的特征分解具有$\mathbf{A}=\mathbf{Q} \mathbf{\Lambda} \mathbf{Q}^{\top}$的形式，其中$Q$为正交矩阵。

### Singular Value Decomposition
奇异值分解 SVD

每一个矩阵$\mathbf{A}\in\mathbb{R}$都有如下的奇异值分解形式
$$
\mathbf{A}=\mathbf{U} \boldsymbol{\Sigma} \mathbf{V}^{\top}
$$
其中，$\mathbf{U}\in\mathbb{R}^{m\times m}$和$\mathbf{V}\in\mathbb{R}^{n\times n}$为正交矩阵，$\boldsymbol{\Sigma} \in \mathbb{R}^{m \times n}$是一个对角线上的值为$\mathbf{A}$的奇异值的对角矩阵

如果矩阵$\mathbf{A}$的秩为$r$，则$\mathbf{A}$的奇异值为
$$
\sigma_{1} \geq \sigma_{2} \geq \cdots \geq \sigma_{r} \geq \sigma_{r+1}=\ldots \sigma_{\min (m, n)}=0
$$




## Newton’s Method

牛顿法求解最值问题

**思路：从一个点出发，寻找它附近比它更接近导数为0的点的点**

任意一个函数$f(x)$可以写成如下的形式：
$$
f(x) \approx f(x-x_k)+\nabla f(x-x_k)^{\top} (x-x_k)+\frac{1}{2} (x-x_k)^{\top} \nabla^{2} f(x-x_k) (x-x_k)
$$
其中，$x$为$x_k$附近的一个点。如果令$\approx$变成$=$，对上式的右边对$x$求导数，并令其为0（即，使$f\prime(x)=0$)，则有
$$
\nabla f(x_k) + \nabla^{2} f(x_k) (x-x_k)=0
$$

整理得到


$$
x=x_k-\left[\nabla^{2} f(x_k)\right]^{-1} \nabla f(x_k)
$$

这个式子表明，在近似情况下，从$x_k$来看，$x$是使得$f\prime(x)$为$0$的点，即最值点。

那么我们可以认为，在不近似的情况下$x$是比$x_k$更加接近导数为0的点的点。

因此我们可以得到如下的迭代过程
$$
x_{k+1}=x_k-\left[\nabla^{2} f(x_k)\right]^{-1} \nabla f(x_k)
$$
牛顿法的一般迭代步骤如下：

1. 给定终止误差值$0\leq\epsilon\ll1$，初始点$x\in R_n$，$k=0$
2. 计算$g_{k}=\nabla f\left(x_{k}\right)$，若$\left\|g_{k}\right\| \leq \varepsilon$，则终止迭代
3. 计算$G_{k}=\nabla^2 f\left(x_{k}\right)$，并求解线性方程组得解$d_{k}: G_{k} d=-g_{k}$
4. 令$x_{k+1}=x_{k}+d_{k}, k=k+1$，并转2。

也可以给定步长迭代。

# 参考文献

1. [理解牛顿法](<https://zhuanlan.zhihu.com/p/37588590>)
2. [优化算法——牛顿法(Newton Method)](<https://blog.csdn.net/google19890102/article/details/41087931>)
3. [Newton's method](<https://en.wikipedia.org/wiki/Newton%27s_method>)
4. [可对角化矩阵](<https://zh.wikipedia.org/w/index.php?title=%E5%8F%AF%E5%AF%B9%E8%A7%92%E5%8C%96%E7%9F%A9%E9%98%B5&oldid=57619445> )
5. [特征分解](<https://zh.wikipedia.org/wiki/%E7%89%B9%E5%BE%81%E5%88%86%E8%A7%A3>)
6. [矩阵范数](<https://zh.wikipedia.org/wiki/%E7%9F%A9%E9%99%A3%E7%AF%84%E6%95%B8#p-%E8%8C%83%E6%95%B0%E8%AF%B1%E5%AF%BC%E7%9A%84%E7%9F%A9%E9%98%B5%E8%8C%83%E6%95%B0>)
7. [算子范数](<https://zh.wikipedia.org/wiki/%E7%AE%97%E5%AD%90%E8%8C%83%E6%95%B0>)