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

uicontrol('Style', 'text', 'String', 'U-Sub Calculator', ...
'Position', [140, 120, 200, 50], 'FontSize', 15)

uicontrol('Style', 'text', 'String', 'Enter function', ...
'Position', [165, 100, 150, 30], 'FontSize', 10);
uicontrol('Style', 'pushbutton', 'String', 'Integrate', ...
'Position', [315, 70, 150, 30], ...
'Callback', @math);
intex = uicontrol('Style', 'edit', 'String', string, ...
'Position', [165, 70, 150, 30]);




function math(src, event)
global intex symintindef intexs intexdefl intexdefu intexdefls intexdefus intexdef intdef

syms x 

%integrates in regaurds to x
intexs = get(intex, 'String');
intexs = str2sym(intexs);


symintindef = int(intexs, x);
fprintf('The indef integral is %s + c\n', string(symintindef))
print = string(symintindef) + " + c";

intex = uicontrol('Style', 'edit', 'String', string(print), ...
'Position', [165, 70, 150, 30]);
% intexdef = uicontrol('Style', 'edit', 'String', string(intdef), ...
% 'Position', [30, 70, 150, 30]);
end
