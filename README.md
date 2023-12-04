# Physical-Project

## 太阳能光伏电池的效率

要求量 $\eta_{pv}$, $\eta_{pv}  = \frac{P_{solar} }{AG} $

其中, $P_{solar}=I_{pv} \times V_{pv}$, $A$是光伏电池的面积, $G$是太阳有效辐射量即直接太阳辐射量

### 计算太阳辐射功率

太阳辐射分析工具根据 Rich 等人（Rich 1990，Rich 等人 1994）创立并进一步由 Fu 和 Rich（2000，2002）发展的半球视域算法中的方法，计算某研究区域范围内或特定位置的日照。

为特定位置或面积计算的辐射总量将以总辐射量形式给出。对每个要素位置或每个地形面中的位置重复计算直射日照量、散射日照量、总日照量，以便生成整个地理区域的日照地图。

太阳辐射量分为直接太阳辐射量 $dir$和散射辐射量 $dif$

$\sin \alpha_h = \cos \varphi = \sin \delta \sin \phi +\cos \delta \cos \phi \cos \theta $

则可以根据天顶角和高度角之间的关系

$\varphi  = \frac{\pi}{2}  - z$

得到天顶角 $\varphi$

太阳日照时长为

$T_s = \frac{2}{15} \arccos (-\tan(\delta ) \times \tan (\theta ) )$

给定位置的总直接日照量($Dir_{tot}$)是所有太阳图扇区中直接日照量

### 计算光伏电池功率

已知某品牌二极管反向电阻为 $R_{diode} = 80000\Omega$，光伏电池电阻 $R_{ph} = 0.5\Omega$，电阻 $R_p=10\Omega$， $R_s=20\Omega$，电路中开路电压 $V_{pv} = 30V$。

在以下电路图中

![屏幕截图 2023-12-04 200646](https://github.com/Egbert-Lannister/Physical-Project/assets/117975086/1a824b04-ad70-46c0-9a79-449daf409e24)


根据闭合电路欧姆定律，求得 $I_{st}$

$$
V_{pv} = I_{st}\times(R_s+\frac{R_p\times R_{ph}\times R_{diode}}{R_{diode}\times R_{ph} + R_p\times R_{ph}+R_p\times R_{diode}})
$$

已知电子电荷量 $q$，玻尔兹曼常数 $k$。

根据公式：

$$
I_{sc} = (\frac{G}{G_{st}})I_{st}
$$

得到 $I_{sc}$

设置开路电压值可求解反向饱和电流值， $I_{pv} = 0$， $V_{oc}  = V_{pv}$

$$
I_{rev} = \frac{IT}{e^{\frac{qV_{oc}}{kT}}-1}
$$


二极管热电压为 $v$

$$
v = \frac{kT}{q}
$$

最终太阳能电池的输出电流为：

$$
I_{pv} = I_{sc} - I_{rev}(e^{\frac{qv}{kT}}-1)
$$

最终得到光伏电池功率

$$
P_{solar}=I_{pv} \times V_{pv}
$$

