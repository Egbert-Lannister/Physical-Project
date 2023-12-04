# Physical-Project

## 太阳能光伏电池的效率

要求量 $\eta_{pv}$, $\eta_{pv}  = \frac{P_{solar} }{AG} $

其中, $P_{solar}=I_{pv} \times V_{pv}$, $A$是光伏电池的面积, $G$是太阳有效辐射量即直接太阳辐射量

### 计算太阳辐射功率

太阳辐射分析工具根据 Rich 等人（Rich 1990，Rich 等人 1994）创立并进一步由 Fu 和 Rich（2000，2002）发展的半球视域算法中的方法，计算某研究区域范围内或特定位置的日照。

为特定位置或面积计算的辐射总量将以总辐射量形式给出。对每个要素位置或每个地形面中的位置重复计算直射日照量、散射日照量、总日照量，以便生成整个地理区域的日照地图。

太阳辐射量分为直接太阳辐射量 $dir$和散射辐射量 $dif$

$$
G_{st} = dir + dif
$$

太阳赤纬角 $\delta$根据以下公式求出

$$
\delta = 23.45 \sin(2\pi \times \frac{284+n}{365})
$$

式中 $n$是计算日期在一年中的日子数，例如 $n=1$就对应着1月1日

太阳时角 $\phi$的计算方式如下

$$
ST = \frac{当地经度^{\circ}  - 120^{\circ} }{15^{\circ} }
$$

其中ST为真太阳时

$$
\phi = 15\times (ST - 12)
$$

太阳高度角 $\alpha_h$根据以下公式求出

$\sin \alpha_h = \cos \varphi = \sin \delta \sin \phi +\cos \delta \cos \phi \cos \theta $

则可以根据天顶角和高度角之间的关系

$\varphi  = \frac{\pi}{2}  - z$

得到天顶角 $\varphi$

太阳方位角 $\alpha $可以由以下公式求出

$$
\cos \alpha = \frac{\sin\alpha_h\times \sin\theta - \sin\delta}{\cos\alpha_h\times \cos\theta}
$$

太阳日照时长为

$T_s = \frac{2}{15} \arccos (-\tan(\delta ) \times \tan (\theta ) )$

给定位置的总直接日照量($Dir_{tot}$)是所有太阳图扇区中直接日照量

#### 直接太阳辐射量的计算

$$
Dir_{\varphi ,\alpha } = S_{Const} \times β^{m(θ)}\times T_s\times SunGap_{\varphi,\alpha}\times cos(AngIn_{\varphi ,\alpha })
$$

* 其中：
  
  * $S_{Const}$ - 地球与太阳平均距离处大气层外的太阳通量，称为太阳常数。分析中使用的太阳常数是 1367 W/m ^2^ 。这与世界辐射中心 (WRC) 太阳常数保持一致。
  * $β$ - 最短路径（朝向天顶的方向）的大气层透射率（所有波长的平均值）。由于缺乏数据，故采用生成随机数（生成范围0.2~0.9）
  * $m(θ)$ - 相对的光路径长度，以相对于天顶路径长度的比例形式测量。
  * $T_s$ - 以天空扇区表示的持续时间。对于大多数扇区，它等于日间隔（例如一个月）乘以小时间隔（例如半小时）。对于部分扇区（接近地平线），将使用球面几何计算持续时间。
  * $SunGap_{\varphi ,\alpha }$ - 太阳图扇区的孔隙度，采用随机数模拟。
  * $AngIn_{\varphi ,\alpha }$ - 天空扇区的质心与表面的法线轴之间的入射角。

相对的光路径长度计算公式为：

$$
m(\alpha_h) = \frac{e^{(-0.000118\times Elev - 1.638\times 10^{-9}\times  Elev^2)}}{cos(\alpha_h)}
$$

其中，**Elev** - 表示海拔高程，以米为单位。

截留表面与给定天空扇区（其质心位于天顶角 $\alpha_h$和方位角 $\alpha$）之间的入射角将使用下列公式进行计算：

$$
AngIn_{\varphi ,\alpha } = acos( Cos(\varphi) \times Cos(\varphi+15^{\circ} ) + Sin(\varphi)\times Sin(\varphi)\times Cos(\alpha-\varphi) )
$$

#### 散射辐射量的计算

对于每个天空扇区都将计算质心处的散射辐射量 (**Dif**)，并按时间间隔进行整合，再通过孔隙度和入射角进行更正，公式如下：

$$
Dif_{\varphi ,\alpha }= R_{glb}\times P_{dif}\times Dur\times SkyGap_{\varphi ,\alpha }\times  Weight_{\varphi ,\alpha }cos(AngIn_{\varphi ,\alpha })
$$

* 其中：
  * $R_{glb}$ - 表示总正常辐射量
  * $P_{dif}$ - 散射的总正常辐射通量的比例。通常，在天空非常晴朗的条件下，该值约等于 0.2；在天空云层极厚的条件下，该值约等于 0.7，算法实现中使用随机数模拟。
  * $Dur$ - 分析的时间间隔，该情况下模拟的为一小时。
  * $SkyGap_{\varphi ,\alpha }$ - 天空扇区的孔隙度（可见天空的比例），采用随机数模拟
  * $Weight_{\varphi ,\alpha }$ - 给定天空扇区与所有扇区中散射辐射量的比例
  * $AngIn_{\varphi ,\alpha }$ - 天空扇区的质心和截留表面之间的入射角，与直接辐射入射角相同。

总正常辐射量 ( $R_{glb}$) 的计算方法是，对每个扇区（包括遮挡的扇区）中的直接辐射量求和（无需校正入射角），然后校正直接辐射量的比例（等于 1 -$P_{dif}$ ）:

$$
R_{glb} = \frac{(S_{Const}\times \sum (β^{m(θ)}))}{(1 - Pdif)}
$$

对于均匀天空散射模型， $Weight_{\varphi ,\alpha }$ 的计算方法如下：

$$
Weight_{\varphi ,\alpha }= \frac{(cos(\varphi)- cos(\varphi + 15^{\circ} ))}{Div_{azi}}
$$

* 其中：
  * $Div_{azi}$ - 表示天空图中方位分割的数量，具体计算时将天空分为15份，故取常数15。

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
