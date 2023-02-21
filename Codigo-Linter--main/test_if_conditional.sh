
i=1

for((j=1;j<=n;j++))
do

if [ $(((i+j)%2)) -eq 0 ] then
    echo -e -n "\\e[40m "
else
    echo ""
    echo -e -n "\\e[47m "
    echo ""
fi
  echo
done


while [ true ]; do
    echo ""
    echo 'text here'
    echo ""
    exit 0
    
done
