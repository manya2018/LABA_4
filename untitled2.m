%% Filters design
freqArray = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000,16000];
order = 1024; % должен быть четным
fS = 44100;   
bBank=CreateFilters(freqArray,order,fS);
nums=randperm(10,3);
bTmp=bBank(nums,:);
for i =1:3
    [H(i, :), w(i, :)] = freqz(bTmp(i,:), 1, order);
end
dzb=@(x)20*log10(x);
H=dzb(abs(H));
w=w*fS/(2*pi);



%% Graph with standard functions
plot(w,H(1,:),'-k','LineWidth',1);
xlim([0;21000]);
ylim([-60;10]);
hold on;
plot(w,H(2,:),':*b','LineWidth',1);
xlim([0;21000]);
ylim([-60;10]);
plot(w,H(3,:),'-.rs','LineWidth',1);
xlim([0;21000]);
ylim([-60;10]);
legend('фильтр №1','фильтр №2','фильтр №3')
xticks([2000,8000,16000]);
xticklabels({' 2 кГц',' 8 кГц',' 16 кГц'})
xlabel('f, kHz','FontSize',16);
ylabel('|H|, dB','FontSize',16);
title('Filters numbers: №1,№2,№3','FontSize',16);


%% Graph with changing object properties
f=figure('DefaultAxesFontSize',14);
ax=axes;
p.one=plot(w,H(1,:));
hold on;
p.two=plot(w,H(2,:));
p.three=plot(w,H(3,:));
PropNames={'xLim','yLim'};
PropValues={[0,21000],[-60,10]};

set(ax,PropNames,PropValues);