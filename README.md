# Welcome to the Car Collection Sinatra App!

## Introduction

This app builds out car collections for individual users.

* It includes three models (and their corresponding tables) `Owner`, `Car`, `Brand`  
* A Brand `belongs_to` a Car and a Owner `has_many` Cars.
* Owner and Cars have a "many-to-many" relationship, so we'll need a join table.

**User**

| **id**             | **username**      | **password_digest ** |
|:------------------:|:-----------------:|:--------------------:|
| 1                  | Jim               | 33424234jkflsfajfa   |
| 2                  | George            | 33424234jkflsfadjfa  |
| 3                  | Lee               | dfsakfsdjfdasggk3434 |


**Cars**

| **id** | **Model**  | **Make**  | **make_year** | **price**  | **user_id**  |
|:------:|:----------:|:---------:|:-------------:|:----------:|:------------:|
| 1      | Corvette   | Chevy     | 1998          | 2000       | 1            |
| 2      | Mustang    | Ford      | 2003          | 5000       | 3            |
| 3      | RX-8       | Mazda     | 2001          | 10000      | 2            |



### Models



* A car `belongs_to` a user and a user `has_many` cars.
