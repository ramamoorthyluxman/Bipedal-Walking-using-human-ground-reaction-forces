function joint_point = transformation_ankle(x_hip,y_hip,alpha,beta,gamma)
l1 = 0.468; 
l2 = 0.526;
X = x_hip-(l1*sin(beta))-(l2*sin((gamma+beta)));
Y = y_hip-(l1*cos(beta))-(l2*cos((gamma+beta)));
joint_point = [X Y];
