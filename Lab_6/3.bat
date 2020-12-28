sc query type= service  > services.txt
net stop DNS-client
sc query type= service > servicesafter.txt
net start DNS-clien
fc services.txt servicesafter.txt /N > servicesdiffer.txt