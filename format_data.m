%Read raw IO spreadsheets and create database for our computations.

data = ["TIO85","TIO86","TIO87","TIO88","TIO89","TIO90","TIO91","TIO92","TIO93","tio94"];
yrs = 85:94;
for i = 1:length(data)
    
   S3 = load_data(data(i));
   IO_S = matrixsplit(S3);
   
   save(sprintf('IO_matrices/IO%d_.mat',yrs(i)'),"IO_S");
end

%%
function IO_S = matrixsplit(IO) 
%Creates 3 categories for our IO matrices
%Returns a struct field with 3 matrices inside

    names = {'Total', 'Interior', 'Imported'};
    c = cell(length(names),1);
    IO_S = cell2struct(c,names);
    for i = 1:3
        a = zeros(width(IO),width(IO));
        for j = 0:width(IO)-1
           a(j + 1,:) = table2array(IO(i + 3*j,:));
        end
        IO_S.(names{i}) = a;
    end
end

function S3 = load_data(data)
    %% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\theib\Documents\proyectos python\Fractalidad Miguel Economia\1980-94.xls
%

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 68);

% Specify sheet and range


opts.Sheet = data;
opts.DataRange = "D5:BS205";

% Specify column names and types
opts.VariableNames = ["DEMANDAINTERMEDIA", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "DEMANDAINTERMEDIA1", "VarName20", "VarName21", "VarName22", "VarName23", "VarName24", "VarName25", "VarName26", "VarName27", "VarName28", "VarName29", "VarName30", "VarName31", "VarName32", "VarName33", "VarName34", "VarName35", "DEMANDAINTERMEDIA2", "VarName37", "VarName38", "VarName39", "VarName40", "VarName41", "VarName42", "VarName43", "VarName44", "VarName45", "VarName46", "VarName47", "VarName48", "VarName49", "VarName50", "DEMANDAINTERMEDIA3", "VarName52", "VarName53", "VarName54", "VarName55", "VarName56", "VarName57", "VarName58", "VarName59", "VarName60", "VarName61", "VarName62", "DEMANDAFINAL", "VarName64", "VarName65", "VarName66", "VarName67", "VarName68", "VarName69", "VarName70", "VarName71"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Import the data
S3 = readtable("C:\Users\theib\Documents\proyectos python\Fractalidad Miguel Economia\1980-94.xls", opts, "UseExcel", false);

%Data cleaning
S3(1:2,:) = [];
S3(175:end,:) = [];
S3 = removevars(S3, {'VarName62','DEMANDAFINAL','VarName64','VarName65','VarName66','VarName67','VarName68','VarName69','VarName70','VarName71'});  
%% Clear temporary variables
clear opts    

end