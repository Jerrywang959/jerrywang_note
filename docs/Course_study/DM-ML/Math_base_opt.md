# 函数求极值

## Gradient and Hessian

函数$f:\mathbb{R}^d\rightarrow\mathbb{R}$的梯度为：
$$
\nabla f=\left(\begin{array}{c}
\frac{\partial f}{\partial x_{1}} \\
\frac{\partial f}{\partial x_{2}} \\
\vdots \\
\frac{\partial f}{\partial x_{d}}
\end{array}\right)
$$


函数$f:\mathbb{R}^d\rightarrow\mathbb{R}$的Hessian矩阵为
$$
\nabla^{2} f=\left(\begin{array}{ccc}
\frac{\partial^{2} f}{\partial x_{1}^{2}} & \cdots & \frac{\partial^{2} f}{\partial x_{1} \partial x_{d}} \\
\vdots & \ddots & \vdots \\
\frac{\partial^{2} f}{\partial x_{d} \partial x_{1}} & \cdots & \frac{\partial^{2} f}{\partial x_{d}^{2}}
\end{array}\right)
$$

## Gradient Descent

梯度下降法

### 一般迭代步骤

目标函数 $\min\limits_x f(x)$

迭代：$x_{t+1}=x_{t}-\eta_{t} \nabla f\left(x_{t}\right)$

### $\eta_t$的选取

**精确线性搜索**

$\eta_{t}=\arg \min _{\eta} f(x-\eta \nabla f(x))$

往往这是不切实际的

**回溯线搜索**

我们令$\alpha\in(1,\frac{1}{2}],\beta\in(0,1)$，$\eta$从$\eta=1$出发，并不断迭代$\eta=\beta\eta$直到
$$
f(x-\eta \nabla f(x)) \leq f(x)-\alpha \eta\|\nabla f(x)\|^{2}
$$
这种方法在实际操作中效果较佳



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
4. [Backtracking line search](<https://en.wikipedia.org/wiki/Backtracking_line_search>)
5. [Line search](<https://en.wikipedia.org/wiki/Line_search>)