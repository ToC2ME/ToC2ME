% LinEpiLoc
% Locate the epicentre of a seismic event
% using a linear 3D NMO regression

function [sloc_x,sloc_y,t0,R2_Vp,R2_Vs]=LinEpiLoc(PP,SP,recloc,recloc_Stations,Event);
close;

% Remove stations without P- or S- pick
count=1;
for i=1:size(recloc,1)
    if PP(Event,i)~=0
        PkP(count)=PP(Event,i);
        PkP_Recloc(count,:)=recloc(i,:);
        count=count+1;
    end
end
count=1;
for i=1:size(recloc,1)
    if SP(Event,i)~=0
        PkS(count)=SP(Event,i);
        PkS_Recloc(count,:)=recloc(i,:);
        count=count+1;
    end
end

% Add static corrections
% Datum=980; % masl
% Vp_ns=1500; % near surface, m/s
% Vs_ns=500; % near surface, m/s
% for i=1:size(PkRecloc,1)
%     PkP(i)=PkP(i)+(Datum-PkRecloc(i,4))/Vp_ns;
%     PkS(i)=PkS(i)+(Datum-PkRecloc(i,4))/Vs_ns;
% end

% Extract t0 and Vp/Vs from Wadati diagram
% Eq. 5.14 from Havskov and Ottemoller, Routine Data Processing in
% Earthquake Seismology, 2010. pp. 118
% p = polyfit(PkP,PkS-PkP,1);
% t0=-p(2)/p(1); VpVsRatio=p(1)+1;
% PkP=PkP-t0; PkS=PkS-t0;
% p = polyfit(PkP,PkS-PkP,1);
t0=0; VpVsRatio=0;

% Calculate grid spacing for first grid-search iteration
[M,I] = min(abs((max(recloc(:,2))-min(recloc(:,2)))/50-5.^[0:1:10])); I=I-1;
%disp('Collapsing grid-search for epicentre location');
step=5^(I); % disp(strcat({'Grid spacing: = '},num2str(step),{' metres'}));
[xq,yq] = meshgrid([min(recloc(:,2)):step:max(recloc(:,2))],[min(recloc(:,3)):step:max(recloc(:,3))]);

exist PkP; CheckPicks=ans;
if ans==1
    if length(PkP)<2;
        CheckPicks=CheckPicks-1;
    end
end
exist PkS; CheckPicks=CheckPicks+ans;
if ans==1
    if length(PkS)<2;
        CheckPicks=CheckPicks-1;
    end
end

if CheckPicks==2
    for i=1:size(xq,1)
        for j=1:size(xq,2)
            % R2 between offset and PkP
            for k=1:size(PkP_Recloc,1)
                offset(k)=sqrt((xq(i,j)-PkP_Recloc(k,2))^2+(yq(i,j)-PkP_Recloc(k,3))^2);
            end
            [p_Vp,S_Vp]=polyfit(offset.^2,PkP.^2,1); clear offset
            % R2 between offset and PkS
            for k=1:size(PkS_Recloc,1)
                offset(k)=sqrt((xq(i,j)-PkS_Recloc(k,2))^2+(yq(i,j)-PkS_Recloc(k,3))^2);
            end
            [p_Vs,S_Vs]=polyfit(offset.^2,PkS.^2,1); clear offset
            % Mean R2 of PkP and PkS
            vq(i,j)=mean([1 - (S_Vp.normr/norm(PkP.^2 - mean(PkP.^2)))^2, 1 - (S_Vs.normr/norm(PkS.^2 - mean(PkS.^2)))^2]);
        end
    end
    max_vq = max(vq(:)); [row,col] = find(vq==max_vq);
    sloc_x=xq(1,col); sloc_y=yq(row,1); sloc(1)=sloc_x; sloc(2)=sloc_y;
    
    %% plot Map view of Mean R2 after first grid-search iteration
    % Comment the following 70 lines to speed up the process
    %   (by not plotting the figure)
    if Event==12 % Event knmi2018pkiy from all_induced catalog
        figure1 = figure;
        x0=20; y0=20; height=500;  width=900;
        set(gcf,'units','points','position',[x0,y0,width,height])
        % Mean R2 contour plot (right side)
        h(3)=subplot(2,2,[2,4]);
        scatter(xq(:),yq(:),5,vq(:),'filled');
        box on; grid on; axis equal; hold on;
        colorscale=jet; colormap(colorscale); caxis([0 1]);
        hcb=colorbar; title(hcb,'Mean R2','FontSize',12);
        contour(xq,yq,vq); scatter(sloc_x,sloc_y,'k','+','LineWidth',2)
        if row > 20; scatter(xq(1,col),yq(row-20,1),'k','+','LineWidth',2)
        else; scatter(xq(1,col),yq(row+20,1),'k','+','LineWidth',2); end
        scatter(recloc(:,2),recloc(:,3),30,'filled','^','MarkerFaceColor',[0.5 0 0.5])
        % Plot labels for receiver stations
        for i=1:size(recloc,1); text(recloc(i,2)+100,recloc(i,3),recloc_Stations(i)); end
        xlabel('East (m)','FontSize',12); ylabel('North (m)','FontSize',12);
        A3 = get(gca,'position'); set(gca,'position',[[[0.50,0.11,0.4,0.815]]]);
        % Picks vs Offset and R2 (top left)
        h(1)=subplot(2,2,1);
        % Calculate final Mean R2 for P-phase picks
        for i=1:size(PkP_Recloc,1)
            PkP_offset(i)=sqrt((sloc_x-PkP_Recloc(i,2))^2+(sloc_y-PkP_Recloc(i,3))^2);
        end
        [p_Vp,S_Vp]=polyfit(PkP_offset.^2,PkP.^2,1);
        R2_Vp=1 - (S_Vp.normr/norm(PkP.^2 - mean(PkP.^2)))^2;
        % Calculate final Mean R2 for S-phase picks
        for i=1:size(PkS_Recloc,1)
            PkS_offset(i)=sqrt((sloc_x-PkS_Recloc(i,2))^2+(sloc_y-PkS_Recloc(i,3))^2);
        end
        [p_Vs,S_Vs]=polyfit(PkS_offset.^2,PkS.^2,1);
        R2_Vs=1 - (S_Vs.normr/norm(PkS.^2 - mean(PkS.^2)))^2;
        scatter(PkP_offset.^2,PkP.^2,'b'); hold on; grid on; box on;
        scatter(PkS_offset.^2,PkS.^2,'MarkerEdgeColor',[0 0.5 0]);
        plot(PkP_offset.^2,polyval(p_Vp,PkP_offset.^2),'b');
        plot(PkS_offset.^2,polyval(p_Vs,PkS_offset.^2),'color',[0 0.5 0]);
        xlabel('Offset^2 (m^2)'); ylabel('t^2(s^2)');
        xLimits = get(gca,'XLim'); yLimits = get(gca,'YLim'); set(h(1), 'YDir', 'reverse');
        text(7.*(xLimits(2)-xLimits(1))/10+xLimits(1),2.*(yLimits(2)-yLimits(1))/10+yLimits(1),...
            strcat('R2=',num2str(R2_Vp)),'color','b','FontSize',12);
        text(7.*(xLimits(2)-xLimits(1))/10+xLimits(1),7.*(yLimits(2)-yLimits(1))/10+yLimits(1),...
            strcat('R2=',num2str(R2_Vs)),'color',[0 0.5 0],'FontSize',12);
        text(6.*(xLimits(2)-xLimits(1))/10+xLimits(1),4.5.*(yLimits(2)-yLimits(1))/10+yLimits(1),...
            strcat('Mean R2=',num2str(mean(cat(2,R2_Vp,R2_Vs),2))),'color','k','FontSize',12);
        set(gca,'position',[[0.08,0.5838,0.3347,0.3412]]);
        % Picks vs Offset and R2 (bottom left)
        h(2)=subplot(2,2,3);
        % Calculate final Mean R2 for P-phase picks
        for i=1:size(PkP_Recloc,1)
            if row > 20; PkP_offset(i)=sqrt((xq(1,col)-PkP_Recloc(i,2))^2+(yq(row-20,1)-PkP_Recloc(i,3))^2);
            else; PkP_offset(i)=sqrt((xq(1,col)-PkP_Recloc(i,2))^2+(yq(row+20,1)-PkP_Recloc(i,3))^2); end
        end
        [p_Vp,S_Vp]=polyfit(PkP_offset.^2,PkP.^2,1);
        R2_Vp=1 - (S_Vp.normr/norm(PkP.^2 - mean(PkP.^2)))^2;
        % Calculate final Mean R2 for S-phase picks
        for i=1:size(PkS_Recloc,1)
            if row > 20; PkS_offset(i)=sqrt((xq(1,col)-PkS_Recloc(i,2))^2+(yq(row-20,1)-PkS_Recloc(i,3))^2);
            else; PkS_offset(i)=sqrt((xq(1,col)-PkS_Recloc(i,2))^2+(yq(row+20,1)-PkS_Recloc(i,3))^2); end
        end
        [p_Vs,S_Vs]=polyfit(PkS_offset.^2,PkS.^2,1);
        R2_Vs=1 - (S_Vs.normr/norm(PkS.^2 - mean(PkS.^2)))^2;
        scatter(PkP_offset.^2,PkP.^2,'b'); hold on; grid on; box on;
        scatter(PkS_offset.^2,PkS.^2,'MarkerEdgeColor',[0 0.5 0]);
        plot(PkP_offset.^2,polyval(p_Vp,PkP_offset.^2),'b');
        plot(PkS_offset.^2,polyval(p_Vs,PkS_offset.^2),'color',[0 0.5 0]);
        xlabel('Offset^2 (m^2)'); ylabel('t^2(s^2)');
        xLimits = get(gca,'XLim'); yLimits = get(gca,'YLim'); set(h(2), 'YDir', 'reverse');
        text(7.*(xLimits(2)-xLimits(1))/10+xLimits(1),1.*(yLimits(2)-yLimits(1))/10+yLimits(1),...
            strcat('R2=',num2str(R2_Vp)),'color','b','FontSize',12);
        text(7.*(xLimits(2)-xLimits(1))/10+xLimits(1),8.5.*(yLimits(2)-yLimits(1))/10+yLimits(1),...
            strcat('R2=',num2str(R2_Vs)),'color',[0 0.5 0],'FontSize',12);
        text(6.*(xLimits(2)-xLimits(1))/10+xLimits(1),4.5.*(yLimits(2)-yLimits(1))/10+yLimits(1),...
            strcat('Mean R2=',num2str(mean(cat(2,R2_Vp,R2_Vs),2))),'color','k','FontSize',12);
        % A2 = get(gca,'position');
        set(gca,'position',[[0.08,0.11,0.3347,0.3412]]);
        % pause; close all
        % Print figure
        FigureName=strcat('MS_Top_View_MeanR2_',num2str(Event));
        print(FigureName,'-dpng','-r300'); pause(1); close all
    end
    
    %% Following collapsing-grid-search iterations
    % It stops when the grid spacing ("step") is 1 metre
    for iteration=1:I
        clear vq;
        step=step/5; % disp(strcat({'Grid spacing: '},num2str(step),{' metres'}));
        [xq,yq] = meshgrid([sloc_x-10*step:step:sloc_x+10*step],[sloc_y-10*step:step:sloc_y+10*step]);
        % scatter(xq(:),yq(:)); hold on; axis equal
        for i=1:size(xq,1)
            for j=1:size(xq,2)
                % R2 between offset and PkP
                for k=1:size(PkP_Recloc,1)
                    offset(k)=sqrt((xq(i,j)-PkP_Recloc(k,2))^2+(yq(i,j)-PkP_Recloc(k,3))^2);
                end
                [p_Vp,S_Vp]=polyfit(offset.^2,PkP.^2,1); clear offset
                % vq(i,j)=1 - (S_Vp.normr/norm(PkP.^2 - mean(PkP.^2)))^2;
                % R2 between offset and PkS
                for k=1:size(PkS_Recloc,1)
                    offset(k)=sqrt((xq(i,j)-PkS_Recloc(k,2))^2+(yq(i,j)-PkS_Recloc(k,3))^2);
                end
                [p_Vs,S_Vs]=polyfit(offset.^2,PkS.^2,1); clear offset
                %vq(i,j)=1 - (S_Vs.normr/norm(PkS.^2 - mean(PkS.^2)))^2;
                % mean R2 of PkP and PkS
                vq(i,j)=mean([1 - (S_Vp.normr/norm(PkP.^2 - mean(PkP.^2)))^2, 1 - (S_Vs.normr/norm(PkS.^2 - mean(PkS.^2)))^2]);
            end
        end
        max_vq = max(vq(:)); [row,col] = find(vq==max_vq);
        sloc_x=xq(1,col); sloc_y=yq(row,1);
    end
    
    % Final epicentre location
    sloc(1)=sloc_x; sloc(2)=sloc_y; sloc(4)=max(vq(:));
    
    % Calculate final R2 for Vp
    for i=1:size(PkP_Recloc,1)
        PkP_offset(i)=sqrt((sloc_x-PkP_Recloc(i,2)).^2+(sloc_y-PkP_Recloc(i,3)).^2);
    end
    [p_Vp,S_Vp]=polyfit(PkP_offset.^2,PkP.^2,1);
    R2_Vp = 1 - (S_Vp.normr/norm(PkP.^2 - mean(PkP.^2)))^2;
    % Calculate final R2 for Vs
    for i=1:size(PkS_Recloc,1)
        PkS_offset(i)=sqrt((sloc_x-PkS_Recloc(i,2))^2+(sloc_y-PkS_Recloc(i,3))^2);
    end
    [p_Vs,S_Vs]=polyfit(PkS_offset.^2,PkS.^2,1);
    R2_Vs = 1 - (S_Vs.normr/norm(PkS.^2 - mean(PkS.^2)))^2;
    % Focal time
    t0=(polyval(p_Vs,0))^0.5-(polyval(p_Vp,0))^0.5;
else
    sloc_x=0; sloc_y=0; t0=0; VpVsRatio=0; R2_Vp=0; R2_Vs=0;
end

% Plot picks vs offset
% close
% figure2 = figure;
% scatter(PkP_offset.^2,PkP.^2,'b'); hold on; grid on; box on;
% scatter(PkS_offset.^2,PkS.^2,'MarkerEdgeColor',rgb('Green'));
% plot(PkP_offset.^2,polyval(p_Vp,PkP_offset.^2),'b');
% plot(PkS_offset.^2,polyval(p_Vs,PkS_offset.^2),'color',rgb('Green'));
% xlabel('Offset^2 (m^2)'); ylabel('t^2(s^2)');
% xLimits = get(gca,'XLim'); yLimits = get(gca,'YLim');
% text(8.*(xLimits(2)-xLimits(1))/10+xLimits(1),3.*(yLimits(2)-yLimits(1))/10+yLimits(1),...
%     strcat('R2=',num2str(R2_Vp)),'color','b');
% text(8.*(xLimits(2)-xLimits(1))/10+xLimits(1),7.*(yLimits(2)-yLimits(1))/10+yLimits(1),...
%     strcat('R2=',num2str(R2_Vs)),'color',rgb('Green'));
% % Include R2 of Vp/Vs
% % scatter(offset.^2,(PkS-PkP).^2,'r');
% % plot(offset.^2,polyval(p_Vs_p,offset.^2),'r');
% % text(8.*(xLimits(2)-xLimits(1))/10+xLimits(1),1.*(yLimits(2)-yLimits(1))/10+yLimits(1),...
% %     strcat('R2=',num2str(R2_Vs_p)),'color','r');
