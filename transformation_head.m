function joint_point = transformation_head(x,y,alpha)
l0 = 0.2576; 
X = x+((l0)*sin(alpha));
Y = y+((l0)*cos(alpha));
joint_point = [X Y];