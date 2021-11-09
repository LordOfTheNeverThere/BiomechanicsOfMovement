function lambda = optimization_dyn(q, qd, qdd, t)
%
%Summary: This function performs an inverse dynamic analysis using an
%         optimization procedure.
%
%Input:   q      - Matrix of positions of the system
%         qd     - Matrix of velocities of the system
%         qdd    - Matrix of accelerations of the system
%         t      - Vector of time frames
%
%Output:  lambda - Vector with Lagrange multipliers of the system
% 
% Jorge Ambrosio
% Version 1.0     May, 2020
%
%% ... Access memory
global Ntime NConstraints parameters
global M Jnt
global parameters

%% ... Updates muscle kinematics
% Computes muscle kinematics
MuscleKinematics(q, t);
%
%% ... Allocates memory for the output
lambda = zeros(NConstraints, Ntime);
for i = 1 : Jnt.NMuscles
    Jnt.Muscle(i).lM          = zeros(Ntime,1);
    Jnt.Muscle(i).lMd         = zeros(Ntime,1);
    Jnt.Muscle(i).Activations = zeros(Ntime,1);
    Jnt.Muscle(i).ForcesPE      = zeros(Ntime, 1);
    Jnt.Muscle(i).ForcesCE      = zeros(Ntime, 1);
end
%
%% Goes through all steps
%... Create waitbar
w       = waitbar(0,'Dynamic Analysis Progress');
%
for i = 1 : Ntime

    % ... Evaluate vectors and matrices
    [ ~,Jac,~,~] = KinemEval(t(i), q(:,i), qd(:,i));
    
    %% ... Create the force vectors of bodies and nodes
    [g]   = Force(t(i));

    %% ... Define boundary conditions for optimization problem
    [lb, ub, optmusc] = OptimizationBoundaries(t(i));
    %
    %% ... Initial solution
    if (i == 1)
        x0 = rand(NConstraints, 1);
    else
        x0 = lambda(:, i - 1);
    end
    %
    %% ... Defines the optimization options
    options = optimoptions('fmincon', 'Display', 'off',...
        'MaxFunctionEvaluations', 20000, 'SpecifyObjectiveGradient', true,...
        'CheckGradients', false, 'FiniteDifferenceType', 'central');
    
    %% ... Solves the optimization problem using fmincon. The objective 
    %      function is the square sum of muscle forces plus an additional 
    %      term to penalize joint actuators. The constraints are the 
    %      equations of motion.    
    [lambda(:,i), ~, exitflag] = fmincon(@(x0) PhysiolCriter(x0), x0, [], [],...
        (diag(optmusc.scalJac) * Jac)', (g - M * qdd(:,i) - (Jac(parameters.muscspan,:)' * optmusc.fpe)),...
        lb, ub, [], options);
    if (exitflag < 0)
        warning(['The optimization problem did not converge for the time step ', num2str(i), '.\nPlease check if the biomechanical model is properly defined.']);
        pause
    end
    
    % Updates muscle force data for the report
    for m = 1 : Jnt.NMuscles
        Jnt.Muscle(m).Activations(i) = lambda(parameters.muscspan(m), i);
        Jnt.Muscle(m).ForcesCE(i) = ((Jnt.Muscle(m).Param(1) * Jnt.Muscle(m).Param(2) / Jnt.Muscle(m).F0) *...
            lambda(parameters.muscspan(m), i));
        Jnt.Muscle(m).ForcesPE(i) = optmusc.fpe(m);
        Jnt.Muscle(m).lM(i) = Jnt.Muscle(m).Param(3);
        Jnt.Muscle(m).lMd(i) = Jnt.Muscle(m).Param(4);        
    end
    
    % ... Update the Waitbar
    w = waitbar(i/Ntime,w,['time: ',num2str(t(i),'%10.5f')]);
    
    % End of the loop that goes through all steps
end
%... Close the waitbar
close(w);

%% ... Definition of the nested objective function
    function [f, df] = PhysiolCriter(x)
        
        % Initilizes the objective function
        f = 0;
        df = zeros(NConstraints, 1);
        
        % Goes through all muscles
        for k = 1 : Jnt.NMuscles
            
            f = f + 1e-3 * ((Jnt.Muscle(k).Param(1) * Jnt.Muscle(k).Param(2) / Jnt.Muscle(k).F0) *...
                x(parameters.muscspan(k)))^2;
            % Updates the gradient of the objective function
            df(parameters.muscspan(k)) = df(parameters.muscspan(k)) +...
                2e-3 * ((Jnt.Muscle(k).Param(1) * Jnt.Muscle(k).Param(2) / Jnt.Muscle(k).F0))^2 *...
                x(parameters.muscspan(k));
            
            % End of the loop that goes through all muscles
        end
        
        % Penalizes the driver actuators
        f = f + 1e3 * (x(parameters.drivspan)' * x(parameters.drivspan));
        df(parameters.drivspan) = df(parameters.drivspan) +...
            2 * 1e3 * x(parameters.drivspan);

        % End of the nested function
    end    

% End of the dynamic analysis
end