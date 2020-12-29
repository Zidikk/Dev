sc query type= service  > services.txt
net stop DNS-client
sc query type= service > services_1.txt
net start DNS-client
fc services.txt services_1.txt /N > changes.txt
