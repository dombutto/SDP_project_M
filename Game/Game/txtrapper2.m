function txtrapper2(text)
new_text = (textwrap(text,60));
[row,~] = size(new_text);
for i = 1:row
    fprintf(new_text{i})
    fprintf('\n')
end