% Benjamin Claus
% Usub calculator using symbolic math

clear all , clc , close all
scrnsize = get(0,'ScreenSize'); % finds user's screen size in pixels
x = 500; % x coordinate of bottom left corner of figure
y = 300; % y coordinate of bottom left corner of figure
w = scrnsize(3) - 2*x; % width of figure
h = scrnsize(4) - 2.5*y; % height of figure
% Create figure and assign handle for figure
%Creates the figure window
fig = figure('Position', [x,y,w,h],'Color',[0.94 0.94 0.94],'Toolbar','none');
uicontrol('Style', 'text');
%asks if you would like to integrate over a closed interval or indefinately
uicontrol('Style', 'pushbutton', 'String', 'Integrate indef', ...
'Position', [40, 120, 200, 50], ...
'Callback', @fig1);
%asks if you would like to integrate over a closed interval or indefinately
uicontrol('Style', 'pushbutton', 'String', 'Integrate def', ...
'Position', [240, 120, 200, 50], ...
'Callback', @fig2);



function fig1(src, event)
global intexin
close all
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
uicontrol('Style', 'text', 'String', 'Integral Calculator', ...
'Position', [140, 120, 200, 50], 'FontSize', 15)
%Creates the edit box as well as the button for convert in Farenheight
uicontrol('Style', 'text', 'String', 'Enter function', ...
'Position', [165, 100, 150, 30], 'FontSize', 10);
uicontrol('Style', 'pushbutton', 'String', 'Integrate', ...
'Position', [315, 70, 150, 30], ...
'Callback', @math);
intexin = uicontrol('Style', 'edit', 'String', string, ...
'Position', [165, 70, 150, 30]);
end

function fig2(src, event)
global intex intexdefmn intexdefmx intexdef
close all
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
uicontrol('Style', 'text', 'String', 'Integral Calculator', ...
'Position', [140, 120, 200, 50], 'FontSize', 15)
%Creates the edit box as well as the button for convert in Farenheight
uicontrol('Style', 'text', 'String', 'Enter function', ...
'Position', [165, 100, 150, 30], 'FontSize', 10);
uicontrol('Style', 'pushbutton', 'String', 'Integrate', ...
'Position', [315, 70, 150, 30], ...
'Callback', @math2);
intex = uicontrol('Style', 'edit', 'String', string, ...
'Position', [165, 70, 150, 30]);
intexdefmn = uicontrol('Style', 'edit', 'String', string, ...
'Position', [15, 30, 150, 30]);
uicontrol('Style', 'text', 'String', 'Enter x-min', ...
'Position', [15, 0, 150, 30], 'FontSize', 8);
intexdefmx = uicontrol('Style', 'edit', 'String', string, ...
'Position', [165, 30, 150, 30]);
uicontrol('Style', 'text', 'String', 'Enter x-max', ...
'Position', [165, 0, 150, 30], 'FontSize', 8);
intexdef = uicontrol('Style', 'edit', 'String', string, ...
'Position', [295, 30, 150, 30]);
end


% fprintf('The numerical integration method is %.2f\n', A)
function math(src, event)
global intexin symintindef intexs 
syms x 
intexs = get(intexin, 'String');
intexs = str2sym(intexs);
symintindef = int(intexs, x);
fprintf('The indef integral is %s + c\n', string(symintindef))
print = string(symintindef) + " + c";
intexin = uicontrol('Style', 'edit', 'String', string(print), ...
'Position', [165, 70, 150, 30]);
end

function math2(src, event)
global intex intexdefmn intexdefmx intexdef intexdefmxs intexdefmns 
syms x
intexs = get(intex, 'String');
intexs = str2sym(intexs);
intexdefmns = get(intexdefmn, 'String');
intexdefmns = str2num(intexdefmns);
intexdefmxs = get(intexdefmx, 'String');
intexdefmxs = str2num(intexdefmxs);
symintdef = int(intexs, x, intexdefmns, intexdefmxs);
defprint = string(symintdef);
symintindef = int(intexs, x);
print = string(symintindef);
intex = uicontrol('Style', 'edit', 'String', string(print), ...
'Position', [165, 70, 150, 30]);
intexdef = uicontrol('Style', 'edit', 'String', string(defprint), ...
'Position', [295, 30, 150, 30]);
end

