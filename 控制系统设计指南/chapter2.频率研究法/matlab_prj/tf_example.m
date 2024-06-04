% 电感、电容和电阻的数值
L = 1e-3; % 电感（H）
C = 100e-6; % 电容（F）
R = 10; % 电阻（Ω）

% 构建传递函数的分子和分母多项式系数
numerator = 1;
denominator = [L*C, R*C, 1];

% 创建传递函数对象
H = tf(numerator, denominator);

% 显示传递函数
disp('Transfer Function of 2nd Order Low-pass Filter (RLC Circuit):');
disp(H);
