build:
	docker image build -t mssql-custom .

start:
	docker container run -name db -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=yourStrong(!)Password" -p 1433:1433 -d mssql-custom

stop: 
	docker container stop db