function joint_point = transformation_foot(x_hip,y_hip,alpha,beta,gamma,theta)
l1 = 0.468;
l2 = 0.526;
l3 = 0.18;
X = x_hip-(l1*sin(beta))-(l2*sin((gamma+beta)))-(l3*sin((gamma+theta)));
Y = y_hip-(l1*cos(beta))-(l2*cos((gamma+beta)))-(l3*cos((gamma+theta)));
joint_point = [X Y];
