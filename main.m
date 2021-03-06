sample_time = 1;
Trajectory = csvread('Trajectory.csv');
Force_plates = csvread('Force_plates.csv');

Force = Force_plates(1:33:end,:);
Force = [Force(:,9) Force(:,10) Force(:,21) Force(:,22)];

Ref_state(:,1) = 0.001*Trajectory(:,3);
Ref_state(:,2) = 0.001*Trajectory(:,4);
Ref_state(:,3) = deg2rad(Trajectory(:,23));
Ref_state(:,4) = -deg2rad(Trajectory(:,5));
Ref_state(:,5) = -deg2rad(Trajectory(:,14));
Ref_state(:,6) = deg2rad(Trajectory(:,8));
Ref_state(:,7) = deg2rad(Trajectory(:,17));
Ref_state(:,8) = deg2rad(Trajectory(:,11))-(pi/2);
Ref_state(:,9) = deg2rad(Trajectory(:,20))-(pi/2);

Init_state = Ref_state(1,:);

g = 9.8;
m = 67;
m0 = 0.68*m; 
m1 = 0.1*m; 
m2 = 0.06*m; 
m3 = 0.008*m; 
l0 = 0.2576;
l1 = 0.458;
l2 = 0.491;
l3 = 0.24;
r0 = l0/2; 
r1 = l1/2; 
r2 = l2/2; 
r3 = l3/2;
J0 = 1/12*m0*l0^2;
J1 = 1/12*m1*l1^2;
J2 = 1/12*m2*l2^2;
J3 = 1/12*m3*l3^2;
x00 = Ref_state(1,1);
y00 = Ref_state(1,2);
a0 = Ref_state(1,3);
bl0 = Ref_state(1,4);
br0 = Ref_state(1,5);
cl0 = Ref_state(1,6);
cr0 = Ref_state(1,7);
initstate.coordinates = [x00, y00, a0, bl0, br0, cl0, cr0];
px00 = 0;
py00 = 0;
pa0 = 0;
pbl0 = 0;
pbr0 = 0;
pcl0 = 0;
pcr0 = 0;
initstate.speeds = [px00, py00, pa0, pbl0, pbr0, pcl0, pcr0];
Ref_trajectory.signals.values = Ref_state;
Ref_trajectory.time = [];
Force_values.signals.values = Force;
Force_values.time = [];
sim('Model');
theta_hip_L1 = rad2deg(state(:,4));
theta_hip_R1 = rad2deg(state(:,5));
theta_knee_L1 = rad2deg(state(:,6));
theta_knee_R1 = rad2deg(state(:,7));
theta_hip_L2 = rad2deg(State_out_put(:,1));
theta_hip_R2 = rad2deg(State_out_put(:,2));
theta_knee_L2 = rad2deg(State_out_put(:,3));
theta_knee_R2 = rad2deg(State_out_put(:,4));
figure(1)
plot(theta_hip_L1);
title('Estimated and experiment data base hip rotation angles comparison - Left leg'); 
hold on
plot(theta_hip_L2,'color','r');
legend('experiment reading - data base','simulation results');
figure(2)
plot(theta_hip_R1);
title('Estimated and experiment data base hip rotation angles comparison - Right leg');
hold on
plot(theta_hip_R2,'color','r');
legend('experiment reading - data base','simulation results');
figure(3)
plot(theta_knee_L1);
title('Estimated and experiment data base knee rotation angles comparison - Left leg');
hold on
plot(theta_knee_L2,'color','r');
legend('experiment reading - data base','simulation results');
figure(4)
plot(theta_knee_R1);
title('Estimated and experiment data base knee rotation angles comparison - Right leg');
hold on
plot(theta_knee_R2,'color','r');
legend('experiment reading - data base','simulation results');
figure(5)
plot(Ref_forces(1:2000,1));
title('Estimated and experiment data base, ground reaction forces comparison - Along X direction');
hold on
plot(Estimated_forces(1:2000,1));
legend('Reference force','Estimated force');
figure(6)
plot(Ref_forces(1:2000,2));
title('Estimated and experiment data base, ground reaction forces comparison - Along Y direction');
hold on
plot(Estimated_forces(1:2000,2),'color','r');
legend('Reference force','Estimated force');
figure(7)
plot(medfilt1(Estimated_Moments(1:2000,1),30));
title('PID controller estimated hip torque - Left leg');
figure(8)
plot(medfilt1(Estimated_Moments(1:2000,2),30));
title('PID controller estimated hip torque - Right leg');
figure(8)
plot(medfilt1(Estimated_Moments(1:2000,3),30));
title('PID controller estimated knee torque - Left leg');
figure(9)
plot(medfilt1(Estimated_Moments(1:2000,4),30));
title('PID controller estimated knee torque - Right leg');
figure(10)
plot(medfilt1(Estimated_Moments(1:2000,1).*sin(deg2rad(theta_hip_L2(1:2000))),30)*l1);
title('Knee joint forces');
hold on
plot(medfilt1(Estimated_Moments(1:2000,2).*sin(deg2rad(theta_hip_R2(1:2000))),30)*l1,'color','r');
legend('Left','Right');
figure(11)
plot(medfilt1(Estimated_Moments(1:2000,3).*sin(deg2rad(theta_knee_L2(1:2000))),30)*l2);
title('Anklee joint forces');
hold on
plot(medfilt1(Estimated_Moments(1:2000,4).*sin(deg2rad(theta_knee_R2(1:2000))),30)*l2,'color','r');
legend('Left','Right');
figure(12)
walking_animation(state);
