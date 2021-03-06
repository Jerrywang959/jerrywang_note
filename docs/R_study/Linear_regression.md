# 安装并使用包

切换清华镜像源


```R
options(repos=structure(c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))) 
```

MASS:支持Venables和Ripley的函数和数据集   
ISLR:R中应用统计学习入门的数据


```R
install.packages("ISLR")
```

```output
    Installing package into ‘/home/jerrywang/R/x86_64-pc-linux-gnu-library/3.6’
    (as ‘lib’ is unspecified)
    

```


```R
install.packages("MASS")
```

```output
    Installing package into ‘/home/jerrywang/R/x86_64-pc-linux-gnu-library/3.6’
    (as ‘lib’ is unspecified)
    

```

加载包并删除全部变量


```R
library(MASS)
library(ISLR)
rm(list=ls())
```

# 简单线性回归
查看变量名词


```R
names(Boston)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'crim'</li><li>'zn'</li><li>'indus'</li><li>'chas'</li><li>'nox'</li><li>'rm'</li><li>'age'</li><li>'dis'</li><li>'rad'</li><li>'tax'</li><li>'ptratio'</li><li>'black'</li><li>'lstat'</li><li>'medv'</li></ol>



做线性回归，`lm()`为线性回归模型，`~`前为被解释变量，`~`后为自变量


```R
lm.fit=lm(medv~lstat,data = Boston)
```

显示回归结果


```R
lm.fit
```


```output
    
    Call:
    lm(formula = medv ~ lstat, data = Boston)
    
    Coefficients:
    (Intercept)        lstat  
          34.55        -0.95  

```



```R
summary(lm.fit)
```


```output
    
    Call:
    lm(formula = medv ~ lstat, data = Boston)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -15.168  -3.990  -1.318   2.034  24.500 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 34.55384    0.56263   61.41   <2e-16 ***
    lstat       -0.95005    0.03873  -24.53   <2e-16 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 6.216 on 504 degrees of freedom
    Multiple R-squared:  0.5441,	Adjusted R-squared:  0.5432 
    F-statistic: 601.6 on 1 and 504 DF,  p-value: < 2.2e-16

```


找出存储在回归结果中的其他信息


```R
names(lm.fit)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'coefficients'</li><li>'residuals'</li><li>'effects'</li><li>'rank'</li><li>'fitted.values'</li><li>'assign'</li><li>'qr'</li><li>'df.residual'</li><li>'xlevels'</li><li>'call'</li><li>'terms'</li><li>'model'</li></ol>



返回参数


```R
lm.fit$coefficient
```


<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>(Intercept)</dt><dd>34.5538408793831</dd><dt>lstat</dt><dd>-0.95004935375799</dd></dl>




```R
coef(lm.fit)
```


<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>(Intercept)</dt><dd>34.5538408793831</dd><dt>lstat</dt><dd>-0.95004935375799</dd></dl>



返回拟合的置信区间


```R
confint(lm.fit)
```


<table>
<caption>A matrix: 2 × 2 of type dbl</caption>
<thead>
	<tr><th></th><th scope=col>2.5 %</th><th scope=col>97.5 %</th></tr>
</thead>
<tbody>
	<tr><th scope=row>(Intercept)</th><td>33.448457</td><td>35.6592247</td></tr>
	<tr><th scope=row>lstat</th><td>-1.026148</td><td>-0.8739505</td></tr>
</tbody>
</table>



预测数值并给出置信区间


```R
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="confidence")
```


<table>
<caption>A matrix: 3 × 3 of type dbl</caption>
<thead>
	<tr><th></th><th scope=col>fit</th><th scope=col>lwr</th><th scope=col>upr</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>29.80359</td><td>29.00741</td><td>30.59978</td></tr>
	<tr><th scope=row>2</th><td>25.05335</td><td>24.47413</td><td>25.63256</td></tr>
	<tr><th scope=row>3</th><td>20.30310</td><td>19.73159</td><td>20.87461</td></tr>
</tbody>
</table>



画散点图并画出集拟合的直线


```R
plot(Boston$lstat,Boston$medv)
abline(lm.fit)
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_25_0.png ':size=500')


给直线加粗或者添加颜色


```R
plot(Boston$lstat,Boston$medv)
abline(lm.fit,lwd=3,col="red")
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_27_0.png ':size=500')


`plot`中的`pch`参数代表了画出的点的形状，具体如下
![UTOOLS1588302281481.png](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/UTOOLS1588302281481.png)


```R
plot(Boston$lstat,Boston$medv,pch=25)
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_29_0.png ':size=500')



```R
plot(1:20,1:20,pch=1:20)
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_30_0.png ':size=500')


画出线性回归结果诊断图，包括   
1. 拟合数跟残差的关系图，较好的线性拟合应该会在此图中得到水平的直线   
2. 标准化残差与正态分布的QQ图，较好的线性拟合应该是一条直线    
3. 规模定位图或者点差位置图，较好的线性拟合应该是一条水平的直线    
4. 残差与杠杆图，帮助确定模型上有影响力的数据点，库克距离线(cook's distance)只之外的点是对模型有影响的点


```R
plot(lm.fit)
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_32_0.png ':size=500')



![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_32_1.png ':size=500')



![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_32_2.png ':size=500')



![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_32_3.png ':size=500')


按照2 × 2的结构画成子图


```R
par(mfrow=c(2,2)) 
plot(lm.fit)
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_34_0.png ':size=500')


画诊断图中的第一个图


```R
par(mfrow=c(1,1))
plot(predict(lm.fit), residuals(lm.fit))
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_36_0.png ':size=500')


画拟合值和[学生化残差](https://en.wikipedia.org/wiki/Studentized_residual)之间的关系，学生化残差是残差除以其标准偏差的估计所得的商，是学生统计量的一种


```R
plot(predict(lm.fit), rstudent(lm.fit))
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_40_0.png ':size=500')


leverage是衡量一个观察值的独立变量值与其他观察值的相距多远的度量，`hatvalues()`以获得杠杆统计的结果


```R
plot(hatvalues(lm.fit))
```


![](https://mypictuchuang.oss-cn-shenzhen.aliyuncs.com/Linear_regression_38_0.png ':size=500')


找到最大杠杆点的索引


```R
which.max(hatvalues(lm.fit))
```


<strong>375:</strong> 375


# 多元线性回归


```R
lm.fit=lm(medv~lstat+age,data=Boston)
summary(lm.fit)
```


```output
    
    Call:
    lm(formula = medv ~ lstat + age, data = Boston)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -15.981  -3.978  -1.283   1.968  23.158 
    
    Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 33.22276    0.73085  45.458  < 2e-16 ***
    lstat       -1.03207    0.04819 -21.416  < 2e-16 ***
    age          0.03454    0.01223   2.826  0.00491 ** 
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 6.173 on 503 degrees of freedom
    Multiple R-squared:  0.5513,	Adjusted R-squared:  0.5495 
    F-statistic:   309 on 2 and 503 DF,  p-value: < 2.2e-16

```


使用一个因变量和其他所有自变量回归


```R
lm.fit=lm(medv~.,data=Boston)
summary(lm.fit)
```


```output
    
    Call:
    lm(formula = medv ~ ., data = Boston)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -15.595  -2.730  -0.518   1.777  26.199 
    
    Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
    (Intercept)  3.646e+01  5.103e+00   7.144 3.28e-12 ***
    crim        -1.080e-01  3.286e-02  -3.287 0.001087 ** 
    zn           4.642e-02  1.373e-02   3.382 0.000778 ***
    indus        2.056e-02  6.150e-02   0.334 0.738288    
    chas         2.687e+00  8.616e-01   3.118 0.001925 ** 
    nox         -1.777e+01  3.820e+00  -4.651 4.25e-06 ***
    rm           3.810e+00  4.179e-01   9.116  < 2e-16 ***
    age          6.922e-04  1.321e-02   0.052 0.958229    
    dis         -1.476e+00  1.995e-01  -7.398 6.01e-13 ***
    rad          3.060e-01  6.635e-02   4.613 5.07e-06 ***
    tax         -1.233e-02  3.760e-03  -3.280 0.001112 ** 
    ptratio     -9.527e-01  1.308e-01  -7.283 1.31e-12 ***
    black        9.312e-03  2.686e-03   3.467 0.000573 ***
    lstat       -5.248e-01  5.072e-02 -10.347  < 2e-16 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 4.745 on 492 degrees of freedom
    Multiple R-squared:  0.7406,	Adjusted R-squared:  0.7338 
    F-statistic: 108.1 on 13 and 492 DF,  p-value: < 2.2e-16

```


获得回归的$R^2$


```R
summary(lm.fit)$r.sq
```


0.74064266410941


获得相对标准误差（Relative Standard Error，RSE）

$$
\mathrm{RSE}=\frac{Standard Error}{Estimate}
$$

Standard Error为样本的标准误，Estimate为样本的均值


```R
summary(lm.fit)$sigma 
```


4.74529818169963


排除某一个变量并做回归


```R
lm.fit1=lm(medv~.-age,data=Boston)
summary(lm.fit1)
```


```output
    
    Call:
    lm(formula = medv ~ . - age, data = Boston)
    
    Residuals:
         Min       1Q   Median       3Q      Max 
    -15.6054  -2.7313  -0.5188   1.7601  26.2243 
    
    Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
    (Intercept)  36.436927   5.080119   7.172 2.72e-12 ***
    crim         -0.108006   0.032832  -3.290 0.001075 ** 
    zn            0.046334   0.013613   3.404 0.000719 ***
    indus         0.020562   0.061433   0.335 0.737989    
    chas          2.689026   0.859598   3.128 0.001863 ** 
    nox         -17.713540   3.679308  -4.814 1.97e-06 ***
    rm            3.814394   0.408480   9.338  < 2e-16 ***
    dis          -1.478612   0.190611  -7.757 5.03e-14 ***
    rad           0.305786   0.066089   4.627 4.75e-06 ***
    tax          -0.012329   0.003755  -3.283 0.001099 ** 
    ptratio      -0.952211   0.130294  -7.308 1.10e-12 ***
    black         0.009321   0.002678   3.481 0.000544 ***
    lstat        -0.523852   0.047625 -10.999  < 2e-16 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 4.74 on 493 degrees of freedom
    Multiple R-squared:  0.7406,	Adjusted R-squared:  0.7343 
    F-statistic: 117.3 on 12 and 493 DF,  p-value: < 2.2e-16

```


也可以用`update()`函数来更新之前的模型


```R
lm.fit1=update(lm.fit, ~.-age)
lm.fit1
```


```output
    
    Call:
    lm(formula = medv ~ crim + zn + indus + chas + nox + rm + dis + 
        rad + tax + ptratio + black + lstat, data = Boston)
    
    Coefficients:
    (Intercept)         crim           zn        indus         chas          nox  
      36.436927    -0.108006     0.046334     0.020562     2.689026   -17.713540  
             rm          dis          rad          tax      ptratio        black  
       3.814394    -1.478612     0.305786    -0.012329    -0.952211     0.009321  
          lstat  
      -0.523852  

```


使用`*`以包括交互项


```R
summary(lm(medv~lstat*age,data=Boston))
```


```output
    
    Call:
    lm(formula = medv ~ lstat * age, data = Boston)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -15.806  -4.045  -1.333   2.085  27.552 
    
    Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 36.0885359  1.4698355  24.553  < 2e-16 ***
    lstat       -1.3921168  0.1674555  -8.313 8.78e-16 ***
    age         -0.0007209  0.0198792  -0.036   0.9711    
    lstat:age    0.0041560  0.0018518   2.244   0.0252 *  
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 6.149 on 502 degrees of freedom
    Multiple R-squared:  0.5557,	Adjusted R-squared:  0.5531 
    F-statistic: 209.3 on 3 and 502 DF,  p-value: < 2.2e-16

```


使用`*`以只对交互项回归


```R
summary(lm(medv~lstat:age,data=Boston))
```


```output
    
    Call:
    lm(formula = medv ~ lstat:age, data = Boston)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -13.347  -4.372  -1.534   1.914  27.193 
    
    Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 30.1588631  0.4828240   62.46   <2e-16 ***
    lstat:age   -0.0077146  0.0003799  -20.31   <2e-16 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 6.827 on 504 degrees of freedom
    Multiple R-squared:  0.4501,	Adjusted R-squared:  0.449 
    F-statistic: 412.4 on 1 and 504 DF,  p-value: < 2.2e-16

```


# 加入解释变量的非线性项

函数`I()`将项包装起来


```R
lm.fit2=lm(medv~lstat+I(lstat^2),data = Boston)
summary(lm.fit2)
```


```output
    
    Call:
    lm(formula = medv ~ lstat + I(lstat^2), data = Boston)
    
    Residuals:
         Min       1Q   Median       3Q      Max 
    -15.2834  -3.8313  -0.5295   2.3095  25.4148 
    
    Coefficients:
                 Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 42.862007   0.872084   49.15   <2e-16 ***
    lstat       -2.332821   0.123803  -18.84   <2e-16 ***
    I(lstat^2)   0.043547   0.003745   11.63   <2e-16 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 5.524 on 503 degrees of freedom
    Multiple R-squared:  0.6407,	Adjusted R-squared:  0.6393 
    F-statistic: 448.5 on 2 and 503 DF,  p-value: < 2.2e-16

```


`anova()`函数对两个模型进行方差分析


```R
lm.fit=lm(medv~lstat,data = Boston)
lm.fit
anova(lm.fit,lm.fit2)
```


```output
    
    Call:
    lm(formula = medv ~ lstat, data = Boston)
    
    Coefficients:
    (Intercept)        lstat  
          34.55        -0.95  

```



<table>
<caption>A anova: 2 × 6</caption>
<thead>
	<tr><th></th><th scope=col>Res.Df</th><th scope=col>RSS</th><th scope=col>Df</th><th scope=col>Sum of Sq</th><th scope=col>F</th><th scope=col>Pr(&gt;F)</th></tr>
	<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>504</td><td>19472.38</td><td>NA</td><td>      NA</td><td>      NA</td><td>          NA</td></tr>
	<tr><th scope=row>2</th><td>503</td><td>15347.24</td><td> 1</td><td>4125.138</td><td>135.1998</td><td>7.630116e-28</td></tr>
</tbody>
</table>



使用`poly()`以获得高阶多项式


```R
lm.fit5=lm(medv~poly(lstat,5),data = Boston)
summary(lm.fit5)
```


```output
    
    Call:
    lm(formula = medv ~ poly(lstat, 5), data = Boston)
    
    Residuals:
         Min       1Q   Median       3Q      Max 
    -13.5433  -3.1039  -0.7052   2.0844  27.1153 
    
    Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
    (Intercept)       22.5328     0.2318  97.197  < 2e-16 ***
    poly(lstat, 5)1 -152.4595     5.2148 -29.236  < 2e-16 ***
    poly(lstat, 5)2   64.2272     5.2148  12.316  < 2e-16 ***
    poly(lstat, 5)3  -27.0511     5.2148  -5.187 3.10e-07 ***
    poly(lstat, 5)4   25.4517     5.2148   4.881 1.42e-06 ***
    poly(lstat, 5)5  -19.2524     5.2148  -3.692 0.000247 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 5.215 on 500 degrees of freedom
    Multiple R-squared:  0.6817,	Adjusted R-squared:  0.6785 
    F-statistic: 214.2 on 5 and 500 DF,  p-value: < 2.2e-16

```


# 定性预测因子

查看Carseats数据的变量


```R
names(Carseats)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'Sales'</li><li>'CompPrice'</li><li>'Income'</li><li>'Advertising'</li><li>'Population'</li><li>'Price'</li><li>'ShelveLoc'</li><li>'Age'</li><li>'Education'</li><li>'Urban'</li><li>'US'</li></ol>




```R
str(Carseats)
```

```output
    'data.frame':	400 obs. of  11 variables:
     $ Sales      : num  9.5 11.22 10.06 7.4 4.15 ...
     $ CompPrice  : num  138 111 113 117 141 124 115 136 132 132 ...
     $ Income     : num  73 48 35 100 64 113 105 81 110 113 ...
     $ Advertising: num  11 16 10 4 3 13 0 15 0 0 ...
     $ Population : num  276 260 269 466 340 501 45 425 108 131 ...
     $ Price      : num  120 83 80 97 128 72 108 120 124 124 ...
     $ ShelveLoc  : Factor w/ 3 levels "Bad","Good","Medium": 1 2 3 3 1 1 3 2 3 3 ...
     $ Age        : num  42 65 59 55 38 78 71 67 76 76 ...
     $ Education  : num  17 10 12 14 13 16 15 10 10 17 ...
     $ Urban      : Factor w/ 2 levels "No","Yes": 2 2 2 2 2 1 2 2 1 1 ...
     $ US         : Factor w/ 2 levels "No","Yes": 2 2 2 2 1 2 1 2 1 2 ...

```


```R
summary(Carseats$ShelveLoc)
```


<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>Bad</dt><dd>96</dd><dt>Good</dt><dd>85</dd><dt>Medium</dt><dd>219</dd></dl>




```R
lm.fit=lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lm.fit)
```


```output
    
    Call:
    lm(formula = Sales ~ . + Income:Advertising + Price:Age, data = Carseats)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -2.9208 -0.7503  0.0177  0.6754  3.3413 
    
    Coefficients:
                         Estimate Std. Error t value Pr(>|t|)    
    (Intercept)         6.5755654  1.0087470   6.519 2.22e-10 ***
    CompPrice           0.0929371  0.0041183  22.567  < 2e-16 ***
    Income              0.0108940  0.0026044   4.183 3.57e-05 ***
    Advertising         0.0702462  0.0226091   3.107 0.002030 ** 
    Population          0.0001592  0.0003679   0.433 0.665330    
    Price              -0.1008064  0.0074399 -13.549  < 2e-16 ***
    ShelveLocGood       4.8486762  0.1528378  31.724  < 2e-16 ***
    ShelveLocMedium     1.9532620  0.1257682  15.531  < 2e-16 ***
    Age                -0.0579466  0.0159506  -3.633 0.000318 ***
    Education          -0.0208525  0.0196131  -1.063 0.288361    
    UrbanYes            0.1401597  0.1124019   1.247 0.213171    
    USYes              -0.1575571  0.1489234  -1.058 0.290729    
    Income:Advertising  0.0007510  0.0002784   2.698 0.007290 ** 
    Price:Age           0.0001068  0.0001333   0.801 0.423812    
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 1.011 on 386 degrees of freedom
    Multiple R-squared:  0.8761,	Adjusted R-squared:  0.8719 
    F-statistic:   210 on 13 and 386 DF,  p-value: < 2.2e-16

```


当我们对类型变量回归时，会自动生产虚拟变量，比如：


```R
lm.fit=lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lm.fit)
```


```output
    
    Call:
    lm(formula = Sales ~ . + Income:Advertising + Price:Age, data = Carseats)
    
    Residuals:
        Min      1Q  Median      3Q     Max 
    -2.9208 -0.7503  0.0177  0.6754  3.3413 
    
    Coefficients:
                         Estimate Std. Error t value Pr(>|t|)    
    (Intercept)         6.5755654  1.0087470   6.519 2.22e-10 ***
    CompPrice           0.0929371  0.0041183  22.567  < 2e-16 ***
    Income              0.0108940  0.0026044   4.183 3.57e-05 ***
    Advertising         0.0702462  0.0226091   3.107 0.002030 ** 
    Population          0.0001592  0.0003679   0.433 0.665330    
    Price              -0.1008064  0.0074399 -13.549  < 2e-16 ***
    ShelveLocGood       4.8486762  0.1528378  31.724  < 2e-16 ***
    ShelveLocMedium     1.9532620  0.1257682  15.531  < 2e-16 ***
    Age                -0.0579466  0.0159506  -3.633 0.000318 ***
    Education          -0.0208525  0.0196131  -1.063 0.288361    
    UrbanYes            0.1401597  0.1124019   1.247 0.213171    
    USYes              -0.1575571  0.1489234  -1.058 0.290729    
    Income:Advertising  0.0007510  0.0002784   2.698 0.007290 ** 
    Price:Age           0.0001068  0.0001333   0.801 0.423812    
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    Residual standard error: 1.011 on 386 degrees of freedom
    Multiple R-squared:  0.8761,	Adjusted R-squared:  0.8719 
    F-statistic:   210 on 13 and 386 DF,  p-value: < 2.2e-16

```


用`contrasts()`函数以得到R生产的虚拟变量的具体情况


```R
contrasts(Carseats$ShelveLoc)
```


<table>
<caption>A matrix: 3 × 2 of type dbl</caption>
<thead>
	<tr><th></th><th scope=col>Good</th><th scope=col>Medium</th></tr>
</thead>
<tbody>
	<tr><th scope=row>Bad</th><td>0</td><td>0</td></tr>
	<tr><th scope=row>Good</th><td>1</td><td>0</td></tr>
	<tr><th scope=row>Medium</th><td>0</td><td>1</td></tr>
</tbody>
</table>



这表示，截距项包含了`Bad`的对被解释变量的影响，`ShelveLocGood`系数的含义是`Good`与`Bad`的差异，`ShelveLocMedium`系数的含义是`Medium`与`Bad`的差异
