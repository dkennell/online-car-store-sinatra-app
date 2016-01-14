# Welcome to the Car Collection Sinatra App!

## Introduction

This app builds out car collections for individual users. 

* It includes three models (and their corresponding tables) `Owner`, `Car`, `Brand`  
* A Brand `belongs_to` a Car and a Owner `has_many` Cars. 
* Owner and Cars have a "many-to-many" relationship, so we'll need a join table. 

**User**

| **id**             | **name**          |
|:------------------:|:-----------------:|
| 1                  | Jim               |
| 2                  | George            |
| 3                  | Lee               |
| 4                  | Sarah             |
| 5                  | Sally             |

**Cars**

| **id**             | **name**               | **make_year** |  **user_id**  |
|:------------------:|:----------------------:|:-------------:|:-------------:|
| 1                  | Corvette               | 1998          | 1             |
| 2                  | Mustang                | 2003          | 4             |
| 3                  | RX-8                   | 2001          | 2             |



### Models



* A car `belongs_to` a user and a user `has_many` cars.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

