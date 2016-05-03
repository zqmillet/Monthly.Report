classdef DecisionMaker < handle
    properties
        RiskModel;
        SecurityStrategies;
        RecoverStrategies;
        AcceptableRiskRatio;
        % AcceptableRisk = AcceptableRiskRatio * MaxSystemLoss.
        AcceptableRisk;
    end
    
    methods
        function obj = DecisionMaker(AcceptableRiskRatio)
            if (nargin ~= 1)
                error(Enumerations.ErrorType.InputParameterNumberError);
            end
            
            if (~isa(AcceptableRiskRatio, Enumerations.ClassType.Double))
                error(Enumerations.ErrorType.InputParameterTypeError)
            end
            
            obj.RiskModel = Classes.RiskModel();
            obj.SecurityStrategies = {};
            obj.RecoverStrategies = {};
            obj.AcceptableRiskRatio = AcceptableRiskRatio;
        end
        AddRiskModel(obj, RiskModel);
        AddStrategies(obj, varargin);
        AddEvidences(obj, varargin);
        RemoveEvidences(obj, varargin);
        Initialize(obj);
        ShowBayesianNetwork(obj);
        [AttackStrategies, AttackDistribution, DefenseStrategies, DefenseDistribution, ADPayoffMatrix] = GetOptimalStrategy(obj);
        OptimalSystemState = GetOptimalSystemState(obj);
        PotentialAttackStrategies = GetPotentialAttackStrategies(obj);        
        PotentialSecurityStrategies = GetPotentialSecurityStrategies(obj, OptimalSystemState, PotentialAttackStrategies)
        PotentialRecoverStrategies = GetPotentialRecoverStrategies(obj, OptimalSystemState);
        [ANumber, DNumber] = GetStrategyProfileNumber(obj);
    end
end

