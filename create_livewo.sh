curl -XDELETE 'http://localhost:9200/livewo/'
curl -XPUT 'http://localhost:9200/livewo/' -d '{
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
                    "dates_are_date": {
                        "path_match": "doc.date",
                        "mapping": {
                            "index": "not_analyzed",
                            "type": "date"
                        }
                    }
                },
                {
                    "user_timestamp_are_date": {
                        "path_match": "doc.user_timestamp",
                        "mapping": {
                            "index": "not_analyzed",
                            "type": "date"
                        }
                    }
                }
            ],
            "properties": {
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
