function joint_point = transformation_knee(x_hip,y_hip,alpha,beta)
l1 = 0.468;
X = x_hip-(l1*sin(beta));
Y = y_hip-(l1*cos(beta));
joint_point = [X Y];
