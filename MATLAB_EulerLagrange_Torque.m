% Given data
M = Enter subject weight;
H = Enter subject height;
g = 9.81;

m1 = 0.10*M;
m2 = 0.0465*M;

L1 = 0.245*H;
L2 = 0.246*H;

lc1 = 0.433*L1;
lc2 = 0.433*L2;

I1 = m1*(0.323*L1)^2;
I2 = m2*(0.302*L2)^2;

%data reading from the sheets
data = readtable('EnterSubjectName_converted_angles.xlsx', 'VariableNamingRule', 'preserve');
t = data{:,1}; % Time
theta1 = data{:,2}; % Hip angle
theta2 = data{:,3}; % Knee angle

%Euler Lagrange model
tau1 = zeros(size(t));
tau2 = zeros(size(t));

for i = 1:length(t)
    
    th1 = theta1(i);
    th2 = theta2(i);
    dth1 = theta1_dot(i);
    dth2 = theta2_dot(i);
    ddth1 = theta1_ddot(i);
    ddth2 = theta2_ddot(i);

    % Mass matrix
    M11 = I1 + I2 + m1*lc1^2 + m2*(L1^2 + lc2^2 + 2*L1*lc2*cos(th2));
    M12 = I2 + m2*(lc2^2 + L1*lc2*cos(th2));
    M21 = M12;
    M22 = I2 + m2*lc2^2;

    % Coriolis
    C1 = -m2*L1*lc2*sin(th2)*(2*dth1*dth2 + dth2^2);
    C2 =  m2*L1*lc2*sin(th2)*(dth1^2);

    % Gravity
    G1 = (m1*lc1 + m2*L1)*g*sin(th1) + m2*lc2*g*sin(th1 + th2);
    G2 = m2*lc2*g*sin(th1 + th2);

    % Torque
    tau1(i) = M11*ddth1 + M12*ddth2 + C1 + G1;
    tau2(i) = M21*ddth1 + M22*ddth2 + C2 + G2;
end


