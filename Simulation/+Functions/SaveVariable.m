function SaveVariable(Directory, Variable)
    if (Directory(end) ~= '/')
        Directory = [Directory, '/'];
    end
    
    if isa(Variable, Enumerations.ClassType.Double)
        Variable = num2str(Variable);
    end
    
    FilePath = [Directory, inputname(2)];
    File = fopen(FilePath, 'w+');
    fprintf(File, '%s', Variable);
    fclose(File);
end

