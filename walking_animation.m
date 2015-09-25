function walking_animation(Y)
for i=1:size(Y,1)
Y_head(i,1:2) = transformation_head(Y(i,1),Y(i,2),Y(i,3));
Y_hip(i,1:2) = transformation_hip(Y(i,1),Y(i,2),Y(i,3));
Y_kneeL(i,1:2) = transformation_knee(Y_hip(i,1),Y_hip(i,2),Y(i,3),Y(i,4));
Y_kneeR(i,1:2) = transformation_knee(Y_hip(i,1),Y_hip(i,2),Y(i,3),Y(i,5));
Y_ankleL(i,1:2) = transformation_ankle(Y_hip(i,1),Y_hip(i,2),Y(i,3),Y(i,4),Y(i,6));
Y_ankleR(i,1:2) = transformation_ankle(Y_hip(i,1),Y_hip(i,2),Y(i,3),Y(i,5),Y(i,7));
Y_footL(i,1:2) = transformation_foot(Y_hip(i,1),Y_hip(i,2),Y(i,3),Y(i,4),Y(i,6),Y(i,8));
Y_footR(i,1:2) = transformation_foot(Y_hip(i,1),Y_hip(i,2),Y(i,3),Y(i,5),Y(i,7),Y(i,9));
end

% Movie

n = size(Y,1);

k = 1;

drawnow;

figure(1)

subplot(1,1,1)
axis_limits = vertcat(Y_head,Y_hip,Y_kneeL,Y_kneeR,Y_ankleL,Y_ankleR,Y_footL,Y_footR);
Min_Val = min(axis_limits);
Max_Val = max(axis_limits);

xlim([Min_Val(1) Max_Val(1)]);
ylim([Min_Val(2) Max_Val(2)]);
daspect([1,1,1]);
axis manual
linehandle1 = plot(nan,nan);

hold on
xlim([Min_Val(1) Max_Val(1)]);
ylim([Min_Val(2) Max_Val(2)]);
daspect([1,1,1]);
axis manual
linehandle2 = plot(nan,nan);

hold on
xlim([Min_Val(1) Max_Val(1)]);
ylim([Min_Val(2) Max_Val(2)]);
daspect([1,1,1]);
axis manual
linehandle3 = plot(nan,nan);

hold on
xlim([Min_Val(1) Max_Val(1)]);
ylim([Min_Val(2) Max_Val(2)]);
daspect([1,1,1]);
axis manual
linehandle4 = plot(nan,nan);

hold on
xlim([Min_Val(1) Max_Val(1)]);
ylim([Min_Val(2) Max_Val(2)]);
daspect([1,1,1]);
axis manual
linehandle5 = plot(nan,nan);

hold on
xlim([Min_Val(1) Max_Val(1)]);
ylim([Min_Val(2) Max_Val(2)]);
daspect([1,1,1]);
axis manual
linehandle6 = plot(nan,nan);

hold on
xlim([Min_Val(1) Max_Val(1)]);
ylim([Min_Val(2) Max_Val(2)]);
daspect([1,1,1]);
axis manual
linehandle7 = plot(nan,nan);

hold on
xlim([Min_Val(1) Max_Val(1)]);
ylim([Min_Val(2) Max_Val(2)]);
daspect([1,1,1]);
axis manual
linehandle8 = plot(nan,nan);

axishandle = gca;
set(axishandle,'units','pixels')
framePos = get(axishandle,'position');

clear Frames

for j = 1:100:n
    set(linehandle1,'XData',[Y_head(j,1) Y(j,1)],'YData',[Y_head(j,2) Y(j,2)],'Zdata',[0 0]);
    set(linehandle2,'XData',[Y(j,1) Y_hip(j,1)],'YData',[Y(j,2) Y_hip(j,2)],'Zdata',[0 0]);
    set(linehandle3,'XData',[Y_hip(j,1) Y_kneeL(j,1)],'YData',[Y_hip(j,2) Y_kneeL(j,2)],'Zdata',[0 0]);
    set(linehandle4,'XData',[Y_hip(j,1) Y_kneeR(j,1)],'YData',[Y_hip(j,2) Y_kneeR(j,2)],'Zdata',[0 0]);
    set(linehandle5,'XData',[Y_kneeL(j,1) Y_ankleL(j,1)],'YData',[Y_kneeL(j,2) Y_ankleL(j,2)],'Zdata',[0 0]);
    set(linehandle6,'XData',[Y_kneeR(j,1) Y_ankleR(j,1)],'YData',[Y_kneeR(j,2) Y_ankleR(j,2)],'Zdata',[0 0]);
    set(linehandle7,'XData',[Y_ankleL(j,1) Y_footL(j,1)],'YData',[Y_ankleL(j,2) Y_footL(j,2)],'Zdata',[0 0]);
    set(linehandle8,'XData',[Y_ankleR(j,1) Y_footR(j,1)],'YData',[Y_ankleR(j,2) Y_footR(j,2)],'Zdata',[0 0]);
    
    grid on;
    Frames(k) = getframe(gca);
    k = k+1;

end


figure(2)
clf
xlim([Min_Val(1) Max_Val(1)]);
ylim([Min_Val(2) Max_Val(2)]);
daspect([1,1,1]);
fprintf('starting movie now \n');
movie(Frames,1,500);