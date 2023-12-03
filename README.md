# Physical-Project

## 太阳能光伏电池的效率(关于太阳高度角)

要求量 $\eta_{pv} $
$\eta_{pv}  = \frac{P_solar}{AG} $

其中, $P_{solar}=I_{pv} \times V_{pv}$, $A$是光伏电池的面积, $G$是太阳有效辐射量即直接太阳辐射量

### 计算太阳辐射量

太阳辐射量分为直接太阳辐射量和散射辐射量

$ z $ 得到太阳高度角

```
% Define parameter

R = 1; % radius

beta = 70;  

theta = 40;  

beta = beta * pi / 180;  

theta = theta * pi / 180;  

d = R * cos(beta); % Calculate the value of d

% Create phi values 

phi = linspace(0, 2 * pi, 100);  

% Calculatex, y 

x = R * sin(beta) * sin(phi);  

y = R * sin(beta) * cos(phi) * sin(theta) + d * cos(theta);  

% Calculate solar zenith angle

z = R * sin(beta) * cos(phi) * cos(theta) - d * sin(theta);
```

已知威海市纬度 $\theta = 37.5^{\circ} $

赤纬角$\delta $、纬度 $\theta$、高度角 $z $之间存在以下关系

$z = \frac{\pi}{2}  - (\theta +\delta )$

由此得到赤纬角$\delta $

太阳高度角 $z $ 和天顶角 $\varphi $之间的关系有

$\sin z = \cos \varphi = \sin \delta \sin \phi +\cos \delta \cos \phi \cos \theta $

则可以根据天顶角和高度角之间的关系

$\varphi  = \frac{\pi}{2}  - z $

得到天顶角$\varphi $

太阳日照时长为

$T_s = \frac{2}{15} \arccos (-\tan(\delta ) \times \tan (\theta ) )$

给定位置的总直接日照量($Dir_{tot}$)是所有太阳图扇区中直接日照量

