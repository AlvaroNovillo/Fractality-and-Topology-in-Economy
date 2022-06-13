%Clustering and shortest path length
clear all;
yrs = 85:94;
names = {'Total', 'Interior', 'Imported'};

for i = 1:length(yrs)
    for j = 1:3
        load(sprintf('IO_matrices/IO%d_.mat',yrs(i)));
        IO = normalize(IO_S.(names{j}));
        IO(isnan(IO)) = 0;
        
        %%Graph representation 
        
        %Extraction of the giant connected component
        G=graph(IO,'upper','omitselfloops');
        
        %Subgraph of the main component
        [bin,binsize] = conncomp(G);
        idx = binsize(bin) == max(binsize);
        GC = subgraph(G, idx);
    end
end