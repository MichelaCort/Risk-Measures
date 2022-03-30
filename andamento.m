function [portafoglio] = andamento(CI,prezzi,ntit)
%simula l'andamaento del portafoglio equilly weight, con strategia
%Costant Mix. Ogni volta che il prezzo aumenta, vendo 
%le azioni per ristabilere l'equilibrio equally Weight e viceversa

prezzi = table2array(prezzi(:,2:end));
CIvett=zeros(size(prezzi,1),ntit);
titP=zeros(size(prezzi,1),ntit);
portafoglio=nan(size(prezzi,1),1);
NumAzioni=zeros(size(prezzi,1),ntit);

CIvett(1,:)= CI/5;
NumAzioni(1,:)=fix(CIvett(1,:)./prezzi(1,:));
titP(1,:)= NumAzioni(1,:) .* prezzi(1,:);
portafoglio(1)=sum(titP(1,:));

for i=2:size(prezzi,1)
    titP(i,:)= NumAzioni(i-1,:) .* prezzi(i,:);
    CIvett(i,:)=sum((CIvett(i-1,:)-titP(i-1,:))+titP(i,:))/5;
    for c=1:size(prezzi,2)
        NumAzioni(i,c)=fix(CIvett(i,c)./prezzi(i,c));
    end
    titP(i,:)= NumAzioni(i,:).*prezzi(i,:);
    portafoglio(i)=sum(titP(i,:));
end 
end