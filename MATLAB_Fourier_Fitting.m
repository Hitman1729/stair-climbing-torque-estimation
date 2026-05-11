% Read Excel file
data = readtable('SubjectName_hip/knee_data.xlsx', 'VariableNamingRule', 'preserve');

% Extract columns (Time & Angle)
t = data{:,1}; % Time (s)
theta = data{:,2}; % Angle (rad)

%Raw data plot
figure;
plot(t, theta, 'o')
xlabel('Time (s)')
ylabel('Angle')
title('Raw Data')
grid on

% Perform Fourier4 curve fitting
fitresult = fit(t, theta, 'fourier4');

% Plot result
figure;
plot(fitresult, t, theta);
xlabel('Time (s)');
ylabel('Angle (rad)');
title('Fourier4 Curve Fitting');
grid on;
% Display equation
disp(fitresult);

% Get coefficients
coeffs = coeffvalues(fitresult);
disp('Coefficients:');
disp(coeffs);

%Goodness fit
R2 = gof.rsquare;
RMSE = gof.rmse;

disp(['R-squared (R²): ', num2str(R2)]);
disp(['RMSE: ', num2str(RMSE)]);
