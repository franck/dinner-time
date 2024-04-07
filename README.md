# Dinner time

**Exercise** : https://gist.github.com/quentindemetz/2096248a1e8d362e669350700e1e6add


## JSON requests

Example:

```
curl -X GET -H "Accept: application/json" -H "Content-Type: application/json" -d '{"search_form": {"query": "epices"}}' http://localhost:3000

```



## Deployment

Add unnaccent Pg extension:

```
CREATE EXTENSION unaccent;
```


