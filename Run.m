z={'chutki','relax','open','relax','tap','turnleft','turnup','yo'};
Hd=untitled();m=0;c=0;k=0;
 h = actxserver('PowerPoint.Application');
 h.Visible = 1; % make the window show up
 h.Presentations.Open('C:\Users\Prince Saroj\Google Drive\EMG project summer\exel sheets\Presentation2.pptx');
% %%
 h.ActivePresentation.SlideShowSettings.Run;  % there is now a slide show running
 %%
 hShow = h.SlideShowWindows.Item(1);

while(1)
%for i=1:100

    x1=getit();
    x_1=adaptivefiltr(filter(Hd,x1(:,1)));
    x_2=adaptivefiltr(filter(Hd,x1(:,2)));
    x=[x_1' x_2'];
    x=x(51:850,:);
    hand2;
    result=predict(class_hand,f);
    h1=result;
    %m=0;
%     if(m==0)
% if(h1==1)%chedutki
%    m=1;
%     fprintf('Ready to go\n');
% end
%     end
   % h=result;
   % vlc1();
  powerpoint();
    fprintf(z{result});
    fprintf('\n'); 
end
%end
