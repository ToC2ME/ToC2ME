% Parallel computing for epicentre location and focal time
% of seismic events from Surface Microseismic Data.
% 
% Runs in MATLAB (https://www.mathworks.com/products/matlab.html)
% Tested in MATLAB R2016b
%
% Author: Germán Rodríguez-Pradilla, University of Calgary
% german.rodriguezprad@ucalgary.ca
% Last revision: May 2020
%
% To run the script, select the MATLAB Script ending with 
% "_SetInputFiles.m", with the Input Files that contain the 
% receivers' coordinates, preliminary earthquake parameters, 
% and the picked P- and S-wave arrival times (in seconds) for 
% all the events.

clc, close all, clear all

RootDir = pwd; addpath(RootDir);

%% 1. Set Input files 
[file,path] = uigetfile({'*_SetInputFiles.m';},...
    'Select MATLAB Script with Input Files');
cd(path); run(file);

%% 2. Import input files
recloc=readtable(InputFile_recloc); recloc_StationName=recloc.StationName;
if strcmp(class(recloc_StationName),'double') == 1
    recloc_StationName = num2cell(recloc_StationName);
end
recloc.StationName=[1:1:size(recloc,1)]'; recloc=table2array(recloc);
sloc_Total=readtable(InputFile_sloc); 
PP_Total = dlmread(InputFile_PP); 
SP_Total = dlmread(InputFile_SP); 

%% 3. Count the selected events with manual picking 
count=1;
for i=1:size(PP_Total,1)
    if mean(PP_Total(i,:))~=0 && mean(SP_Total(i,:))~=0
        EventNum(count,1)=i; count=count+1;
    end
end
PP=PP_Total(EventNum,:); SP=SP_Total(EventNum,:);

%% 4. Locate epicentres with LinEpiLoc.m, in parallel
clc
numcores = feature('numcores');
for i=1:floor(size(PP,1)/numcores)
    tic; Event = numcores*(i-1)+1 : numcores*(i)
    parfor Event = numcores*(i-1)+1 : numcores*(i)
        [sloc_x(Event,1),sloc_y(Event,1),t0(Event,1),...
            R2_Vp(Event,1),R2_Vs(Event,1)]=LinEpiLoc(PP,SP,recloc,recloc_StationName,Event);    
    end
    clc; toc
end

clc; tic; Event = floor(size(PP,1)/numcores)*numcores +1 : size(PP,1)
parfor Event = floor(size(PP,1)/numcores)*numcores +1 : size(PP,1)
    [sloc_x(Event,1),sloc_y(Event,1),t0(Event,1),...
        R2_Vp(Event,1),R2_Vs(Event,1)]=LinEpiLoc(PP,SP,recloc,recloc_StationName,Event);
end
clc; toc
t0=real(t0); MeanR2=(R2_Vp+R2_Vs)./2;

%% 5. Compile results and export text file with the calculated epicentre locations
sloc_Total.LinEpiLoc_X_m(EventNum,1)=sloc_x; sloc_Total.LinEpiLoc_Y_m(EventNum,1)=sloc_y; 
sloc_Total.LinEpiLoc_MeanR2(EventNum,1)=MeanR2; 
sloc_Total.LinEpiLoc_t0_seconds(EventNum,1)=t0;
writetable(sloc_Total,strcat(InputFile_sloc,'_RD_LinEpiLoc.txt'));

%% 6. Plot located events with Mean R2 
clc; close all
figure1 = figure;
x0=20; y0=20; height=450;  width=550; 
set(gcf,'units','points','position',[x0,y0,width,height])
% R2 histogram (Right side)
h(2)=subplot(1,2,2);
[hist_n,hist_edges]=histcounts(sloc_Total.LinEpiLoc_MeanR2);
barh(hist_edges(1:end-1),hist_n,'FaceColor',rgb('SeaGreen'));  
ylim([0 1]); xlim([0 max(hist_n)*1.2]); box on; grid on; hold on
xlabel('Number of Events','FontSize',12);
% A2 = get(gca,'position'); 
set(gca,'position',[0.78 0.11 0.15 0.70]); 
text(max(hist_n)*(-0.35),1.0,'b)','FontSize',12);
% Top view (left side)
h(1)=subplot(1,2,1);
scatter(sloc_Total.LinEpiLoc_X_m,sloc_Total.LinEpiLoc_Y_m,40,...
    sloc_Total.LinEpiLoc_MeanR2,'filled');
box on; grid on; axis equal; hold on
colorscale=hsv; colormap(colorscale); caxis([0 1]);
hcb=colorbar; title(hcb,'Mean R2','FontSize',12); set(hcb,'YTick',[])
% Plot Receivers
scatter(recloc(:,2),recloc(:,3),20,'filled','^','MarkerFaceColor',[0.5 0.5 0.5])
xlim([min(recloc(:,2))-(max(recloc(:,2))-min(recloc(:,2)))/20 ...
    max(recloc(:,2))+(max(recloc(:,2))-min(recloc(:,2)))/10]); 
ylim([min(recloc(:,3))-(max(recloc(:,3))-min(recloc(:,3)))/20 ... 
    max(recloc(:,3))+(max(recloc(:,3))-min(recloc(:,3)))/20]);
for i=1:size(recloc,1); text(recloc(i,2)+200,recloc(i,3),recloc_StationName(i),...
        'Color',[0.5 0.5 0.5],'FontSize',9); end
xlabel('East (m)','FontSize',12); ylabel('North (m)','FontSize',12);
% A1 = get(gca,'position'); 
set(gca,'position',[0.07 0.11 0.60 0.7]);
text(min(recloc(:,2))-(max(recloc(:,2))-min(recloc(:,2)))/8,...
    max(recloc(:,3))+(max(recloc(:,3))-min(recloc(:,3)))/20,'a)','FontSize',12);
% Print figure
print('MS_TopView_MeanR2_AllEvents','-dpng','-r300'); close all