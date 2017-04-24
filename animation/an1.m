freq1 = 50; % Frequency in Hertz
freq2 = 100;
T1 = 1/freq1; % periods
T2 = 1/freq2;
Nt = 5;      % Numberof samples in time per period
dt = min(T1,T2)/Nt; % time step

t=0:dt:(10*max(T1,T2));

Nrepetition=1;
NFFT=Nrepetition*length(t);

Fs = NFFT;     % Sampling frequency
T  = 1/(Fs);      % Sample time

func=zeros(1,length(t));
func2=zeros(1,length(t));


for Iteration=1:5
    for it=1:length(t)         
        switch Iteration
           case 1
                func(it)=sin(2*pi*freq1*t(it));
           case 2
                func2(it)= 1.5*sin(2*pi*freq2*t(it)); 
           case 3
                func2(it) = 1.5*sin(2*pi*2*freq2*t(it));
           case 4 
                func(it) = sin(2*pi*1.5*freq1*t(it));
           case 5  
                func2(it) = sin(2*pi*1.5*freq2*t(it));
        end;

        lineWidth=2; Fs=10;
        f6=figure(6); 
        clf; 
        set(gcf,'Color',[1 1 1]);
        sp1=subplot(10,1,1:3); 
        set(gca, 'FontSize', Fs);
        plot(t,func,'b','LineWidth',lineWidth,'LineSmoothing','on'); grid on; hold on;     

        plot(t,func2,'r','LineWidth',lineWidth,'LineSmoothing','on'); grid on;
        ylim([-2 2])
        set(gca,'xticklabel',[]);
        set(gca,'OuterPosition',[ -0.04    0.75    1.13    0.25])
        set(sp1,'Color',[0.9608    0.9765    0.9922]);

        funcSum=func+func2;
        sp3=subplot(10,1,4:6); 
        set(gca,'FontSize',Fs);
        plot(t,funcSum,'k','LineWidth',lineWidth,'LineSmoothing','on'); grid on;
        xlabel('time (sec)');
        ylim([-2.5 2.5])
        set(gca,'OuterPosition',[ -0.04    0.45    1.13    0.3])   
        set(sp3,'Color',[0.8941    0.9412    0.9020]);

        funcSum_rep=[];
        func_rep=[];
        for ik=1:Nrepetition
            funcSum_rep=[funcSum_rep funcSum];
            func_rep=[func_rep func];
        end
        FD_funcSum = fft(funcSum_rep,NFFT)/NFFT;
        FD_func = fft(func_rep,NFFT)/NFFT;
        f=(0:(NFFT-1))/(NFFT*dt);
        
        sp4=subplot(10,1,7:10); set(gca,'FontSize',Fs);
        plot(f(1:(floor(NFFT/2)+1)),2*abs(FD_func(1:(floor(NFFT/2)+1))),'LineWidth',lineWidth-1,'LineSmoothing','on'); hold on; grid on;
        plot(f(1:(floor(NFFT/2)+1)),2*abs(FD_funcSum(1:(floor(NFFT/2)+1))),'LineWidth',lineWidth-1,'LineSmoothing','on');

        xlabel('Frequency (Hz)')
        xlim([-1 256])
        set(gca,'OuterPosition',[ -0.04    0.01    1.13    0.42])
      %  Ylim4=get(sp4,'Ylim');
        ylim([0 1.5])
        pause(0.01)
    end
end