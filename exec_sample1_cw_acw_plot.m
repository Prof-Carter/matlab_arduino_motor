clear
format compact

type = 1;   % ample1_cw_acw1_plot.slx ���G�N�X�^�[�i�����s����ꍇ
% type = 2;   % ample1_cw_acw2_plot.slx ���G�N�X�^�[�i�����s����ꍇ

mkdir data1             % �t�H���_ data1 �𐶐�

h = 0.01;               % �T���v�����O����

extension = '.mat';     % �g���q

num = 0;

tic

for pwm = -255:5:255    
    if pwm >= 0
        rootname  = 'data1/data1_cw';     % �t�@�C�����Ɏg�p���镶����
    elseif pwm < 0
        rootname  = 'data1/data1_acw';    % �t�@�C�����Ɏg�p���镶����
    end
    
    pwm
    
    num = num + 1;
    
    if type == 1
        % Simulink ���f�� sample1_cw_acw1_plot.slx ���G�N�X�^�[�i�����s
        set_param('sample1_cw_acw1_plot', 'SimulationCommand', 'start')
        pause(10)
    else
        % Simulink ���f�� sample1_cw_acw2_plot.slx ���G�N�X�^�[�i�����s
        set_param('sample1_cw_acw2_plot', 'SimulationCommand', 'start')
        pause(10)
    end
    
    % ���S�����ߎ��ɂ��p���x���Z�o
    n = length(t);
    dy(1) = 0;
    for i = 2:n-1
        dy(i) = (y(i+1) - y(i-1))/(2*h);
    end
    dy(n) = (y(n-2) - 4*y(n-1) + 3*y(n))/(2*h);

    % ���p���x���Z�o
    dyinf = mean(dy(n-10:n));

    % �p�x���O���t�Ƀv���b�g
    figure(1)
    plot(t,y)
    hold on
    
    % �p���x���O���t�Ƀv���b�g
    figure(2)
    plot(t,dy)
    hold on

    % �f�[�^��ۑ�    
    filename = [rootname, num2str(abs(pwm)), extension]; % �t�@�C�����̍쐬
    save(filename,'t','y','dy','pwm','dyinf')
    
    % pwm �̒l�ƒ��p���x�̒l�� d1, d2 �Ɋi�[ 
    d1(num) = pwm;
    d2(num) = dyinf;
end

toc

figure(1); hold off
figure(2); hold off

% �f�[�^ d1, d2 ��ۑ�
save data1/data1_pwm_dy d1 d2
    

