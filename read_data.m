%Read data 
    %% Sacar las matrices
    %% Obtener 3 matrices (total, interior, importado)
    
%uiopen('C:\Users\theib\Documents\proyectos python\Fractalidad Miguel Economia\1980-94.xls',1)

%Give me 3 matrices 
IO_S = matrixsplit(S1);
%%
function IO_S = matrixsplit(IO)
    names = {'Total', 'Interior', 'Importado'};
    for i = 1:3
        a = zeros(width(IO),width(IO));
        for j = 0:width(IO)-1
           a(j + 1,:) = table2array(IO(i + 3*j,:));
        end
        IO_S{i} = struct(names{i},a)
    end
end

function load_data(IO)
    %Leer los datos y formatearlos
    %uiimport('C:\Users\theib\Documents\proyectos python\Fractalidad Miguel Economia\1980-94.xls',1)
    
end