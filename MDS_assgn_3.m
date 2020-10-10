%---------------- Mathematics for Data science ---------------------------%
%------------------------ Homework 3 -------------------------------------%

%----------------------------- Problem 1 ---------------------------------%
% Plot and contour of f(x,y)=x^2- y^2 , -5<=x<=5 & -5<=y<=5

clear
clc
close all

figure('name','Plot of f(x,y)=x^2- y^2')
[x,y]=meshgrid(-5:0.05:5);
z=x.^2-y.^2;
mesh(x,y,z)
%shading interp
colorbar;
xlabel('x-axis');ylabel('y-axis');zlabel('z=x^2- y^2');title('f(x,y)=x^2- y^2')
figure('name','Contour Plot of f(x,y)=x^2-y^2')
contourf(x,y,z,20);title('Contour plot of f(x,y)=x^2- y^2')
xlabel('x-axis');ylabel('y-axis');
colorbar;
%%
%----------------------------- Problem 2 ---------------------------------%
% Convex hull of randomly generated 2D points (x,y) , -5<=x<=5 & -5<=y<=5
clear
clc
close all

a=-5;b=5;
points=a+(b-a).*rand(24,2);
boundry_point_rows= convhull(points(:,1),points(:,2));
figure('name','Convex hull of randomly generated 2D points')
scatter(points(:,1),points(:,2),40,'filled','MarkerFacecolor','blue','MarkerEdgecolor','black');hold on;
plot(points(boundry_point_rows,1),points(boundry_point_rows,2),'r','LineWidth',2);
set(gca,'Color','c');hold off;
xlabel('x-axis');ylabel('y-axis');title('Convex hull of randomly generated 2D points (x,y)');
legend('Random points','Convex hull');
%%
% clear
% clc
% close all

% Convex hull of randomly generated 3D points (x,y,z) ,
% x,y and z belongs to [a b]

% a=-5;
% b=5;
% P =a+(b-a).*rand(10,3);
% k = convhulln(P);
% trisurf(k,P(:,1),P(:,2),P(:,3),'FaceColor','cyan')
%%
%----------------------------- Problem 3 ---------------------------------%
% Given f(x)=x'Ax find counter examples(matrix A) for which f(x) is not
% convex. here x is a 2D point and A is any 2x2 real matrix

clear
clc
close all

a=-10;b=10; % range of x1 and x2 
[x1,x2]=meshgrid(a:1:b);
siz=size(x1);
num_points=siz(1)*siz(2); % number of points(2D) in domain of f(x)
F=zeros(siz(1),siz(2));
X=zeros(2,num_points);
k=1;
for i=1:siz(1)
    for j=1:siz(2)
        X(:,k)=[x1(i,j); x2(i,j)]; % matrix containing all the points(2D) 
                                   % in domain of f(x) as columns
        k=k+1;
    end
end

num_of_ex_req=11; % number of counter examples(for which f(x)is concave) required  
counter_ex_matrx=zeros(2,2,num_of_ex_req);
counter_ex_points=zeros(2,1,2,num_of_ex_req);
count=1;

% generate random 2x2 matrix and check if for that matrix 
% there are 2 points in domain of f(x) such that it does not satisfy the condition
% for convexity of the function f(x). collect num_of_ex_req of these matrices
while(count<=num_of_ex_req)

     A=randi([-10,10],2,2);  % generating random 2x2 matrix
     
         % generating 2 random points x,y in domain of f(x)
         rand_index=randi([1,num_points],1,2); 
         x=X(:,rand_index(1));
         y=X(:,rand_index(2));
         
         % checking condition for f(x) to be concave with these points
         if (x'*A*(y-x)) >=(y'*A*(y-x)) 
           
             counter_ex_matrx(:,:,count)=A;
             counter_ex_points(:,1,:,count)=[x y];
             count=count+1;
             
         end  
end


for n=1:num_of_ex_req
    % displaying counter examples matrices along with corresponding points
    A=counter_ex_matrx(:,:,n);
    fprintf('\ncounter example matrix A%d :\n',n);
    disp(A);
    points=counter_ex_points(:,1,:,n);
    fprintf('corresponding example points x,y :\n');
    fprintf('x = [%d ;%d] \t\t y = [%d ;%d]\n',points(:,1,1),points(:,1,2));
 
% Plotting the function for the counter example matrices to verify 
% that f(x) is concave for these matrices   
%   k=1;
%   for i=1:siz(1)
%      for j=1:siz(2)
%         x=X(:,k);
%         F(i,j)=x'*A*x;
%         k=k+1;
%      end
%   end
%   figure('name',"Plot of the function f(x) = x'Ax for the counter example matrix A");
%   surf(x1,x2,F);
%   colorbar;  
%   xlabel('x1-axis');ylabel('x2-axis');zlabel("f(x1,x2) = f(x) = x'Ax");
%   title(sprintf("Plot of the function f(x) = x'A%dx for the counter example matrix A%d",n,n));
end
 





 


 
