curl -XDELETE 'http://minerva-1003:9200/subscriptions/'
curl -XPUT 'http://minerva-1003:9200/subscriptions/' -d '{
    "mappings": {
        "couchbaseCheckpoint": {
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
        "_default_": {
            "_source": {
                "includes": [
                    "meta.*"
                ]
            },
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
                            "properties": {
                                "groupId": {
                                    "type": "string"
                                }
                            }
                        }
                    }
                },
                "meta": {
                    "properties": {
                        "id": {
                            "type": "string",
									 "analyzer":"whitespace"
                        }
                    }
                }
            }
        }
    }
}'
