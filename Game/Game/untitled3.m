
clc
clear





% text = ['Sacrificing certains of money on a specific category grants the Sun Temple certain boosts and attacks. Those amounts and boosts are listed below. A maxed temple can have boosts    from 3 of the 4 categories of towers, requiring more than   $50,000 per category. If all 4 categories are placed near   the temple, it won''t receive the buff from the class with   the lowest amount of money spent. Sacrificing applies to all towers who''s centers are within the Super Monke''s current  range.'];
text = ['\nSacrificing certains of money on a specific '];

text_length = strlength(text);
text_lines = ceil(text_length/60);
text_floor = floor(text_length/60);


if text_length < 60
     if contains(text,'\n')
        text_length = strlength(text)-2;
        text_lines = ceil(text_length/60);
        text_floor = floor(text_length/60);
        for i = 1:text_lines
            str = "";
            for j = 1:text_length
                str1 = strjoin(extract(text,i*j));
                str = append(str + str1);
            end
            str = erase(text,'\n');
            cprintf('_Blue', '\n%s\n',str)
        end
     else
        for i = 1:text_lines
            str = "";
            for j = 1:text_length
                str1 = strjoin(extract(text,i*j));
                str = append(str + str1);
            end
            cprintf('*Black', '%s\n',str)
        end 
     end
else
    if contains(text,'\n')
        text_length = strlength(text)-2;
        text_lines = ceil(text_length/60);
        text_floor = floor(text_length/60);
        text = erase(text,'\n');
        for i = 1:text_floor
            A(i) = 60;
            z = i;
        end
        if mod(text_length,60) > 0
            A(z+1) = mod(text_length,60);
        end
        for i = 1:text_lines
            str = "";
            for j = 1+(60*(i-1)):A(i)+(60*(i-1))
                str1 = strjoin(extract(text,j));
                str = str + str1;
            end
            
            fprintf('\n%s\n',str)
        end
    else
        for i = 1:text_floor
            A(i) = 60;
            z = i;
        end
        if mod(text_length,60) > 0
            A(z+1) = mod(text_length,60);
        end
        for i = 1:text_lines
            str = "";
            for j = 1+(60*(i-1)):A(i)+(60*(i-1))
                str1 = strjoin(extract(text,j));
                str = str + str1;
            end
            fprintf('%s\n',str)
        end
    end
end