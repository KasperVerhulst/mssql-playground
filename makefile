build:
	docker image build -t mssql-custom .

start:
	docker container run --name db -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=MyPassword1" -p 1433:1433 -d mssql-custom

stop: 
	docker container stop db
	docker container rm db