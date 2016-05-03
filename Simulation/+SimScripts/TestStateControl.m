%% State control simulation.
DecisionMaker.RemoveEvidences();
EvidenceString = '';
for i = 1:numel(EvidenceList.Keys)
    DecisionMaker.AddEvidences(EvidenceList.Keys{i});
    EvidenceString = Functions.ConcatenateString(EvidenceString, ' ',EvidenceList.Keys{i}.Label);
    disp(EvidenceString);
    disp(DecisionMaker.GetOptimalSystemState);
end