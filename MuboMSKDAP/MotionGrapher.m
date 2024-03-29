

function allBodiesRepresentation(finalFrame, pause)
% allBodiesRepresentation(finalFrame, pause)
%
% Syntax: (finalFrame is the number of frames to evaluate movement from, pause is the time between frames, so that the human eye can grasp the movement more easilly)
%
% Generates the body motion throughout time
global NBodies


for frame = 1:finalFrame
    

    
    figure(1);hold all % Hold all frames in one figure/Plot will wait until all the computations in the Hold block are finalized before showing the plot output ⇒ Async Programming
    for bodyNumber = 1:NBodies

        %%%%%% Insert Body Function Here %%%%%%


       joint1XVector, joint1ZVector, joint2XVector,joint2ZVector,~,~ =BodyFunction(bodyNumber);
       xVector = [joint1XVector(frame), joint2XVector(frame)]; zVector = [joint1ZVector(frame), joint2ZVector(frame)]; 

        %Define vectors for the plot of each body thoughout time
       plot(xVector, zVector,'-o','MarkerSize',5,'MarkerFaceColor','b');
       drawnow; %Will draw this imediatelly
       
    end
   pause(pause); %%Adjust this parameter for better visualization

   title('Movement of the Body') 
   xlabel('First Coordinates of Joints')
   ylabel('Second Coordinate of Joints')
   %%axis([x(n) x(n+Dx) y1 y2])
   cla; %% Clear previous plot(previous frame)
end

