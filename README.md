# Estimation of Hip and Knee Joint Torques During Stair Climbing Using Euler-Lagrange Formulation and Kinovea-Based Kinematic Analysis

### Authors
Hitesh Mohan Veludandi, Subrahmanya Krishna Teja Chimalakonda, Mohammad Sameer,
Sri Charan Sarma Eranki, Mani Varma Vathadi, Dr. Emon Barua
Department of Mechanical Engineering,
Maulana Azad National Institute of Technology, Bhopal, India

### Corresponding author
 emon.barua@manit.ac.in / imon18enator@gmail.com

### Journal
Journal of Biomechanics (Under Review)

---

## Repository Structure

### /data/raw_angles/
Six CSV files containing raw hip and knee angle
data exported directly from Kinovea
at 120 frames per second.

Each file contains two columns:
- Column 1: Time (milli seconds)
- Column 2: Angle (radians)

File naming:
- Subject_hip_angles.csv  — hip angle from vertical
- Subject_knee_angles.csv — included knee angle

Subjects:
- subject 1: 61 kg, 1.69 m, 181 frames, T = 1.502 s
- subject 2: 63 kg, 1.70 m, 158 frames, T = 1.310 s
- subject 3: 73 kg, 1.76 m, 163 frames, T = 1.351 s

### /data/converted_angles/
Three Excel files containing the converted joint
flexion angles after applying theta = pi - |theta_raw|
to the raw Kinovea output.

### /code/MATLAB_Fourier_Fitting.m
MATLAB script for Fourier 4th-order curve fitting
of the converted hip and knee angle data.

Requirements: MATLAB R2020a or later,
Curve Fitting Toolbox

Instructions:
1. Load the converted angle CSV file for the subject
2. Set the subject name at line 35
3. Run the script
4. Coefficients are printed to the command window
5. Fitted curves are plotted automatically

### /code/MATLAB_EulerLagrange_Torque.m
MATLAB script for computing hip and knee joint
torques using the Euler-Lagrange 2-DOF dynamic model.

Requirements: MATLAB R2020a or later

Instructions:
1. Enter Fourier coefficients from fitting script
2. Set subject body mass M and height H at line 15
3. Run the script
4. Torque time histories are plotted and exported

### /supplementary/
Supplementary Table S1 containing all fitted Fourier
coefficients (a0 through b4), R² and RMSE values
for hip and knee angles of all three subjects.

---

## Staircase Specifications
- Riser height: 14.5 cm
- Tread depth: 29.5 cm
- Pitch angle: 26.2 degrees
- Camera: Sony Alpha A6100, 120 fps, Full HD

## Angle Conversion Formula
theta = pi - |theta_raw|
Applied identically to hip and knee angles.
Hip raw angles are negative in Kinovea.
Knee raw angles are positive and obtuse in Kinovea.

