# Users API (PHP Docker) 

```
Technological Institute of Costa Rica
Project2 CompraTec
Teacher: Raul Madrigal Acuña
Students: Raul Arias, Rony Paniagua
Script docker swarm
```
## Installation
You need to have PHP installed in your development environment.
```
1. Download the source repository.
2. Run: php -S localhost:8080/graphql <your_path>/src/graphql/v1/schema.php
3. There is no  interface from browser, you need to use Postman to consume the service.
```
## Orders model
```
id: int
firstname: string
lasttname: string
password: string
```

## API usage

### Consult
To consult all the user, the following query is used: 
```
{
  Users{
    id firstname lastname password
  }
}
```
To consult one user, the following query is used: 
```
{
  User(id:1){
    id firstname lastname password
  }
}
```

### Insert
To insert an user the following mutation is used:
```
mutation{
  CreateUser(user:{id:1, firstname:"A", lastname:"B", password:"123"}){
    info
  }
}
```
The id of each user is unique, so if you try to insert an user with an existing id, there will be a conflict. The result of the mutation will be returned in info.

### Update
To update an user the following mutation is used:
```
mutation{
  UpdateUser(user:{id:1, firstname:"A", lastname:"B", password:"123"}){
    info
  }
}
```
Where the id of the user is received as parameters to modify the other attributes. In the info you will see the result of the mutation

## Delete
To delete an user the following mutation is used:
```
mutation{
  DeleteUser(id:1){
    info
  }
}
```
Where the id of the user to be deleted is received as a parameter, and in the info you will see the result of the mutation.
