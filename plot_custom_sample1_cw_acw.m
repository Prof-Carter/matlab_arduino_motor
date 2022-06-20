clear
format compact

% --------------------------------
close all

figure(11)
movegui('northwest')
subplot('Position',[0.18 0.15 0.775 0.775])

figure(12)
movegui('southwest')
subplot('Position',[0.18 0.15 0.775 0.775])

figure(21)
movegui('north')
subplot('Position',[0.18 0.15 0.775 0.775])

figure(22)
movegui('south')
subplot('Position',[0.18 0.15 0.775 0.775])

figure(31)
movegui('northeast')
subplot('Position',[0.18 0.15 0.775 0.775])

% --------------------------------
rootname1 = 'data1/data1_cw';   % ファイル名に使用する文字列
rootname2 = 'data1/data1_acw';  % ファイル名に使用する文字列
extension = '.mat';             % 拡張子

cnt_to_deg = 360/(50*7*4);

% --------------------------------
for pwm = 0:5:255
    filename1 = [rootname1, num2str(abs(pwm)), extension];  % ファイル名の作成
    load(filename1)
    
    figure(11)
    plot(t,cnt_to_deg*y,'LineWidth',1.5)
    hold on
    
    figure(12)
    plot(t,cnt_to_deg*dy,'LineWidth',1.5)
    hold on
end

figure(11)
hold off
set(gca,'FontName','Arial','FontSize',14)
title('CW','FontName','Arial','FontSize',16)
xlabel('$$t$$ [s]', 'interpreter', 'latex','FontSize',18)
ylabel('$$\theta(t)$$ [deg]', 'interpreter', 'latex','FontSize',18)
grid on
ylim([0 360*14])
set(gca,'XTick',0:0.2:2)
set(gca,'YTick',0:360:360*14)
xtickangle(0)

figure(12)
hold off
set(gca,'FontName','Arial','FontSize',14)
title('CW','FontName','Arial','FontSize',16)
xlabel('$$t$$ [s]', 'interpreter', 'latex','FontSize',18)
ylabel('$$\omega(t)=\dot{\theta}(t)$$ [deg/s]', 'interpreter', 'latex','FontSize',18)
grid on
ylim([0 360*8])
set(gca,'XTick',0:0.2:2)
set(gca,'YTick',0:360:360*8)
xtickangle(0)

% --------------------------------
for pwm = -255:5:-5
    filename2 = [rootname2, num2str(abs(pwm)), extension]; % ファイル名の作成
    load(filename2)
    
    figure(21)
    plot(t,cnt_to_deg*y,'LineWidth',1.5)
    hold on
    
    figure(22)
    plot(t,cnt_to_deg*dy,'LineWidth',1.5)
    hold on
end

figure(21)
hold off
set(gca,'FontName','Arial','FontSize',14)
xlabel('$$t$$ [s]', 'interpreter', 'latex','FontSize',18)
ylabel('$$\theta(t)$$ [deg]', 'interpreter', 'latex','FontSize',18)
grid on
ylim([-360*14 0])
title('ACW','FontName','Arial','FontSize',16)
set(gca,'XTick',0:0.2:2)
set(gca,'YTick',-360*14:360:0)
xtickangle(0)

figure(22)
hold off
set(gca,'FontName','Arial','FontSize',14)
xlabel('$$t$$ [s]', 'interpreter', 'latex','FontSize',18)
ylabel('$$\omega(t)=\dot{\theta}(t)$$ [deg/s]', 'interpreter', 'latex','FontSize',18)
grid on
ylim([-360*8 0])
title('ACW','FontName','Arial','FontSize',16)
set(gca,'XTick',0:0.2:2)
set(gca,'YTick',-360*8:360:0)
xtickangle(0)

% --------------------------------
load data1/data1_pwm_dy

figure(31)
plot(d1,cnt_to_deg*d2,'o-','LineWidth',1.5)
set(gca,'FontName','Arial','FontSize',14)
xlabel('pwm', 'interpreter', 'latex','FontSize',18)
ylabel('$${\omega}_{\infty} = \lim_{t \rightarrow \infty}\omega(t)$$ [deg/s]', 'interpreter', 'latex','FontSize',18)
grid on
xlim([-255 255])
ylim([-360*8 360*8])
set(gca,'XTick',-255:51:255)
set(gca,'YTick',-360*8:360*2:360*8)
xtickangle(0)



