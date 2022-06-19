clear
format compact

mkdir data2             % �t�H���_ data2 �𐶐�

h = 0.01;               % �T���v�����O����

extension = '.mat';     % �g���q

num = 0;

tic

for pwm = -255:5:255    
    if pwm >= 0
        rootname  = 'data2/data2_cw';     % �t�@�C�����Ɏg�p���镶����
    elseif pwm < 0
        rootname  = 'data2/data2_acw';    % �t�@�C�����Ɏg�p���镶����
    end
    
    pwm
    
    num = num + 1;
    
    % Simulink ���f�� sample2_cw_acw_plot.slx ���G�N�X�^�[�i�����s
    set_param('sample2_cw_acw_plot', 'SimulationCommand', 'start')
    pause(10)
    
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
save data2/data2_pwm_dy d1 d2
    

