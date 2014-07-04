curl -XDELETE 'http://minerva-1003:9200/subscriptions/'
curl -XPUT 'http://minerva-1003:9200/subscriptions/' -d '{
   "mappings": {
        "couchbaseCheckpoint": {
            "dynamic": "true",
            "_source": {
                "includes": [
                    "doc.*"
                ]
            },
            "dynamic_templates": [
                {
                    "store_no_index": {
                        "match": "*",
                        "mapping": {
                            "store": "no",
                            "index": "no",
                            "include_in_all": false
                        }
                    }
                }
            ]
        },
        "couchbaseDocument": {
            "_all": {
                "enabled": false
            },
            "dynamic": "true",
            "_source": {
                "includes": [
                    "meta.*"
                ]
            },
            "dynamic_templates": [
                {
                    "all_strings_to_avoid_collisions": {
                        "match": "*",
                        "mapping": {
                            "store": "no",
                            "index": "not_analyzed",
                            "include_in_all": false,
                            "type": "string",
                            "analyzer": "whitespace"
                        }
                    }
                }
            ],
            "properties": {
                "doc": {
                    "properties": {
                        "callback": {
                            "type": "string"
                        },
                        "source": {
                            "type": "string"
                        },
                        "destination": {
                            "type": "string"
                        },
                        "stream": {
                            "type": "string"
                        },
                        "customFields": {
                            "enabled": false
                        }
                    }
                },
                "meta": {
                    "properties": {
                        "id": {
                            "type": "string",
                            "analyzer": "whitespace"
                        }
                    }
                }
            }
        }
    }
}'
