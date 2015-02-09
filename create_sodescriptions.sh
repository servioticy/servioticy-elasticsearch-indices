curl -XDELETE 'http://localhost:9200/sodescriptions/'
curl -XPUT 'http://localhost:9200/sodescriptions/' -d '{
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
            "dynamic": "false",
            "_source": {
                "includes": [
                    "meta.*"
                ]
            },
            "properties": {
                "doc": {
                    "properties": {
                        "public": {
                            "type": "boolean"
                        },
                        "name": {
                            "type": "string"
                        },
                        "description": {
                            "type": "string"
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
