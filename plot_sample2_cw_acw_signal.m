clear
format compact

sim('sample2_cw_acw_signal')

figure(1)
subplot('Position',[0.18 0.15 0.775 0.775])

plot(pwm,pwm1,'LineWidth',1.5,'Color','#e32d91')
hold on
plot(pwm,pwm2,'LineWidth',1.5,'Color','#00b0f0')
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('pwm','FontName','Arial','FontSize',16)
ylabel('PWM1 and PWM2','FontName','Arial','FontSize',16)
xtickangle(0)

xlim([-255 255])
ylim([-15 255+15])
set(gca,'XTick',-255:51:255)
set(gca,'YTick',0:51:255)

legend({'PWM1', 'PWM2'},'Location','south')
set(legend,'FontName','Arial','FontSize',16)

grid on