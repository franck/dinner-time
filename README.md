# Dinner time

**Exercise** : https://gist.github.com/quentindemetz/2096248a1e8d362e669350700e1e6add

**User Stories** : https://spot-slipper-538.notion.site/Dinner-Time-2ecfd41922074f31ba3551bfd43af161

**Website** : https://dinner-time-fdago.fly.dev/


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


