function E_USA_f_na_bg(input_name)
 
% configure cogent
config_display(0,6, [1 1 1]);               % configure monitor "3",  resolution "1024x768"
config_keyboard;                            % initialize key-presses (keyboard)
config_sound
start_cogent;                               % START cogent
setforecolour(0,0,0)                        % Colour of the foreground (the cross fixation) 
wait(2000)

% Variables
cond=1:200;                      % All the stimuli
time=repmat([1500 2000],1,100);   % Duration of ISI
score=0;
trial=0;
endexp=0;
stopTrials=[51 101 151];
ident=0;
endident=0;
condident=1:16;
pres=[1 81 101 121 141 161 181];
correct_t=0;
incorrect=0;
miss=0;
correct_nt=0;

% randomise and create new variable: "SeqStim"
rng('shuffle');                           % reset random number geenerator
rrRes=randperm(length(cond));             % randomised sequence
SeqStim=cond(rrRes);                      % new variable with images, now in rand seq
rrResT=randperm(length(time));            % randomised sequence
SeqTime=time(rrResT);                     % new variable with times, now in rand seq

rrRescondident=randperm(length(condident));
Seqcondident=condident(rrRescondident);

% this is the main output variable
clear ResOut

% buffer 2 used for the habitations
clearpict(2);                                 % clear buffer 2
loadpict('buche.jpeg' , 2, 500 , 350);        % prepare buche
loadpict('nenuphar.jpeg',2,-500,350);          % prepare nenuphar  


loadpict('buche.jpeg' , 3, 500 , 350);        % prepare buche
loadpict('nenuphar.jpeg',3,-500,350);          % prepare nenuphar  
preparestring( '+' , 3);                      % prepare cross fixation
drawpict(3)
waitkeydown(inf,56)
wait(5000);


% Presentation stimuli
for verif=1:7
        clearpict(1);                                             % clear buffer "1
        loadpict(['img (' num2str(pres(verif)) ').jpeg'] , 1); % prepare stimulus in buffer "1"
        loadpict('buche.jpeg' , 1, 500 , 350);                    % prepare buche
        loadpict('nenuphar.jpeg',1,-500 , 350);                   % prepare nenuphar
            if pres(verif) == 1
                loadsound('frog1.1.wav',1);
            elseif pres(verif) == 81
                loadsound('elephant.wav',1);
            elseif pres(verif) == 101
                loadsound('chien.wav',1);
            elseif pres(verif) == 121
                loadsound('cochon.wav',1);
            elseif pres(verif) == 141
                loadsound('chat.wav',1);
            elseif pres(verif) == 161
                loadsound('hibou.wav',1);
            elseif pres(verif) == 181
                loadsound('chevre.wav',1);
            end
        playsound(1)
        drawpict(1)
        wait(300)
        drawpict(2)
        wait(2000)
end

clearpict(3);                                  %clear buffer 3
preparestring( 'Fin initiation' , 3);          % prepare cross fixation
drawpict(3);
waitkeydown(inf,56);

% main loop
while endexp == 0
        trial=trial+1;
        
       if ismember(trial,stopTrials)
            clearkeys;
            clearpict(3);                                  %clear buffer 3
            loadpict('buche.jpeg' , 3, 500 , 350);        % prepare buche
            loadpict('nenuphar.jpeg',3,-500,350);          % prepare nenuphar    
            preparestring( 'PAUSE' , 3);                      % prepare cross fixation
            drawpict(3);
            waitkeydown(inf,56);
       end
        if getkeydown(56)
            clearpict(3);                                  %clear buffer 3
            loadpict('buche.jpeg' , 3, 500 , 350);        % prepare buche
            loadpict('nenuphar.jpeg',3,-500,350);          % prepare nenuphar    
            preparestring( '+' , 3);                      % prepare cross fixation
            drawpict(3);
            wait(5000)
        end
        % prepare current trial.
        clearpict(1);                                             % clear buffer "1
        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1); % prepare stimulus in buffer "1"
        loadpict('buche.jpeg' , 1, 500 , 350);                    % prepare buche
        loadpict('nenuphar.jpeg',1,-500 , 350);                   % prepare nenuphar
            if ismember(SeqStim(trial),1:8)
                loadsound('frog1.1.wav',1);
            elseif ismember(SeqStim(trial),9:16)
                loadsound('frog1.2.wav',1);
            elseif ismember(SeqStim(trial),17:24)
                loadsound('frog1.3.wav',1);
            elseif ismember(SeqStim(trial),25:32)
                loadsound('frog1.4.wav',1);
            elseif ismember(SeqStim(trial),33:40)
                loadsound('frog1.5.wav',1);
            elseif ismember(SeqStim(trial),41:48)
                loadsound('frog2.1.wav',1);
            elseif ismember(SeqStim(trial),49:56)
                loadsound('frog2.2.wav',1);
            elseif ismember(SeqStim(trial),57:64)
                loadsound('frog2.3.wav',1);
            elseif ismember(SeqStim(trial),65:72)
                loadsound('frog2.4.wav',1);
            elseif ismember(SeqStim(trial),73:80)
                loadsound('frog2.5.wav',1);
            elseif 81 <= SeqStim(trial) && SeqStim(trial) <= 100
                loadsound('elephant.wav',1);
            elseif 101 <= SeqStim(trial) && SeqStim(trial) <= 120
                loadsound('chien.wav',1);
            elseif 121 <= SeqStim(trial) && SeqStim(trial) <= 140
                loadsound('cochon.wav',1);
            elseif 141 <= SeqStim(trial) && SeqStim(trial) <= 160
                loadsound('chat.wav',1);
            elseif 161 <= SeqStim(trial) && SeqStim(trial) <= 180
                loadsound('hibou.wav',1);
            elseif 181 <= SeqStim(trial) && SeqStim(trial) <= 200
                loadsound('chevre.wav',1);
            end
        clearkeys;                                                % clear response buffer
    
        % stimulus
        drawpict(1);                            % draw stimulus (buffer "1")  to screen
        playsound(1);
        wait(300);                              % stimulus stays on screen for 300 ms
        drawpict(2);                            % draw fixation (buffer "2") to screen

        % response
        wait(SeqTime(trial));                             % wait 1500 before checking responses
        readkeys;                                      % read data from the response buffer
                                                   
            if getkeydown(71)  % Space bar
                    if 1 <= SeqStim(trial) && SeqStim(trial) <= 40  % if it is a frog of the family 1
                        score = score+1;
                        correct_t = correct_t +1;
                        clearpict(1);                                % Clear buffer 1
                        loadpict('filet.jpeg',1,-125,75);            % net apparition
                        loadpict('buche.jpeg',1,500 , 350);          % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, 0, 0);
                        drawpict(1);
                        wait(1000);
                        drawpict(2);

                        clearpict(1); 
                        loadpict('buche.jpeg',1,500 , 350);          % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, -70, 55);
                        drawpict(1);
                        playsound(1);
                        wait(500);
                        drawpict(2);

                        clearpict(1);
                        loadpict('buche.jpeg',1,500 , 350);      % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, -140, 110);
                        drawpict(1);
                        wait(500);
                        drawpict(2);

                        clearpict(1); 
                        loadpict('buche.jpeg',1,500 , 350);      % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, -210, 165);
                        drawpict(1);
                        playsound(1);
                        wait(500);
                        drawpict(2);

                        clearpict(1);
                        loadpict('buche.jpeg',1,500 , 350);      % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, -280, 220);
                        drawpict(1);
                        wait(500);
                        drawpict(2);

                        clearpict(1); 
                        loadpict('buche.jpeg',1,500 , 350);      % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, -350, 275);
                        drawpict(1);
                        playsound(1);
                        wait(1000);
                        drawpict(2);

                    elseif 41 <= SeqStim(trial) && SeqStim(trial) <= 80
                        score = score+1;
                        correct_t = correct_t +1;
                        clearpict(1);
                        loadpict('filet.jpeg',1,-125,75);
                        loadpict('buche.jpeg',1,500 , 350);          % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, 0, 0);
                        drawpict(1); 
                        wait(1000);
                        drawpict(2);    

                        clearpict(1); 
                        loadpict('buche.jpeg',1,500 , 350);      % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, 70, 55);
                        drawpict(1);
                        playsound(1);
                        wait(500);
                        drawpict(2);

                        clearpict(1); 
                        loadpict('buche.jpeg',1,500 , 350);      % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, 140, 110);
                        drawpict(1);
                        wait(500);
                        drawpict(2);

                        clearpict(1); 
                        loadpict('buche.jpeg',1,500 , 350);      % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, 210, 165);
                        drawpict(1);
                        playsound(1);
                        wait(500);
                        drawpict(2);

                        clearpict(1); 
                        loadpict('buche.jpeg',1,500 , 350);      % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, 280, 220);
                        drawpict(1);
                        wait(500);
                        drawpict(2);

                        clearpict(1); 
                        loadpict('buche.jpeg',1,500 , 350);      % buche habitation
                        loadpict('nenuphar.jpeg',1,-500 , 350);      % nenuphar habitation
                        loadpict(['img (' num2str(SeqStim(trial)) ').jpeg'] , 1, 350, 275);
                        drawpict(1);
                        playsound(1);
                        wait(1000);
                        drawpict(2);
                    else
                        incorrect = incorrect +1;
                    end
            else
                if 1 <= SeqStim(trial) && SeqStim(trial) <= 80
                    miss = miss +1;
                else
                    correct_nt = correct_nt +1;
                end         
            end

        % exit rules
        if score == 1
            endexp = 1;
        end
        if trial==200
            endexp = 1;

        end

end % of main loop

clearpict(3);                                  %clear buffer 3
preparestring( 'Vous avez fini!' , 3);                      % prepare cross fixation
drawpict(3);
waitkeydown(inf,56);

% Categorization identification test
clearpict(3);                                  %clear buffer 3
loadpict('buche.jpeg' , 3, 500 , 350);        % prepare buche
loadpict('nenuphar.jpeg',3,-500,350);          % prepare nenuphar    
preparestring( '+' , 3);                      % prepare cross fixation
drawpict(3);
wait(5000)

while endident==0
        ident=ident+1;
        clearpict(1);                                             % clear buffer "1
        loadpict(['ident (' num2str(Seqcondident(ident)) ').jpeg'] , 1); % prepare stimulus in buffer "1"
        loadpict('buche.jpeg' , 1, 500 , 350);                    % prepare buche
        loadpict('nenuphar.jpeg',1,-500 , 350);                   % prepare nenuphar
        if ismember(Seqcondident(ident),[4 5])
                loadsound('frog1.1.wav',1);
        elseif ismember(Seqcondident(ident),[6 7])
                loadsound('frog1.2.wav',1);
        elseif ismember(Seqcondident(ident),1)
                loadsound('frog1.3.wav',1);
        elseif ismember(Seqcondident(ident),[2 3])
                loadsound('frog1.4.wav',1);
        elseif ismember(Seqcondident(ident),8)
                loadsound('frog1.5.wav',1);
        elseif ismember(Seqcondident(ident),[12 13])
                loadsound('frog2.1.wav',1);
        elseif ismember(Seqcondident(ident),[14 15])
                loadsound('frog2.2.wav',1);
        elseif ismember(Seqcondident(ident),9)
                loadsound('frog2.3.wav',1);
        elseif ismember(Seqcondident(ident),[10 11])
                loadsound('frog2.4.wav',1);
        elseif ismember(Seqcondident(ident),16)
                loadsound('frog2.5.wav',1);
        end
        if Seqcondident(ident)<= 8
           ResOut(ident).numero_habitat=14; 
        elseif Seqcondident(ident)>= 9
            ResOut(ident).numero_habitat=2;
        end
        drawpict(1);
        playsound(1);
        readkeys;                                      % read data from the response buffer
        [ResOut(ident).numero_reponse] = waitkeydown(inf,[2 14]);
        drawpict(2);
        wait(2000)
        if ident==16
           endident=1;
        end
end
stop_cogent;                                % STOP cogent

disp('correct_target')
disp(correct_t)
disp('miss')
disp(miss)
disp('correct_non_target')
disp(correct_nt)
disp('incorrect')
disp(incorrect)

eval(['save ' input_name ' ResOut']);

clear all