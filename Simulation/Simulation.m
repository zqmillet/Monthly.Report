% Clear screen and all variables.
clc;
clearvars;

% Model
SimScripts.CreateNodes;
SimScripts.SetConditionProbabilityTables;
SimScripts.CreateProcessesAndProducts;
SimScripts.CreateRiskModel;
SimScripts.SetSystemState;
SimScripts.CreateSecurityStrategies;
SimScripts.CreateRecoverStrategies;
SimScripts.CreateDecisionMaker;

% Initialize Simulation
SimScripts.CreateEvidenceList;
% Simulation 1
% SimScripts.DrawRiskCurve;
% Simulation 2
% SimScripts.TestStateControl;
% Simulation 3
SimScripts.TestDecisionMaking;
% Simulation 4
% SimScripts.TestRealTime;
% Simulation 5
% SimScripts.TestScalability;
% Data Process
% SimScripts.DataProcess;



