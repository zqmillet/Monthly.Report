classdef BayesianNetwork < handle
    properties
        Nodes = {};
        Evidences = {};
        Graph;
        ConditionalProbabilities = Classes.Dictionary();
        IncidenceMatrix;
        InferenceEngine;
    end
    
    methods
        AddNodes(obj, varargin);
        Exist = ExistNode(obj, Node);
        AddEvidences(obj, varargin);
        RemoveEvidences(obj, varargin);
        Exist = ExistEvidences(obj, Node);
        Initialize(obj);
        ShowGraph(obj);
        Node = FindNodeByIndex(obj, Index);
        Inference(obj, varargin);
        Display(obj, varargin);
        String = Evidences2String(obj);
        Loss = GetLoss(obj);
        ChildSet = GetChildSet(obj, Node);
        SetSecurityStrategies(obj, varargin);
        PrintConditionalProbabilityTable(obj, varargin);
        PrintRelationship(obj);
    end
end
