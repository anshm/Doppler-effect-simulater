clear all
clc;
close all;


c=input('Velocity of sound, in medium (e.g. AIR)in m/s:');
while(c<=0)
    disp('Velocity of Sound Can Not be Negative or Zero');
    c=input('Velocity of sound, in medium (e.g. AIR)in m/s:');
end;

Vs=input('Velocity of source,in medium(e.g. AIR)(POSITIVE if moving away from the observer)in m/s:');
while(abs(Vs)>=c)
    disp('Velocity of Source must be less than velocity of Sound (SUBSONIC)');
    Vs=input('Velocity of source,in medium(e.g. AIR)(POSITIVE if moving away from the observer)in m/s:');
end;

Vo=input('Velocity of observer,in medium(e.g. AIR)(POSITIVE if moving towards the source)in m/s :');
while(abs(Vo)>=c)
    disp('Velocity of Observer must be less than velocity of Sound (SUBSONIC)');
    Vo=input('Velocity of observer,in medium(e.g. AIR)(POSITIVE if moving towards the source)in m/s :');
end;


Va = Vo - Vs;
fo = 16000;
fs1 = fo;
fs2 = fo;

%-----------------------------
step = .01;
t = 0:step:20000;
y= 25 * cos (62800*t);
%----------------------------- 

if (Va > 0.0) 
     disp ('------The Source and Observer are approaching each other and will Cross Over----');
     
     disp ('Real frequecy of beeper is : ' );
     disp (fo);

disp ('---------Press any key to play the Real Frequency --------');
pause
%----------------------------
sf = fo / step;
sound (y, sf)
%----------------------------- 
 
     fs1 = ((c+Vo)/(c+Vs))*fo;
     
     disp ('Observed frequecy of beeper, before source & observer cross over is : '  );
     disp (fs1);
     disp ('Dopler shift in Observed frequecy of beeper, before source & observer cross over is : '  );
     shift1 = fs1 - fo;
     disp (shift1);
     disp ('PERCENT shift in Observed Frequecy of beeper, BEFORE source & observer Cross Over is : '  );
     Prcnt_shift1 = ((fs1 - fo)/fo)*100;
     disp (Prcnt_shift1);

disp ('---------Press any key to play the Observed Frequency BEFORE Crossover--------');
pause
%-----------------------------
sf1 = fs1 / step;
sound (y, sf1)
%----------------------------- 
     
     Vo = -Vo;
     Vs = - Vs;
     fs2 = ((c+Vo)/(c+Vs))*fo;
  %   disp ('Real frequecy of beeper is : ' );
  %   disp (fo);
     disp ('Observed Frequecy of beeper, AFTER source & observer Cross Over is : '  );
     disp (fs2);
     disp ('Dopler shift in Observed Frequecy of beeper, AFTER source & observer Cross Over is : '  );
     shift2 = fs2 - fo;
     disp (shift2);
     disp ('PERCENT shift in Observed Frequecy of beeper, AFTER source & observer Cross Over is : '  );
     Prcnt_shift2 = ((fs2 - fo)/fo)*100;
     disp (Prcnt_shift2);

disp ('---------Press any key to play the Observed Frequency AFTER Cross over--------');
pause
%----------------------------
sf2 = fs2 / step;
sound (y, sf2)
%----------------------------- 

disp ('---------Press any key to play all three frequencies in succession--------');
pause
sound (y, sf)
sound (y, sf1)
sound (y, sf2)
%----------------------------- 
     
elseif (Va <= 0.0)
     
disp ('The Source and Observer will NOT Cross Over');

disp ('Real frequecy of beeper is : ' );
     disp (fo);

disp ('---------Press any key to play the Real Frequency --------');
pause
%----------------------------
sf = fo / step;
sound (y, sf)
%----------------------------- 

 fs1 = ((c+Vo)/(c+Vs))*fo;

     disp ('Real Frequecy of beeper is : ' );
     disp (fo);
     disp ('Observed Frequecy of beeper: '  );
     disp (fs1);
     disp ('Dopler shift in Observed frequecy of beeper : '  );
     shift1 = fs1 - fo;
     disp (shift1);
     disp ('PERCENT shift in Observed frequecy of beeper : '  );
     Prcnt_shift1 = ((fs1 - fo)/fo)*100;
     disp (Prcnt_shift1);
     
disp ('---------Press any key to play the Observed Frequency --------');
pause     

sf1 = fs1 / step;
sound (y, sf1)
%----------------------------- 

disp ('---------Press any key to play both the Real & Observed Frequencies in succession --------');
pause 

%-----------------------------
sound (y, sf)
sound (y, sf1)
%----------------------------- 
end;
   