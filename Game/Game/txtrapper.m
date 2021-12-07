function txtrapper(text)

text_length = strlength(text);
text_lines = ceil(text_length/60);
text_floor = floor(text_length/60);


if text_length < 60
     if contains(text,'\n')
        text_length = strlength(text)-2;
        text_lines = ceil(text_length/60);
        for i = 1:text_lines
            str = "";
            for j = 1:text_length
                str1 = strjoin(extract(text,i*j));
                str = append(str + str1);
            end
            str = erase(text,'\n');
            fprintf('\n%s\n',str)
        end
     else
        for i = 1:text_lines
            str = "";
            for j = 1:text_length
                str1 = strjoin(extract(text,i*j));
                str = append(str + str1);
            end
            fprintf('%s\n',str)
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