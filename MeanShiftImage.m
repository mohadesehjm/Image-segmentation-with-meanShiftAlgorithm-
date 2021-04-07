clear
load woman
figure(15);imshow(uint8(X))

x=X(:);
[c,u]=fcm(x,20);

Sigma=20;
n=length(x);
Ceof=1/(sqrt(2*pi)*n*Sigma);
Iter=2;
for i=1:length(c)
    z=c(i);
    for j=1:Iter
        yt=(z-x).^2/(2*Sigma^2);
        z=sum(x.*exp(-yt))/sum(exp(-yt));
    end
    R(i)=z;
end
figure(1);plot(R)

Threshold=20.0;
FF(1)=R(1)
FF=[FF R(find(abs(diff(sort(R)))>Threshold))]
FF=R;
[~,Ind]=min((abs(x(:)-FF))');
Image1=reshape(Ind,256,256);
figure(1);imagesc(Image1)

