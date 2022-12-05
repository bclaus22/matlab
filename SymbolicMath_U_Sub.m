% Benjamin Claus
% Usub calculator using symbolic math

clear all , clc , close all
global intex intexdefl intexdefu intdef intexdef
scrnsize = get(0,'ScreenSize'); % finds user's screen size in pixels
x = 500; % x coordinate of bottom left corner of figure
y = 300; % y coordinate of bottom left corner of figure
w = scrnsize(3) - 2*x; % width of figure
h = scrnsize(4) - 2.5*y; % height of figure
% Create figure and assign handle for figure
%Creates the figure window
fig = figure('Position', [x,y,w,h],'Color',[0.94 0.94 0.94],'Toolbar','none');
uicontrol('Style', 'text');
%Creates string for the title
uicontrol('Style', 'text', 'String', 'U-Sub Calculator', ...
'Position', [140, 120, 200, 50], 'FontSize', 15)
%Creates the edit box as well as the button for convert in Farenheight
uicontrol('Style', 'text', 'String', 'Enter function', ...
'Position', [165, 100, 150, 30], 'FontSize', 10);
uicontrol('Style', 'pushbutton', 'String', 'Integrate', ...
'Position', [315, 70, 150, 30], ...
'Callback', @math);
intex = uicontrol('Style', 'edit', 'String', string, ...
'Position', [165, 70, 150, 30]);
% intexdefl = uicontrol('Style', 'edit', 'String', string, ...
% 'Position', [165, 50, 150, 30]);
% intexdefu = uicontrol('Style', 'edit', 'String', string, ...
% 'Position', [195, 50, 150, 30]);
% intexdef = uicontrol('Style', 'edit', 'String', string(intdef), ...
% 'Position', [30, 70, 150, 30]);
% % intexs = str2sym(intex);


% fprintf('The numerical integration method is %.2f\n', A)
function math(src, event)
global intex symintindef intexs intexdefl intexdefu intexdefls intexdefus intexdef intdef
%global solvint  evalint evalintnum 
syms x 
% intexs = str2sym(intex);

% intex = (cos((sqrt(x))))/(sqrt(x)) ;
%integrates in regaurds to x
intexs = get(intex, 'String');
intexs = str2sym(intexs);
% intexdefls = get(intexdefl, 'String');
% intexdefls = str2double(intexdefls);
% 
% intexdefus = get(intexdefu, 'String');
% intexdefus = str2double(intexdefus);

symintindef = int(intexs, x);
fprintf('The indef integral is %s + c\n', string(symintindef))
print = string(symintindef) + " + c";

% %integrates on a close interval
% symintdef = int(intexs, x, intexdefl, intexdefu);
% %solves for a
% solvint = solve(symintdef, a);
% %evaluates the equation, substitutes for a
% evalint = subs(symintdef, a, 2);
% %turns symblic math into a number
% evalintnum = double(evalint);
% evalintnum = double(symintdef);
% disp(evalintnum)
% intdef = num2string(evalintnum);
% % %prints the number to 2 decimal places
% % % display(intex)
% % % display(solvint)
intex = uicontrol('Style', 'edit', 'String', string(print), ...
'Position', [165, 70, 150, 30]);
% intexdef = uicontrol('Style', 'edit', 'String', string(intdef), ...
% 'Position', [30, 70, 150, 30]);
end