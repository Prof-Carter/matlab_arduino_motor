clear
format compact

type = 1;   % ample1_cw_acw1_plot.slx をエクスターナル実行する場合
% type = 2;   % ample1_cw_acw2_plot.slx をエクスターナル実行する場合

mkdir data1             % フォルダ data1 を生成

h = 0.01;               % サンプリング周期

extension = '.mat';     % 拡張子

num = 0;

tic

for pwm = -255:5:255    
    if pwm >= 0
        rootname  = 'data1/data1_cw';     % ファイル名に使用する文字列
    elseif pwm < 0
        rootname  = 'data1/data1_acw';    % ファイル名に使用する文字列
    end
    
    pwm
    
    num = num + 1;
    
    if type == 1
        % Simulink モデル sample1_cw_acw1_plot.slx をエクスターナル実行
        set_param('sample1_cw_acw1_plot', 'SimulationCommand', 'start')
        pause(10)
    else
        % Simulink モデル sample1_cw_acw2_plot.slx をエクスターナル実行
        set_param('sample1_cw_acw2_plot', 'SimulationCommand', 'start')
        pause(10)
    end
    
    % 中心差分近似により角速度を算出
    n = length(t);
    dy(1) = 0;
    for i = 2:n-1
        dy(i) = (y(i+1) - y(i-1))/(2*h);
    end
    dy(n) = (y(n-2) - 4*y(n-1) + 3*y(n))/(2*h);

    % 定常角速度を算出
    dyinf = mean(dy(n-10:n));

    % 角度をグラフにプロット
    figure(1)
    plot(t,y)
    hold on
    
    % 角速度をグラフにプロット
    figure(2)
    plot(t,dy)
    hold on

    % データを保存    
    filename = [rootname, num2str(abs(pwm)), extension]; % ファイル名の作成
    save(filename,'t','y','dy','pwm','dyinf')
    
    % pwm の値と定常角速度の値を d1, d2 に格納 
    d1(num) = pwm;
    d2(num) = dyinf;
end

toc

figure(1); hold off
figure(2); hold off

% データ d1, d2 を保存
save data1/data1_pwm_dy d1 d2
    

