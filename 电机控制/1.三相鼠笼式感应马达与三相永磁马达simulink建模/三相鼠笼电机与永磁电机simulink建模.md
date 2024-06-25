# 三相鼠笼电机与永磁电机simulink建模

## 1.鼠笼电机

### 1.1 方程

电机方程：
$$
\frac{di_{s\alpha}}{dt}=K_{1}i_{s\alpha}+K_{2}\phi_{r\alpha}+K_{3}\omega_{r}\phi_{r\beta}+K_{4}v_{s\alpha}
$$

$$
\frac{di_{s\beta}}{dt}=K_{1}i_{s\beta}-K_{3}\omega_{r}\phi_{r\alpha}+K_{2}\phi_{r\beta}+K_{4}v_{s\beta}
$$

其中，
$$
K_{1}=\frac{-R_{s}L^{2}_{r}-R_{r}L^{2}_{m}}{L_{r}w},K_{2}=\frac{R_{r}L_{m}}{L_{r}w},K_{3}=\frac{L_{m}}{w},K_{4}=\frac{L_{r}}{w},w=L_{r}L_{s}-L^{2}_{M}
$$
另外，
$$
\frac{d\phi_{r\alpha}}{dt}=K_{5}i_{s\alpha}+K_{6}\phi_{r\alpha}-\omega_{r}\phi_{r\beta}
$$

$$
\frac{d\phi_{r\beta}}{dt}=K_{5}i_{s\beta}+\omega_{r}\phi_{r\alpha}+K_{6}\phi_{r\beta}
$$

其中，
$$
K_{5}=\frac{R_{r}L_{m}}{L_{r}},K_{6}=-\frac{R_{r}}{L_{r}}
$$
转矩方程：
$$
\frac{d\omega_{rm}}{dt}=\frac{1}{J}(T_{e}-T_{L}-b\omega_{rm})
$$

$$
T_e=\frac{3P}{4}\frac{L_m}{L_r}(i_{s\beta}\phi_{r\alpha}-i_{s\alpha}\phi_{r\beta})
$$

其中，
$$
\omega_{rm}=\frac{2}{P}\omega_{r},P为马达极数
$$

### 1.2 电机参数

| 电机参数     | 数值               |
| :----------- | :----------------- |
| 定子电阻Rs   | 0.8Ω               |
| 转子电阻Rr   | 0.6Ω               |
| 定子电感Ls   | 0.085H             |
| 转子电感Lr   | 0.085H             |
| 互感Lm       | 0.082H             |
| 马达极数pole | 4                  |
| 转动惯量J    | 0.033kg·m3         |
| 摩擦系数B    | 0.00825M·m·sec/rad |

### 1.3 simulink建模

首先建立matlab脚本将电机参数输入到matlab环境中，

```matlab
Rs = 0.8;
Rr = 0.6;
Ls = 0.085;
Lr = 0.085;
Lm = 0.082;
pole = 4;
J = 0.033;
B = 0.00825;
w = Ls*Lr - Lm^2;
Lsigma = w/Lr;
K1 = (-Rs*Lr^2-Rr*Lm^2)/(Lr*w);
K2 = (Rr*Lm)/(Lr*w);
K3 = Lm/w;
K4 = Lr/w;
K5 = Rr*Lm/Lr;
K6 = -Rr/Lr;

%sigma = 1 - Lm^2/(Ls*Lr);
```



