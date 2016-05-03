% Create the decision-maker
% DecisionMaker = Classes.DecisionMaker(0.01);
DecisionMaker = Classes.DecisionMaker(1);
DecisionMaker.RiskModel = RiskModel;
DecisionMaker.AddStrategies(m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, ...
                            m11, m12, m13, m14, m15, m16, m00, ...
                            n01, n02, n03, n04, n05, n06, n07, n08, n09, n10, ...
                            n11, n12, n00);
                        
DecisionMaker.Initialize();