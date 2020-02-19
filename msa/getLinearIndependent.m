
function [Abasis, Abasisi, Asub]= getLinearIndependent(A,ignore_constant_shift)
if nargin < 2
    ignore_constant_shift = false;
end
sz = size(A);

if ignore_constant_shift
    A = [ones(sz(1),1), A];
end
[R,jb] = rref(A);
Nnz = length(jb);        
if ignore_constant_shift
    R = R(:,2:end);     
    R(1:Nnz,:) = R(circshift(1:Nnz,-1),:);       
    jb = jb(2:end);    
    jb = jb - 1;     
    A = A(:,2:end);    
end
Asub = cell(1,Nnz);
available_ind = true(1,sz(2));
for i = 1:Nnz
    curr_cluster = R(i,:);
    Asub{i} = find(abs(curr_cluster) > 0 & available_ind);
    available_ind(Asub{i}) = false;                         % Remove from set of availble columns
end

if ignore_constant_shift
    if isempty(Asub{Nnz})
        Asub = Asub(1:end-1);
    end
end
Abasisi = zeros(1,length(Asub));
for i = 1:length(Asub)
    Abasisi(i) = Asub{i}(1);
end
Abasis = A(:,Abasisi);
end


