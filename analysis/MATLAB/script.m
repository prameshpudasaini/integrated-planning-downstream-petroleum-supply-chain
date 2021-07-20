%calculate cost for all ODs
%when deleting one link at a time
%[a ,b]=kShortestPath(matrix,Origin, Destination, threshold);

for i=1:29
    for j=1:29
        if (i~=j)
            [a ,b]=kShortestPath(netCostMatrix,i,j,1);
            bb(i,j)=sum(b);
        end
    end
end