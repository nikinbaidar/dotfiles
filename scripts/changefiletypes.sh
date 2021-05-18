
for file in *.wiki;
do
    mv "$file" "$(basename "$file" .wiki).md"
done

