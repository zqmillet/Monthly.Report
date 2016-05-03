%% Draw dynamic risk curve.
DynamicRiskCurve = zeros(MaxTime, 2);
DynamicRiskCurve(1, :) = [1, DecisionMaker.RiskModel.GetRisk];
for i = 2:MaxTime
    ExistEvidence = false;
    for j = 1:numel(EvidenceList.Keys)
        if EvidenceList.Values{j} == i
            DecisionMaker.AddEvidences(EvidenceList.Keys{j});
            ExistEvidence = true;
        end
    end
    
    if ExistEvidence
        DynamicRiskCurve(i, :) = [i, DecisionMaker.RiskModel.GetRisk];
    else
        DynamicRiskCurve(i, :) = [i, DynamicRiskCurve(i - 1, 2)]; 
    end
end

plot(DynamicRiskCurve);
title('Dynamic Risk Curve');
xlabel('Time (min)');
ylabel('Dynamic Risk ($)');
save './OutputData/DynamicRiskCurve.dat' DynamicRiskCurve -ascii